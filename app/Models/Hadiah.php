<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Hadiah extends Model
{
    use HasFactory;
    protected $table = 'hadiah';
    protected $fillable = [
        'nama','persentase',
    ];
}
