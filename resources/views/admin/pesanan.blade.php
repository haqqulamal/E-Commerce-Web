@extends('layouts.admin')

@section('content')
    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Data Pesanan</h1>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="card shadow mb-4">
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Pesanan</h6>
                    </div>
                    <div class="card-body">
                        <table class="table" id="dttb">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Tanggal</th>
                                    <th>Jam</th>
                                    <th>Total</th>
                                    <th>#</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($data as $k => $v)
                                    <tr>
                                        <td>{{ $k + 1 }}</td>
                                        <td>{{ date('d F Y', strtotime($v->created_at)) }}</td>
                                        <td>{{ date('H:i:s', strtotime($v->created_at)) }}</td>
                                        <td>Rp. {{ number_format($v->total) }}</td>
                                        <td>
                                            <a class="btn btn-info" data-toggle="modal"
                                                data-target="#detail-{{ $k }}"><i
                                                    class="fas fa-search text-white"></i> Detail</a>
                                        </td>
                                    </tr>
                                @endforeach

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
    @foreach ($data as $k => $v)
        <div class="modal fade" id="detail-{{ $k }}" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Detail Pesanan</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Produk</th>
                                    <th>Jumlah</th>
                                    <th>Harga Satuan</th>
                                    <th>Subtotal</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($v->detail_pesanan as $ke => $va)
                                    <tr>
                                        <td>{{ $va->produk->nama }}</td>
                                        <td>{{ $va->jumlah }}</td>
                                        <td class="text-nowrap">Rp. {{ number_format($va->produk->harga) }}</td>
                                        <td class="text-nowrap">Rp. {{ number_format($va->sub_total) }}</td>
                                    </tr>
                                @endforeach
                            <tbody>
                            <tfoot>
                                <tr class="total">
                                    <td colspan="3">Total</td>
                                    <td>Rp. {{ number_format($v->total) }}</td>
                                </tr>
                                <tr class="total">
                                    <td colspan="3">Bayar</td>
                                    <td>Rp. {{ number_format($v->bayar) }}</td>
                                </tr>
                                <tr class="total">
                                    <td colspan="3">Kembalian</td>
                                    <td>Rp. {{ number_format($v->bayar - $v->total) }}</td>
                                </tr>
                            </tfoot>

                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" data-dismiss="modal" aria-label="Close"
                            class="btn btn-primary">Kembali</button>
                    </div>
                </div>
            </div>
        </div>
    @endforeach
@endsection
@section('script')
@endsection
