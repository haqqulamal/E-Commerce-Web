@extends('layouts.admin')

@section('content')
    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Kasir</h1>
        </div>

        <div class="row">
            <div class="col-md-7">
                <div class="card shadow mb-4">
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Produk</h6>
                        <div class="dropdown no-arrow">
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            @foreach ($produk as $k => $v)
                                <div class="col-md-4 mb-4">
                                    <div class="card h-100 shadow">
                                        <img src="{{ asset('assets/produk/' . $v->foto) }}" class="card-img-top"
                                            alt="Produk 1">
                                        <div class="card-body">
                                            <h6 class="card-title">{{ substr($v->nama, 0, 20) . '...' }}</h6>
                                            <p class="card-text">Rp. {{ number_format($v->harga) }}</p>

                                        </div>
                                        <div class="card-footer">
                                            <div class="input-group">
                                                <input type="number" class="form-control" value="1" min="1"
                                                    id="jumlah-{{ $k }}">
                                                <div class="input-group-append">
                                                    <button class="btn btn-primary"
                                                        onclick="tambahProduk({{ $v->id }},'{{ substr($v->nama, 0, 8) }}', {{ $v->harga }}, {{ $k }})"><i class="fa fa-plus" aria-hidden="true"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">Keranjang</h6>
                                <div class="dropdown no-arrow">
                                </div>
                            </div>
                            <div class="card-body table-responsive">
                                <table class="table table-sm table-hover table-bordered" id="cart"
                                    style="font-size: 13px;">
                                    <thead>
                                        <tr>
                                            <th>Nama</th>
                                            <th>Harga</th>
                                            <th>Jml</th>
                                            <th>Sub</th>
                                            <th>#</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="3">Total</td>
                                            <td colspan="2" id="total"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3"></td>
                                            <td colspan="2">
                                                <button data-toggle="modal" data-target="#byr"
                                                    class="btn btn-success btn-block">Bayar</button>
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>
    <div class="modal fade" id="byr" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Uang</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label>Total</label>
                            <input type="text" disabled class="form-control" id="btotal" required>
                        </div>
                        <div class="form-group">
                            <label>Masukan Jumlah Uang</label>
                            <input type="text" class="form-control" id="buang" required>
                        </div>
                        <div class="form-group">
                            <label>Kembalian</label>
                            <input type="text" disabled class="form-control" id="bkembalian" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" id="bayar" disabled class="btn btn-primary">Bayar</button>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('script')
    <script>
        var bayarButton = document.getElementById('bayar');
        var keranjang = []; // Array untuk menyimpan produk yang dibeli
        var total;

        function updateCartTable() {
            var tbody = document.querySelector('#cart tbody');
            var totalElement = document.getElementById('total');

            // Bersihkan isi tabel keranjang
            tbody.innerHTML = '';

            // Hitung total
            total = 0;

            // Iterasi melalui produk dalam keranjang
            keranjang.forEach(function(item, index) {
                var row = tbody.insertRow();
                var namaCell = row.insertCell(0);
                var hargaCell = row.insertCell(1);
                var jumlahCell = row.insertCell(2);
                var subtotalCell = row.insertCell(3);
                var hapusCell = row.insertCell(4);

                namaCell.innerHTML = item.nama;
                hargaCell.innerHTML = 'Rp. ' + numberFormat(item.harga);
                jumlahCell.innerHTML = item.jumlah;
                subtotalCell.innerHTML = 'Rp. ' + numberFormat(item.subtotal);

                // Tombol "Hapus"
                var hapusButton = document.createElement('button');
                hapusButton.textContent = 'Hapus';
                hapusButton.className = 'btn btn-danger';
                hapusButton.onclick = function() {
                    hapusProduk(index);
                };
                hapusCell.appendChild(hapusButton);

                // Tambahkan subtotal ke total
                total += item.subtotal;
            });

            // Tampilkan total
            totalElement.innerHTML = 'Rp. ' + numberFormat(total);
            document.getElementById('btotal').value = 'Rp. ' + numberFormat(total);

        }

        function numberFormat(angka) {
            return angka.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
        }

        function tambahProduk(id, nama, harga, index) {
            var inputJumlah = document.getElementById('jumlah-' + index);
            var jumlah = parseInt(inputJumlah.value);

            if (!isNaN(jumlah) && jumlah > 0) {
                var existingProduct = keranjang.find(function(item) {
                    return item.nama === nama;
                });

                if (existingProduct) {
                    // Produk sudah ada, tambahkan jumlahnya
                    existingProduct.jumlah += jumlah;
                    existingProduct.subtotal += harga * jumlah;
                } else {
                    // Produk belum ada, tambahkan produk ke keranjang
                    var subtotal = harga * jumlah;
                    keranjang.push({
                        id: id,
                        nama: nama,
                        harga: harga,
                        jumlah: jumlah,
                        subtotal: subtotal
                    });
                }

                // Perbarui tabel keranjang
                updateCartTable();
            } else {
                alert('Jumlah tidak valid.');
            }
        }

        function hapusProduk(index) {
            keranjang.splice(index, 1);
            // Perbarui tabel keranjang setelah menghapus produk
            updateCartTable();
        }
        var buangInput = document.getElementById('buang');
        buangInput.addEventListener('input', function() {
            var buang = parseFloat(buangInput.value.replace(/[^\d.]/g, ''));

            if (isNaN(buang) || buang < total) {
                document.getElementById('bkembalian').value = 'Rp. 0';
                bayarButton.disabled = true;
            } else {
                var kembalian = buang - total;
                document.getElementById('bkembalian').value = 'Rp. ' + numberFormat(kembalian);
                bayarButton.disabled = false;
            }
        });

        bayarButton.addEventListener('click', function() {
            var buang = parseFloat(buangInput.value.replace(/[^\d.]/g, ''));
            if (isNaN(buang) || buang < total) {
                alert('Jumlah uang tidak valid atau tidak mencukupi.');
            } else {
                // Persiapkan data untuk dikirim
                var data = {
                    keranjang: keranjang,
                    total: total,
                    uang: buang
                };

                var keranjangData = JSON.stringify(keranjang);

                var url = '{{ route('kasir-tambah') }}' + '?total=' + total + '&buang=' + buang + '&keranjang=' +
                    encodeURIComponent(keranjangData);

                // Lakukan pengalihan ke URL `/proses` dengan parameter GET
                window.location.href = url;
                // Kirim data dengan metode POST menggunakan fetch API
                // fetch('{{ route('kasir-tambah') }}', {
                //     method: 'POST',
                //     headers: {
                //         'Content-Type': 'application/json'
                //     },
                //     body: JSON.stringify(data)
                // }).then(function(response) {
                //     if (response.ok) {
                //         // Redirect ke halaman lain jika berhasil
                //         window.location.href = '/halaman-lain';
                //     } else {
                //         alert('Terjadi kesalahan dalam pemrosesan pembayaran.');
                //     }
                // }).catch(function(error) {
                //     alert('Terjadi kesalahan dalam pemrosesan pembayaran.');
                // });
            }
        });
    </script>
@endsection
