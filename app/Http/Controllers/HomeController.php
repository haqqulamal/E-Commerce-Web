<?php

namespace App\Http\Controllers;

use App\Models\Hadiah;
use App\Models\Kategori;
use App\Models\Produk;
use App\Models\Voucher;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //$this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home', [
            "kategori" => Kategori::get()
        ]);
    }
    public function spin()
    {
        $data_hadiah = Hadiah::get();
        $hadiah = NULL;
        foreach ($data_hadiah as $key => $value) {
            $randomColor = "#" . str_pad(dechex(mt_rand(0, 255)), 2, '0', STR_PAD_LEFT) .
                str_pad(dechex(mt_rand(0, 255)), 2, '0', STR_PAD_LEFT) .
                str_pad(dechex(mt_rand(0, 255)), 2, '0', STR_PAD_LEFT);

            $hadiah[$key]['fillStyle'] = $randomColor;
            $hadiah[$key]['text'] = $value->nama;
        }
        return view('spin', [
            'voucher' => Voucher::whereIn('digunakan', [1, 2])
                ->latest('updated_at') // Mengurutkan data berdasarkan kolom "updated_at" terbaru
                ->take(5)
                ->get(),
            'hadiah' => $hadiah,
        ]);
    }
    public function detail($id)
    {
        return view('detail', [
            "produk" => Produk::find($id)
        ]);
    }
    public function kode(Request $request)
    {
        $kode = $request->kode;
        $cek = Voucher::where('kode', $kode)->first();
        if ($cek) {
            if ($cek->digunakan == 0) {
                $dha = Hadiah::get();
                $randomha = [];
                foreach ($dha as $key => $value) {
                    for ($i = 0; $i < $value->persentase; $i++) {
                        $randomha[] = $key + 1;
                    }
                }
                $at = array_rand($randomha);
                $stopAt = (30 * $randomha[$at]) - rand(2, 28);
                return Response::json(['success' => 1, 's' => $stopAt]);
            } else {
                return Response::json(['success' => 2]);
            }
        } else {
            return Response::json(['success' => 3]);
        }
    }
    public function update_kode(Request $request)
    {
        $kode = $request->kode;
        Voucher::where('kode', $kode)->update([
            'digunakan' => 1,
            'hadiah' => $request->hadiah
        ]);
        return Response::json(['success' => true]);
    }
}
