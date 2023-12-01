<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pesanan extends Model
{
    use HasFactory;

    protected $table = 'pesanan';
    protected $fillable = [
        'bayar',
        'total',
        'status',
    ];

    public function detail_pesanan()
    {
        return $this->hasMany(DetailPesanan::class);
    }
}
