<?php

namespace App\Http\Controllers;

use App\Models\DetailPesanan;
use App\Models\Kategori;
use App\Models\Pesanan;
use App\Models\Produk;
use App\Models\Voucher;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\File;

class AdminController extends Controller
{
    public function home()
    {
        $hari = Pesanan::whereDate('created_at', Carbon::today())->sum('total');

        $semua = Pesanan::sum('total');
        $data = DB::table('pesanan')
            ->select(
                DB::raw('DATE_FORMAT(created_at, "%Y-%m") as bulan'),
                DB::raw('SUM(total) as total_per_bulan')
            )
            ->groupBy('bulan')
            ->orderBy('bulan')
            ->get();

        $perbulan = $data->pluck('bulan')->toArray();
        $totalperbulan = $data->pluck('total_per_bulan')->toArray();

        $k =  [
            'perbulan' => $perbulan,
            'totalperbulan' => $totalperbulan,
        ];
        $pesanan = Pesanan::count();
        $produk = Produk::count();
        return view('admin.home',[
            'hari' => $hari,
            'semua' => $semua,
            'per' => $k,
            'pesanan' => $pesanan,
            'produk' => $produk
        ]);
    }
    public function kasir()
    {
        return view('admin.kasir', [
            "produk" => Produk::all()
        ]);
    }
    public function kasir_tambah(Request $request)
    {

        $keranjang = json_decode($request->get('keranjang'), true);
        $pesanan = Pesanan::create([
            "total" => $request->total,
            'bayar' => $request->buang,
            'status' => 1
        ]);

        // Simpan detail penjualan (produk dalam keranjang)
        foreach ($keranjang as $item) {
            DetailPesanan::create([
                "pesanan_id" => $pesanan->id,
                "produk_id" => $item['id'],
                "jumlah" => $item['jumlah'],
                "sub_total" => $item['subtotal'],
            ]);
        }
        $voucher = null;
        if ($pesanan->total >= 2000000) {
            $voucher = Voucher::create([
                "kode" => Str::random(8)
            ]);
        }
        return view('admin.nota', ['pesanan' => $pesanan, "voucher" => $voucher]);
    }
    public function produk()
    {
        return view('admin.produk', [
            'data' => Produk::get(),
            'kategori' => Kategori::get()
        ]);
    }
    public function produk_tambah(Request $request)
    {
        // Validasi data input sesuai kebutuhan Anda
        $this->validate($request, [
            'kategori_id' => 'required',
            'nama' => 'required',
            'harga' => 'required',
            'deskripsi' => 'required',
            'foto' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048', // Batasan file gambar
        ]);

        // Simpan data produk
        $produk = new Produk;
        $produk->kategori_id = $request->kategori_id;
        $produk->nama = $request->nama;
        $produk->harga = $request->harga;
        $produk->deskripsi = $request->deskripsi;

        // Cek apakah file gambar sudah diunggah
        if ($request->hasFile('foto')) {
            // Dapatkan file gambar
            $file = $request->file('foto');
            // Generate nama file unik
            $fileName = time() . '_' . $file->getClientOriginalName();
            // Pindahkan file gambar ke direktori yang sesuai (public/assets/produk)
            $file->move(public_path('assets/produk'), $fileName);
            // Simpan nama file gambar ke dalam database
            $produk->foto = $fileName;
        }

        $produk->save();

        // Tampilkan pesan sukses dengan Swal
        return back()->with('success', 'Produk berhasil ditambahkan');
    }
    public function produk_edit(Request $request, $id)
    {
        // Validasi data input sesuai kebutuhan Anda
        $this->validate($request, [
            'kategori_id' => 'required',
            'nama' => 'required',
            'harga' => 'required',
            'deskripsi' => 'required',
            'foto' => 'image|mimes:jpeg,png,jpg,gif|max:2048', // Batasan file gambar
        ]);

        // Temukan produk berdasarkan ID
        $produk = Produk::find($id);

        if (!$produk) {
            return back()->with('error', 'Produk tidak ditemukan');
        }

        // Perbarui data produk
        $produk->kategori_id = $request->kategori_id;
        $produk->nama = $request->nama;
        $produk->harga = $request->harga;
        $produk->deskripsi = $request->deskripsi;

        // Cek apakah file gambar baru diunggah
        if ($request->hasFile('foto')) {
            // Hapus file gambar lama jika ada
            if ($produk->foto) {
                File::delete(public_path('assets/produk/' . $produk->foto));
            }
            // Dapatkan file gambar baru
            $file = $request->file('foto');
            // Generate nama file unik
            $fileName = time() . '_' . $file->getClientOriginalName();
            // Pindahkan file gambar baru ke direktori yang sesuai (public/assets/produk)
            $file->move(public_path('assets/produk'), $fileName);
            // Simpan nama file gambar baru ke dalam database
            $produk->foto = $fileName;
        }

        $produk->save();

        // Tampilkan pesan sukses dengan Swal
        return back()->with('success', 'Produk berhasil diperbarui');
    }
    public function produk_hapus($id)
    {
        $produk = Produk::find($id);
        if (!$produk) {
            return back()->with('error', 'Produk tidak ditemukan');
        }

        // Hapus file gambar terkait jika ada
        if ($produk->foto) {
            File::delete(public_path('assets/produk/' . $produk->foto));
        }

        $produk->delete();

        // Tampilkan pesan sukses dengan Swal
        return back()->with('success', 'Produk berhasil dihapus');
    }
    public function kategori()
    {
        return view('admin.Kategori', [
            'data' => Kategori::get(),
        ]);
    }
    public function kategori_tambah(Request $request)
    {
        // Validasi data input sesuai kebutuhan Anda
        $this->validate($request, [
            'nama' => 'required',
        ]);

        // Simpan data Kategori
        $Kategori = new Kategori;
        $Kategori->nama = $request->nama;
        $Kategori->save();

        // Tampilkan pesan sukses dengan Swal
        return back()->with('success', 'Kategori berhasil ditambahkan');
    }
    public function kategori_edit(Request $request, $id)
    {
        // Validasi data input sesuai kebutuhan Anda
        $this->validate($request, [
            'nama' => 'required',
        ]);

        // Temukan Kategori berdasarkan ID
        $Kategori = kategori::find($id);

        if (!$Kategori) {
            return back()->with('error', 'Kategori tidak ditemukan');
        }

        // Perbarui data Kategori
        $Kategori->nama = $request->nama;
        $Kategori->save();

        // Tampilkan pesan sukses dengan Swal
        return back()->with('success', 'Kategori berhasil diperbarui');
    }
    public function kategori_hapus($id)
    {
        $Kategori = Kategori::find($id);
        if (!$Kategori) {
            return back()->with('error', 'Kategori tidak ditemukan');
        }
        $Kategori->delete();

        // Tampilkan pesan sukses dengan Swal
        return back()->with('success', 'Kategori berhasil dihapus');
    }
    public function pesanan()
    {
        return view('admin.pesanan', [
            'data' => Pesanan::get()
        ]);
    }
    public function hadiah(Request $request)
    {
        $cek = NULL;
        if ($request->kode) {
            $cek = Voucher::where('kode', $request->kode)->first();
            if ($cek) {
                if ($cek->digunakan == 0) {
                    return back()->with('warning', 'Silahkan spin dulu voucher');
                } else if ($cek->digunakan == 1) {
                    $cek->digunakan = 2;
                    $cek->save();
                    return back()->with('success', 'Voucher berhasil ditukar dengan hadiah : ' . $cek->hadiah);
                } else {
                    return back()->with('error', 'Vocher sudah di tukarkan');
                }
            } else {
                return back()->with('error', 'Vocher salah cek kembali voucher');
            }
        }
        return view('admin.hadiah', [
            'belum' => Voucher::where('digunakan', 0)->get(),
            'sudah' => Voucher::where('digunakan', 1)->get(),
            'ditukar' => Voucher::where('digunakan', 2)->get(),
            'data' => $cek
        ]);
    }
}
