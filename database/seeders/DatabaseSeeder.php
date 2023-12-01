<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models\DetailPesanan;
use App\Models\Hadiah;
use App\Models\Kategori;
use App\Models\Keranjang;
use App\Models\Pesanan;
use App\Models\Produk;
use App\Models\User;
use App\Models\Wishlist;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);

        User::create([
            'name' => 'Admin',
            'email' => 'admin@gmail.com',
            'password' => Hash::make('password'),
            'role' => 0
        ]);
        Hadiah::create([
            'nama' => 'Saldo OVO 100k',
            'persentase' => 30
        ]);
        Hadiah::create([
            'nama' => 'Robot Earbuds',
            'persentase' => 10
        ]);
        Hadiah::create([
            'nama' => 'Setrika',
            'persentase' => 15
        ]);
        Hadiah::create([
            'nama' => 'Kompor Gas',
            'persentase' => 5
        ]);
        Hadiah::create([
            'nama' => 'Laptop',
            'persentase' => 1
        ]);

        Hadiah::create([
            'nama' => 'Zonk',
            'persentase' => 30
        ]);
        Hadiah::create([
            'nama' => 'Kulkas',
            'persentase' => 2
        ]);
        Hadiah::create([
            'nama' => 'Kipas Angin',
            'persentase' => 7
        ]);

        $kategori1 = Kategori::create(['nama' => 'Kopi']);

        $kategori2 = Kategori::create(['nama' => 'Non-Kopi']);

        Produk::create([
            'kategori_id' => $kategori1->id,
            'nama' => 'espersso',
            'harga' => 12294,
            'deskripsi' => 'kopi tai luwak',
            'foto' => 'espersso.png'
        ]);

        Produk::create([
            'kategori_id' => $kategori2->id,
            'nama' => 'Teh',
            'harga' => 8000,
            'deskripsi' => 'teh kalimantan',
            'foto' => 'es_teh.png'
        ]);
    }
}
