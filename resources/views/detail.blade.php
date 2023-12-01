<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detail Produk</title>

    <!-- Tambahkan Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        .product-image {
            max-width: 100%;
            height: auto;
        }
        .centered-text {
            text-align: center;
            font-size: 24px;
            padding: 20px;
        }
        .page-border {
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            border: 10px solid #007bff; /* Ubah warna sesuai keinginan Anda */
        }
    </style>
</head>
<body>
    <div class="page-border"></div>
    <div class="container">
        <h1 class="centered-text">Detail Produk</h1>
        <div class="row">
            <div class="col-md-6">
                <img src="{{ asset('assets/produk/'.$produk->foto) }}" alt="Gambar Produk" class="product-image">
            </div>
            <div class="col-md-6">
                <h3>{{ $produk->nama }}</h3>
                <p><strong>Kategori:</strong> {{ $produk->kategori->nama }}</p>
                <p>{{ $produk->deskripsi }}</p>
                <h5><strong>Harga :</strong> Rp. {{ number_format($produk->harga) }}</h5>
            </div>
        </div>
    </div>

    <!-- Tambahkan Bootstrap JS dan jQuery (Opsional) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
