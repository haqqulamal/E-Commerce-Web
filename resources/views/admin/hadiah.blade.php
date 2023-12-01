@extends('layouts.admin')

@section('content')
    <div class="container-fluid">
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Voucher</h1>
        </div>

        <!-- Content Row -->
        <div class="row">
            <div class="col-md-6 mb-4">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                    Belum ditukar</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{ $belum->count() + $sudah->count() }}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-md-6 mb-4">
                <div class="card border-left-success shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                    Sudah ditukar</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{ $ditukar->count() }}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-gift fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Content Row -->

        <div class="row">
            <div class="col-md-12">
                <div class="card shadow mb-4">
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Vocuher Ditukarkan</h6>
                        <form class="form-inline" method="GET" action="{{ route('hadiah') }}" >
                            @csrf
                            <div class="form-group mx-sm-3 mb-2">
                                <input type="text" class="form-control" name="kode" placeholder="kode">
                            </div>
                            <button type="submit" class="btn btn-primary mb-2">Tukarkan</button>
                        </form>
                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                        <table class="table" id="dttbh">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Kode</th>
                                    <th>Hadiah</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($ditukar as $k => $v)
                                    <tr>
                                        <td>{{ $k + 1 }}</td>
                                        <td>{{ $v->kode }}</td>
                                        <td>{{ $v->hadiah }}</td>
                                    </tr>
                                @endforeach

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
@endsection
