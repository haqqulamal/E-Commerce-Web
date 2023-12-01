@extends('layouts.home')

@section('content')
    <style>
        .the_wheel {
            background-image: url(./basic_code_wheel/wheel_back.png);
            background-position: center;
            background-repeat: none;
        }

        .tengah {
            margin-left: auto;
            margin-right: auto;
        }

        .btn-putar {
            font-weight: 1000;
            font-size: 27px;
            letter-spacing: 1px;
            display: inline-block;
            padding: 12px 36px;
            border-radius: 50px;
            transition: 0.5s;
            color: #fff;
            background: var(--color-primary);
            box-shadow: 0 8px 28px rgba(3, 33, 129, 0.2);
            width: 100%;
        }
        .btn-putar:hover {
            font-weight: 1000;
            font-size: 27px;
            letter-spacing: 1px;
            display: inline-block;
            padding: 12px 36px;
            border-radius: 50px;
            transition: 0.5s;
            color: #fff;
            background: rgb(0, 68, 128);
            box-shadow: 0 8px 28px rgba(3, 33, 129, 0.2);
            width: 100%;
        }

        .card-header {
            font-weight: 500;
            font-size: 20px;
            border-radius: 50px;
            color: #fff;
            background: rgb(1, 25, 92);
            width: 100%;
        }

        .card {
            height: 70%;
        }
    </style>
    <section id="spin" class="about">
        <div class="container">
            <div class="justify-content-center">
                <div class="row">
                    <div class="col-md-6">
                        <table class="tengah" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td></td>
                                <td width="438" height="582" class="the_wheel align-middle" align="center"
                                    valign="center">
                                    <canvas id="canvas" width="434" height="434">
                                        <p style="{color: white}" align="center"></p>
                                    </canvas>
                                </td>
                                <td></td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-md-6">
                        <div class="row mb-4 mt-4">
                            <button class="btn-putar" id="spinb" type="button">Putar</button>
                        </div>
                        <div class="card">
                            <div class="card-header w-100 text-center">Riwayat spin</div>
                            <div class="card-body">
                                <ul style="list-style-type: disc; font-size: 18px; font-weight: bold;">
                                    @foreach ($voucher as $k => $v)
                                        <li>Pada {{ date('d-m-Y H:i', strtotime($v->updated_at)) }}, seseorang mendapatkan
                                            {{ $v->hadiah }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </section>
    <script>
        // Create new wheel object specifying the parameters at creation time.
        var kodev;
        let theWheel = new Winwheel({
            'numSegments': 8, // Specify number of segments.
            'outerRadius': 212, // Set outer radius so wheel fits inside the background.
            'textFontSize': 20, // Set font size as desired.
            'segments': <?= json_encode($hadiah) ?>,
            'animation': // Specify the animation to use.
            {
                'type': 'spinToStop',
                'duration': 5, // Duration in seconds.
                'spins': 8, // Number of complete spins.
                'callbackFinished': alertPrize
            }
        });

        function alertPrize(indicatedSegment) {
            // Do basic alert of the segment text. You would probably want to do something more interesting with this information.
            //alert("You have won " + indicatedSegment.text);
            fetch('{{ route('update_kode') }}?kode=' + kodev + '&hadiah=' + indicatedSegment.text, {
                    method: 'GET',
                })
                .then(response => response.json())
                .then(data => {
                    // Lakukan sesuatu dengan respons jika diperlukan
                    Swal.fire({
                        title: 'Hore',
                        text: 'Selamat Anda memenangkan ' + indicatedSegment.text +
                            ' tunjukan kode atau screenshot ke kasir',
                        imageUrl: 'assets/hadiah.png',
                        imageWidth: 250,
                        imageHeight: 250,
                        imageAlt: 'Custom image',
                    })
                    .then((result) => {
                        if (result.isConfirmed) {
                            // Merefresh halaman
                            location.reload();
                        }
                    });

                })
                .catch(error => {
                    console.log(error);
                });

        }
        function calculatePrize(x) {
            theWheel.animation.stopAngle = x;
            theWheel.startAnimation();
        }

        $(document).ready(function() {
            $("#spinb").click(function() {
                Swal.fire({
                    title: 'Masukan Kode',
                    input: 'text',
                    inputAttributes: {
                        autocapitalize: 'off'
                    },
                    showCancelButton: true,
                    confirmButtonText: 'Spin',
                    showLoaderOnConfirm: true,
                    preConfirm: (kode) => {
                        // Kirim kode sebagai parameter dalam URL
                        return fetch('{{ route('kode') }}?kode=' + kode, {
                                method: 'GET',
                            })
                            .then(response => response.json())
                            .then(data => {
                                if (data.success == 1) {
                                    //theWheel.startAnimation();
                                    calculatePrize(data.s);
                                    kodev = kode
                                } else if (data.success == 2) {
                                    Swal.fire('Kode Tidak Valid',
                                        'kode sudah digunakan', 'warning');
                                } else {
                                    Swal.fire('Kode Tidak Valid',
                                        'Silakan masukkan kode yang valid.', 'error');
                                }
                            })
                            .catch(error => {
                                console.error('Error:', error);
                            });
                    },
                    allowOutsideClick: () => !Swal.isLoading()
                });
            });
        });
    </script>
@endsection
