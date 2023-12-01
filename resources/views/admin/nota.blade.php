<html>

<head>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
        }

        .container {
            width: 90%;
            max-width: 700px;
            margin: 10px auto;
            border: 1px solid #ccc;
            padding: 20px;
        }

        .header {
            display: flex;
            align-items: center;
        }

        .logo {
            width: 100px;
            height: 100px;
        }

        .company {
            margin-left: 20px;
        }

        .company h1 {
            margin: 0;
        }

        .company p {
            margin: 5px 0;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table th,
        .table td {
            border: 1px solid #ccc;
            padding: 10px;
        }

        .table th {
            text-align: left;
        }

        .table td:last-child {
            text-align: right;
        }

        .total {
            font-weight: bold;
        }
        @media print {
            #kembali {
                display: none;
            }
        }
    </style>
</head>

<body>

    <div class="container" id="kembali">
        <a href="{{ route('kasir') }}" class="btn btn-primary">Kembali ke Kasir</a>
    </div>
    <div class="container">
        <div class="header">
            <img src="{{ asset('logo.jpg') }}" alt="Logo" class="logo">
            <div class="company">
                <h1>CumTech</h1>
                <p>Jl. Surabaya</p>
                <p>Phone: 08123456789</p>
                <p>Email: kelompok3@cum.tech</p>
            </div>
        </div>
        <h2>Nota Transaksi</h2>
        <p>No. Nota: T-0{{ $pesanan->id }}</p>
        <p>Tanggal: {{ date('d F Y - H:i:s', strtotime($pesanan->created_at)) }}</p>
        <table class="table">
            <tr>
                <th>Produk</th>
                <th>Jumlah</th>
                <th>Harga Satuan</th>
                <th>Subtotal</th>
            </tr>
            @foreach ($pesanan->detail_pesanan as $k => $v)
                <tr>
                    <td>{{ $v->produk->nama }}</td>
                    <td>{{ $v->jumlah }}</td>
                    <td>Rp. {{ number_format($v->produk->harga) }}</td>
                    <td>Rp. {{ number_format($v->sub_total) }}</td>
                </tr>
            @endforeach
            <tr class="total">
                <td colspan="3">Total</td>
                <td>Rp. {{ number_format($pesanan->total) }}</td>
            </tr>
            <tr class="total">
                <td colspan="3">Bayar</td>
                <td>Rp. {{ number_format($pesanan->bayar) }}</td>
            </tr>
            <tr class="total">
                <td colspan="3">Kembalian</td>
                <td>Rp. {{ number_format($pesanan->bayar - $pesanan->total) }}</td>
            </tr>
            @if ($voucher)
                <tr class="total">
                    <td colspan="3">Kode Voucher</td>
                    <td>{{ $voucher->kode }}</td>
                </tr>
            @endif

        </table>
        @if ($voucher)
        <p>note : gunakan voucher untuk spin di web CumTech untuk mendapatkan berbagai hadiah</p>
        @endif

    </div>
    <script>
        // Fungsi untuk mencetak halaman
        function printPage() {
            window.print();
        }

        // Mencetak halaman otomatis saat halaman sudah ter-load
        window.onload = function() {
            printPage();
        };
    </script>

</body>


</html>
