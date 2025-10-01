<?php

namespace App\Http\Controllers;


use App\Models\Permintaan;
use App\Models\Pengiriman;
use Illuminate\Http\Request;
use App\Models\PengirimanDetail;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use App\Models\DetailBarang;
use Illuminate\Support\Facades\Log;

class SuperAdminController extends Controller
{
    public function dashboard(Request $request)
    {
        $date = $request->input('date', Carbon::today()->toDateString());

        // --- Barang Masuk ---
        $groups = DB::table('detail_barang')
            ->select('jenis_id', 'tipe_id', DB::raw('SUM(quantity) as total_qty'), DB::raw('MAX(id) as latest_id'))
            ->whereDate('tanggal', $date)
            ->groupBy('jenis_id', 'tipe_id')
            ->get();

        if ($groups->isEmpty()) {
            $detailMasuk = collect();
            $totalMasuk = 0;
        } else {
            $latestIds = $groups->pluck('latest_id')->filter()->all();
            $latestRecords = DetailBarang::with(['jenis', 'tipe'])
                ->whereIn('id', $latestIds)
                ->get()
                ->keyBy('id');

            $detailMasuk = $groups->map(function ($g) use ($latestRecords, $date) {
                $r = $latestRecords->get($g->latest_id);
                return (object) [
                    'id' => $g->latest_id,
                    'tiket_sparepart' => $r ? $r->tiket_sparepart : null,
                    'jenis_nama' => $r && $r->jenis ? $r->jenis->nama : null,
                    'tipe_nama' => $r && $r->tipe ? $r->tipe->nama : null,
                    'total_qty' => (int) $g->total_qty,
                    'tanggal' => $r ? $r->tanggal : $date,
                ];
            })->sortByDesc('tiket_sparepart')->values();

            $totalMasuk = $groups->count(); // ✅ INI YANG BENAR
        }

        // --- Barang Keluar ---
        $detailKeluar = PengirimanDetail::with('pengiriman')
            ->whereHas('pengiriman', function ($query) use ($date) {
                $query->whereDate('tanggal_transaksi', $date);
            })
            ->orderBy('id', 'desc')->take(5)
            ->get()
            ->map(function ($item) {
                return (object) [
                    'id' => $item->id,
                    'nama_barang' => $item->nama ?? '-',
                    'jumlah' => $item->jumlah ?? 0,
                    'tanggal' => $item->pengiriman?->tanggal_transaksi ?? '-',
                    'tiket' => $item->tiket_pengiriman ?? '-',
                ];
            });

                $totalKeluar = Pengiriman::whereDate('tanggal_transaksi', $date)->count();


        // --- Pending ---
        $totalPending = Permintaan::whereDate('tanggal_permintaan', $date)
            ->where('status_gudang', 'pending')
            ->count();
        // ... (kode pending tetap sama)

        return view('superadmin.dashboard', compact(
            'detailMasuk',
            'detailKeluar',
            'totalMasuk',
            'totalKeluar',
            'totalPending',
            'date'
        ));
    }

    public function requestIndex(Request $request)
{
    $user = Auth::user();

    // 🔹 Query untuk TOTAL (tanpa filter tanggal)
    $totalQuery = Permintaan::query();
    if ($user->id === 15) {
        $totalQuery->where('status_ro', 'approved')
            ->where('status_gudang', 'approved')
            ->whereNotIn('status_admin', ['approved', 'rejected']);
    } elseif ($user->id === 16) {
        $totalQuery->where('status_admin', 'approved')
            ->whereNotIn('status_super_admin', ['approved', 'rejected']);
    }
    $totalRequests = $totalQuery->count();

    // 🔹 Query untuk TABEL (dengan filter tanggal)
    $tableQuery = Permintaan::with(['user', 'details', 'pengiriman.details']);
    
    // Filter tanggal hanya untuk tabel
    if ($request->filled('start_date')) {
        $tableQuery->whereDate('tanggal_permintaan', '>=', $request->input('start_date'));
    }
    if ($request->filled('end_date')) {
        $tableQuery->whereDate('tanggal_permintaan', '<=', $request->input('end_date'));
    }

    // Role-based untuk tabel
    if ($user->id === 15) {
        $requests = $tableQuery->where('status_ro', 'approved')
            ->where('status_gudang', 'approved')
            ->whereNotIn('status_admin', ['approved', 'rejected'])
            ->orderBy('id', 'desc')
            ->paginate(10);
    } elseif ($user->id === 16) {
        $requests = $tableQuery->where('status_admin', 'approved')
            ->whereNotIn('status_super_admin', ['approved', 'rejected'])
            ->orderBy('id', 'desc')
            ->paginate(10);
    } else {
        $requests = new LengthAwarePaginator([], 0, 10);
    }

    return view('superadmin.request', compact('requests', 'totalRequests'));
}

    public function historyIndex(Request $request)
    {
        $user = Auth::user();

        $query = Permintaan::with(['user', 'details', 'pengiriman.details'])
            ->where(function ($q) use ($user) {
                // Untuk Admin (ID 15): tampilkan yang dia approve/reject
                if ($user->id === 15) {
                    $q->where('status_admin', 'approved')
                        ->orWhere('status_admin', 'rejected');
                }
                // Untuk Super Admin (ID 16): tampilkan yang dia approve/reject
                elseif ($user->id === 16) {
                    $q->where('status_super_admin', 'approved')
                        ->orWhere('status_super_admin', 'rejected');
                }
            })
            ->orWhereHas('pengiriman') // atau sudah dikirim
            ->orderBy('id', 'desc');

        // Filter tanggal
        if ($request->filled('dateFrom')) {
            $query->whereDate('tanggal_permintaan', '>=', $request->input('dateFrom'));
        }
        if ($request->filled('dateTo')) {
            $query->whereDate('tanggal_permintaan', '<=', $request->input('dateTo'));
        }

        $requests = $query->distinct()->paginate(10)->withQueryString();

        return view('superadmin.history', compact('requests'));
    }
    /**
     * Approve oleh Admin (Mbak Inong) atau Super Admin (Mas Septian)
     */
    public function approveRequest(Request $request)
    {
        $tiket = $request->tiket;
        $user = Auth::user();

        // 🔹 ADMIN (Mbak Inong) - ID 15
        if ($user->id === 15) {
            $permintaan = Permintaan::where('tiket', $tiket)->firstOrFail();
            $pengiriman = Pengiriman::where('tiket_permintaan', $tiket)->first();

            if ($permintaan->status_ro !== 'approved' || $permintaan->status_gudang !== 'approved') {
                return response()->json([
                    'success' => false,
                    'message' => 'Permintaan belum disetujui oleh RO/Gudang.'
                ], 400);
            }

            // ✅ Set status admin + next step: Super Admin → on progres
            $permintaan->update([
                'status_admin' => 'approved',
                'status_super_admin' => 'on progres',
                'approved_by_admin' => $user->id,
                'catatan_admin' => $request->catatan ?? null,
            ]);

            $pengiriman->update([
                'status' => 'on_delivery'
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Permintaan disetujui oleh Admin (Mbak Inong). Telah dikirim ke Super Admin.'
            ]);
        }

        // 🔹 SUPER ADMIN (Mas Septian) - ID 16
        if ($user->id === 16) {
            $permintaan = Permintaan::where('tiket', $tiket)->firstOrFail();

            if ($permintaan->status_admin !== 'approved') {
                return response()->json([
                    'success' => false,
                    'message' => 'Permintaan belum disetujui oleh Admin.'
                ], 400);
            }

            // ✅ Final approve → close semua status
            $permintaan->update([
                'status_super_admin' => 'approved',
                'approved_by_super_admin' => $user->id,
                'catatan_super_admin' => $request->catatan ?? null,
                'status_barang' => 'on_delivery',
            ]);

            $pengiriman = $permintaan->pengiriman;

            if ($pengiriman) {
                $snList = $pengiriman->details->pluck('sn')->toArray();

                // Kurangi quantity di detail_barang berdasarkan serial_number
                DetailBarang::whereIn('serial_number', $snList)
                    ->decrement('quantity', 1);
            }

            // 🔥 Opsional: close semua status (jika ingin konsisten)
            // $this->closeAllStatus($permintaan);

            return response()->json([
                'success' => true,
                'message' => 'Permintaan disetujui final oleh Super Admin (Mas Septian). Barang siap dikirim.'
            ]);
        }

        return response()->json(['success' => false, 'message' => 'Unauthorized'], 403);
    }

    /**
     * Close semua status menjadi 'close'
     */
    private function closeAllStatus($permintaan)
    {
        $permintaan->update([
            'status_ro' => 'close',
            'status_gudang' => 'close',
            'status_admin' => 'close',
            'status_super_admin' => 'close',
        ]);
    }

    /**
     * Tolak permintaan → broadcast rejected ke semua level
     */
    public function reject(Request $request, $tiket) // ✅ Ambil $tiket dari URL
    {
        try {
            $user = Auth::user();
            $permintaan = Permintaan::where('tiket', $tiket)->firstOrFail();
            $pengiriman = Pengiriman::where('tiket_permintaan', $tiket)->first();

            // 🔹 ADMIN (Mbak Inong) - ID 15
            if ($user->id === 15) {
                if ($permintaan->status_ro !== 'approved' || $permintaan->status_gudang !== 'approved') {
                    return response()->json([
                        'success' => false,
                        'message' => 'Permintaan belum disetujui oleh RO/Gudang.'
                    ], 400);
                }

                $permintaan->update([
                    'status_admin' => 'rejected',
                    'status_super_admin' => 'rejected',
                    'status_gudang' => 'rejected',
                    'status_ro' => 'rejected',
                    'status_barang' => 'rejected', // ✅ 'closed', bukan 'rejected'
                    'approved_by_admin' => $user->id,
                    'catatan_admin' => $request->catatan ?? 'Ditolak oleh Admin (Mbak Inong)',
                    'status' => 'ditolak',
                ]);

                $pengiriman->update([
                    'status' => 'on_delivery',
                ]);

                return response()->json([
                    'success' => true,
                    'message' => 'Permintaan ditolak oleh Admin.'
                ]);
            }

            // 🔹 SUPER ADMIN (Mas Septian) - ID 16
            if ($user->id === 16) {
                if ($permintaan->status_admin !== 'approved') {
                    return response()->json([
                        'success' => false,
                        'message' => 'Permintaan belum disetujui oleh Admin.'
                    ], 400);
                }

                $permintaan->update([
                    'status_super_admin' => 'rejected',
                    'status_admin' => 'rejected',
                    'status_gudang' => 'rejected',
                    'status_ro' => 'rejected',
                    'status_barang' => 'rejected', // ✅ 'closed', bukan 'rejected'
                    'approved_by_super_admin' => $user->id,
                    'catatan_super_admin' => $request->catatan ?? 'Ditolak oleh Super Admin (Mas Septian)',
                    'status' => 'ditolak',
                ]);

                return response()->json([
                    'success' => true,
                    'message' => 'Permintaan ditolak oleh Super Admin.'
                ]);
            }

            return response()->json(['success' => false, 'message' => 'Unauthorized'], 403);
        } catch (\Exception $e) {
            \Log::error('Reject Error: ' . $e->getMessage());
            return response()->json([
                'success' => false,
                'message' => 'Gagal menolak permintaan. Silakan coba lagi.'
            ], 500);
        }
    }
    public function historyDetailApi($tiket)
    {
        try {
            $permintaan = Permintaan::with(['user', 'details', 'pengiriman.details'])
                ->where('tiket', $tiket)
                ->firstOrFail();

            return response()->json([
                'permintaan' => [
                    'tiket' => $permintaan->tiket,
                    'user' => $permintaan->user,
                    'tanggal_permintaan' => $permintaan->tanggal_permintaan,
                    'details' => $permintaan->details,
                ],
                'pengiriman' => $permintaan->pengiriman ? [
                    'tanggal_transaksi' => $permintaan->pengiriman->tanggal_transaksi,
                    'details' => $permintaan->pengiriman->details
                ] : null
            ]);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Data tidak ditemukan'], 404);
        }
    }
}
