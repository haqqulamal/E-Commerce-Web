@extends('layouts.admin')

@section('content')
    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Data produk</h1>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="card shadow mb-4">
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Produk</h6>
                        <div class="dropdown no-arrow">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#tambah">
                                Tambah Produk
                            </button>
                        </div>
                    </div>
                    <div class="card-body">
                        <table class="table" id="dttb">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Nama Produk</th>
                                    <th>Harga</th>
                                    <th>Deskripsi</th>
                                    <th>Kategori</th>
                                    <th>Gambar</th>
                                    <th>#</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($data as $k => $v)
                                    <tr>
                                        <td>{{ $k + 1 }}</td>
                                        <td>{{ $v->nama }}</td>
                                        <td>Rp. {{ number_format($v->harga) }}</td>
                                        <td>{{ $v->deskripsi }}</td>
                                        <td>{{ $v->kategori->nama }}</td>
                                        <td>
                                            <img src="{{ asset('assets/produk/' . $v->foto) }}" width="100px"
                                                height="100px">
                                        </td>
                                        <td>
                                            <a class="btn btn-danger" href="{{ route('produk-hapus',$v->id) }}"><i class="fa fa-trash text-white"
                                                    aria-hidden="true"></i> Hapus</a>

                                            <a class="btn btn-warning" data-toggle="modal"
                                                data-target="#edit-{{ $k }}"><i
                                                    class="fas fa-pencil-alt text-white"></i>Edit</a>
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
    <div class="modal fade" id="tambah" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Tambah Produk</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="{{ route('produk-tambah') }}" method="POST" enctype="multipart/form-data">
                    <div class="modal-body">
                        @csrf
                        <div class="form-group">
                            <label>Nama Produk</label>
                            <input type="text" name="nama" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Harga Produk</label>
                            <input type="number" name="harga" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Deskripsi</label>
                            <textarea class="form-control" name="deskripsi" id="" rows="3"></textarea>
                        </div>
                        <div class="form-group">
                            <label>Kategori</label>
                            <select name="kategori_id" class="form-control" id="">
                                <option value="" selected disabled>Pilih kategori</option>
                                @foreach ($kategori as $ke => $va)
                                    <option value="{{ $va->id }}">{{ $va->nama }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Foto Produk</label>
                            <input type="file" name="foto" class="form-control-file" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Simpan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    @foreach ($data as $k => $v)
        <div class="modal fade" id="edit-{{ $k }}" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Edit Produk</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="{{ route('produk-edit', $v->id) }}" method="POST" enctype="multipart/form-data">

                        <div class="modal-body">
                            @csrf
                            <div class="form-group">
                                <label>Nama Produk</label>
                                <input type="text" name="nama" value="{{ $v->nama }}" class="form-control"
                                    required>
                            </div>
                            <div class="form-group">
                                <label>Harga Produk</label>
                                <input type="number" name="harga" value="{{ $v->harga }}" class="form-control"
                                    required>
                            </div>
                            <div class="form-group">
                                <label>Deskripsi</label>
                                <textarea class="form-control" name="deskripsi" id="" rows="3">{{ $v->deskripsi }}</textarea>
                            </div>
                            <div class="form-group">
                                <label>Kategori</label>
                                <select name="kategori_id" class="form-control" id="">
                                    @foreach ($kategori as $ke => $va)
                                        <option value="{{ $va->id }}"
                                            @if ($va->id == $v->kategori_id) selected @endif>{{ $va->nama }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Foto Produk (isi jika mengganti)</label>
                                <input type="file" name="foto" class="form-control-file">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Simpan</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    @endforeach
@endsection
@section('script')
@endsection
