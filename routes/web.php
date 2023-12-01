<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Route::get('/', function () {
//     return redirect()->route('');
// });

Route::get('/', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get('/detail/{id}', [App\Http\Controllers\HomeController::class, 'detail'])->name('detail');
Route::get('/spin', [App\Http\Controllers\HomeController::class, 'spin'])->name('spin');
Route::get('/check-kode', [App\Http\Controllers\HomeController::class, 'kode'])->name('kode');
Route::get('/update-kode', [App\Http\Controllers\HomeController::class, 'update_kode'])->name('update_kode');

Route::group(['middleware' => 'auth'], function () {
    Route::get('/home', [App\Http\Controllers\AdminController::class, 'home'])->name('admin-home');
    Route::get('/kasir', [App\Http\Controllers\AdminController::class, 'kasir'])->name('kasir');
    Route::get('/kasir-tambah', [App\Http\Controllers\AdminController::class, 'kasir_tambah'])->name('kasir-tambah');

    Route::get('/produk', [App\Http\Controllers\AdminController::class, 'produk'])->name('produk');
    Route::post('/produk-tambah', [App\Http\Controllers\AdminController::class, 'produk_tambah'])->name('produk-tambah');
    Route::post('/produk-edit/{id}', [App\Http\Controllers\AdminController::class, 'produk_edit'])->name('produk-edit');
    Route::get('/produk-hapus/{id}', [App\Http\Controllers\AdminController::class, 'produk_hapus'])->name('produk-hapus');

    Route::get('/kategori', [App\Http\Controllers\AdminController::class, 'kategori'])->name('kategori');
    Route::post('/kategori-tambah', [App\Http\Controllers\AdminController::class, 'kategori_tambah'])->name('kategori-tambah');
    Route::post('/kategori-edit/{id}', [App\Http\Controllers\AdminController::class, 'kategori_edit'])->name('kategori-edit');
    Route::get('/kategori-hapus/{id}', [App\Http\Controllers\AdminController::class, 'kategori_hapus'])->name('kategori-hapus');

    Route::get('/pesanan', [App\Http\Controllers\AdminController::class, 'pesanan'])->name('pesanan');
    Route::get('/hadiah', [App\Http\Controllers\AdminController::class, 'hadiah'])->name('hadiah');
});
Auth::routes();
