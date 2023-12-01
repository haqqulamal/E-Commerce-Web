@extends('layouts.home')

@section('content')
    <section id="about" class="about">
        <div class="container" data-aos="fade-up">

            <div class="section-header">
                <h2>Tentang Kami</h2>
            </div>

            <div class="row gy-4">
                <div class="col-lg-7 position-relative about-img" style="background-image: url(cumtech.jpg) ;"
                    data-aos="fade-up" data-aos-delay="150">

                </div>
                <div class="col-lg-5 d-flex" data-aos="fade-up" data-aos-delay="300">
                    <div class="content ps-0 ps-lg-5">
                        <p class="fst-italic">
                            CumTech adalah toko teknologi yang berdiri sejak tahun 2022, dikelola oleh sekelompok pemuda
                            yang memiliki hasrat mendalam terhadap teknologi. Awalnya, mereka memiliki impian untuk memulai
                            bisnis di usia muda dan menjadikan teknologi sebagai landasan utama. Pendirian CumTech berawal
                            dari minat salah satu anggotanya terhadap teknologi elektronik yang revolusioner.
                        </p>
                        <p class="fst-italic">
                            Berlokasi di Surabaya, tepatnya di Jalan Unesa nomor 1, CumTech menjadi pusat unggulan untuk
                            semua kebutuhan teknologi Anda. Di sini, kami menyediakan beragam produk elektronik terbaru dan
                            inovatif, yang didukung oleh pengetahuan dan semangat pemuda kami yang berdedikasi. Dengan
                            komitmen untuk menghadirkan teknologi terkini kepada pelanggan kami, kami memahami pentingnya
                            berinovasi dan memberikan pengalaman belanja yang unik di dunia teknologi.
                        </p>
                        <p class="fst-italic">
                            CumTech bukan hanya toko biasa, tetapi juga komunitas teknologi yang aktif dalam mengedukasi dan
                            memberikan wawasan kepada para pelanggan kami. Kami percaya bahwa teknologi adalah masa depan,
                            dan kami siap membantu Anda menjelajahi dan memanfaatkan potensi teknologi dengan
                            sebaik-baiknya. Selamat datang di CumTech, tempat di mana teknologi dan inovasi berkumpul, dan
                            masa depan menjadi nyata.
                        </p>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <section id="service" class="why-us section-bg">
        <div class="container" data-aos="fade-up">

            <div class="row gy-4">

                <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
                    <div class="why-box">
                        <h3>Kenapa memilih CumTech?</h3>
                        <p>
                            Outlet terpercaya untuk teknologi elektronik terbaru dan inovatif yang didukung oleh komitmen
                            kami untuk memberikan pengalaman berbelanja teknologi yang unik dan berdedikasi
                        </p>
                    </div>
                </div>

                <div class="col-lg-8 d-flex align-items-center">
                    <div class="row gy-4">

                        <div class="col-xl-4" data-aos="fade-up" data-aos-delay="200">
                            <div class="icon-box d-flex flex-column justify-content-center align-items-center">
                                <i class="bi bi-currency-pound"></i>
                                <h4>Classy</h4>
                                <p>Kemewahan produk yang memuaskan</p>
                            </div>
                        </div>

                        <div class="col-xl-4" data-aos="fade-up" data-aos-delay="300">
                            <div class="icon-box d-flex flex-column justify-content-center align-items-center">
                                <i class="bi bi-shield"></i>
                                <h4>UnBeatable</h4>
                                <p>Kualitas produk terjamin</p>
                            </div>
                        </div>

                        <div class="col-xl-4" data-aos="fade-up" data-aos-delay="400">
                            <div class="icon-box d-flex flex-column justify-content-center align-items-center">
                                <i class="bi bi-cpu-fill"></i>
                                <h4>Modern</h4>
                                <p>Produk terkini dan up-to-date.</p>
                            </div>
                        </div>

                    </div>
                </div>

            </div>

        </div>
    </section>
    <section id="menu" class="menu">
        <div class="container" data-aos="fade-up">

            <div class="section-header">
                <h2>Produk Kita</h2>
                <p>Kenali Produk <span>CumTech</span></p>
            </div>

            <ul class="nav nav-tabs d-flex justify-content-center" data-aos="fade-up" data-aos-delay="200">

                @foreach ($kategori as $key => $value)
                    <li class="nav-item">
                        <a class="nav-link @if ($key == 0) active @endif show" data-bs-toggle="tab"
                            data-bs-target="#menu-{{ $key }}">
                            <h4>{{ $value->nama }}</h4>
                        </a>
                    </li>
                @endforeach
            </ul>


            <div class="tab-content" data-aos="fade-up" data-aos-delay="300">


                @foreach ($kategori as $key => $value)
                    <div class="tab-pane fade @if($key == 0) active @endif show" id="menu-{{ $key }}">

                        <div class="tab-header text-center">
                            <p>Produk</p>
                        </div>

                        <div class="row gy-5">

                            @foreach ($value->produk as $k => $v)
                                <div class="col-lg-4 menu-item">
                                    <a class="glightbox" href="{{ route('detail',$v->id) }}">
                                        <img src="{{ asset('assets/produk') }}/{{ $v->foto }}"
                                            class="menu-img img-fluid" alt="">
                                    </a>
                                    <h4>{{ substr($v->nama, 0, 20) . '...' }}</h4>
                                    <p class="price">
                                        Rp. {{ number_format($v->harga) }}
                                    </p>
                                </div>
                            @endforeach
                        </div>
                    </div>
                @endforeach
            </div>

        </div>
    </section>
    <section id="testimoni" class="testimonials section-bg">
        <div class="container" data-aos="fade-up">

            <div class="section-header">
                <h2>Testimoni</h2>
                <p>Apa Yang Mereka Katakan tentang <span>CumTech</span></p>
            </div>

            <div class="slides-1 swiper" data-aos="fade-up" data-aos-delay="100">
                <div class="swiper-wrapper">

                    <div class="swiper-slide">
                        <div class="testimonial-item">
                            <div class="row gy-4 justify-content-center">
                                <div class="col-lg-6">
                                    <div class="testimonial-content">
                                        <p>
                                            <i class="bi bi-quote quote-icon-left"></i> Tempatnya sangat nyaman dan bersih.
                                            <i class="bi bi-quote quote-icon-right"></i>
                                        </p>
                                        <h3>Alex</h3>
                                        <h4>Pelanggan</h4>
                                        <div class="stars">
                                            <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
                                                class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
                                                class="bi bi-star-fill"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2 text-center">
                                    <img src="{{ asset('assets/assets/img/testimonials/testimonials-1.jpg') }}"
                                        class="img-fluid testimonial-img" alt="">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="swiper-slide">
                        <div class="testimonial-item">
                            <div class="row gy-4 justify-content-center">
                                <div class="col-lg-6">
                                    <div class="testimonial-content">
                                        <p>
                                            <i class="bi bi-quote quote-icon-left"></i> Saya selalu memilih CumTech untuk
                                            semua kebutuhan teknologi saya. Mereka memiliki produk terbaik dan staf yang
                                            sangat ramah dan membantu. Saya merasa selalu dijaga di sini.
                                            <i class="bi bi-quote quote-icon-right"></i>
                                        </p>
                                        <h3>Eva</h3>
                                        <h4>Pelanggan</h4>
                                        <div class="stars">
                                            <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
                                                class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
                                                class="bi bi-star-fill"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2 text-center">
                                    <img src="{{ asset('assets/assets/img/testimonials/testimonials-2.jpg') }}"
                                        class="img-fluid testimonial-img" alt="">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="swiper-slide">
                        <div class="testimonial-item">
                            <div class="row gy-4 justify-content-center">
                                <div class="col-lg-6">
                                    <div class="testimonial-content">
                                        <p>
                                            <i class="bi bi-quote quote-icon-left"></i> CumTech adalah toko teknologi yang
                                            luar biasa. Produk-produk mereka selalu up-to-date dan terjangkau. Saya telah
                                            melakukan pembelian beberapa kali dan selalu puas
                                            ketiduran.
                                            <i class="bi bi-quote quote-icon-right"></i>
                                        </p>
                                        <h3>Jaldi</h3>
                                        <h4>Pelanggan</h4>
                                        <div class="stars">
                                            <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
                                                class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
                                                class="bi bi-star-fill"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2 text-center">
                                    <img src="{{ asset('assets/assets/img/testimonials/testimonials-3.jpg') }}"
                                        class="img-fluid testimonial-img" alt="">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="swiper-slide">
                        <div class="testimonial-item">
                            <div class="row gy-4 justify-content-center">
                                <div class="col-lg-6">
                                    <div class="testimonial-content">
                                        <p>
                                            <i class="bi bi-quote quote-icon-left"></i>Saya telah menjadi pelanggan setia
                                            CumTech selama bertahun-tahun, dan saya belum pernah kecewa. Mereka adalah
                                            sumber terpercaya untuk teknologi elektronik, dan saya selalu merasa yakin
                                            ketika berbelanja di sini.
                                            <i class="bi bi-quote quote-icon-right"></i>
                                        </p>
                                        <h3>Jalsu</h3>
                                        <h4>Pelanggan</h4>
                                        <div class="stars">
                                            <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
                                                class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
                                                class="bi bi-star-fill"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2 text-center">
                                    <img src="{{ asset('assets/assets/img/testimonials/testimonials-4.jpg') }}"
                                        class="img-fluid testimonial-img" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination"></div>
            </div>

        </div>
    </section>
    <section id="chefs" class="chefs">
        <div class="container" data-aos="fade-up">

            <div class="section-header">
                <p>Tim Kita</p>
            </div>

            <div class="row gy-4">
                <div class="col-a d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
                    <div class="chef-member">
                        <div class="member-img">
                            <img src="{{ asset('assets/tim/cayur.png') }}" class="img-fluid" alt="">
                            <div class="social">
                                <a href="https://www.instagram.com/caturhendra_"><i class="bi bi-instagram"></i></a>
                            </div>
                        </div>
                        <div class="member-info">
                            <h4>Catur Hendra</h4>
                            <span>21051204048</span>
                        </div>
                    </div>
                </div>
                <div class="col-a d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="200">
                    <div class="chef-member">
                        <div class="member-img">
                            <img src="{{ asset('assets/tim/hawul.png') }}" class="img-fluid" alt="">
                            <div class="social">
                                <a href="https://www.instagram.com/haqqulamal_/"><i class="bi bi-instagram"></i></a>
                            </div>
                        </div>
                        <div class="member-info">
                            <h4>Haqqul Amal Jiddan</h4>
                            <span>21051204028</span>
                        </div>
                    </div>
                </div>
                <div class="col-a d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="300">
                    <div class="chef-member">
                        <div class="member-img">
                            <img src="{{ asset('assets/tim/hasni.png') }}" class="img-fluid" alt="">
                            <div class="social">
                                <a href="https://www.instagram.com/hasbyadhitya/"><i class="bi bi-instagram"></i></a>
                            </div>
                        </div>
                        <div class="member-info">
                            <h4>Hasby Adhitya Mustafa</h4>
                            <span>21051204068</span>
                        </div>
                    </div>
                </div>
                <div class="col-a d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="300">
                    <div class="chef-member">
                        <div class="member-img">
                            <img src="{{ asset('assets/tim/jalsu.png') }}" class="img-fluid" alt="">
                            <div class="social">
                                <a href="https://www.instagram.com/zaldy712/"><i class="bi bi-instagram"></i></a>
                            </div>
                        </div>
                        <div class="member-info">
                            <h4>Achmad Zaldy Rifqi</h4>
                            <span>21051204070</span>
                        </div>
                    </div>
                </div>
                <div class="col-a d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="300">
                    <div class="chef-member">
                        <div class="member-img">
                            <img src="{{ asset('assets/tim/yohi.png') }}" class="img-fluid" alt="">
                            <div class="social">
                                <a href="https://www.instagram.com/yogiyanuar.r/"><i class="bi bi-instagram"></i></a>
                            </div>
                        </div>
                        <div class="member-info">
                            <h4>Yogi Yanuar Rachman</h4>
                            <span>21051204008</span>
                        </div>
                    </div>
                </div>
                <div class="col-a d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="300">
                    <div class="chef-member">
                        <div class="member-img">
                            <img src="{{ asset('assets/tim/shafa.jpeg') }}" class="img-fluid" alt="">
                            <div class="social">
                                <a href="https://www.instagram.com/shaff_faa/"><i class="bi bi-instagram"></i></a>
                            </div>
                        </div>
                        <div class="member-info">
                            <h4>Anisa Shafa Brilianti</h4>
                            <span>21051204018</span>
                        </div>
                    </div>
                </div>
                <div class="col-a d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="300">
                    <div class="chef-member">
                        <div class="member-img">
                            <img src="{{ asset('assets/tim/amgas.jpg') }}" class="img-fluid" alt="">
                            <div class="social">
                                <a href="https://www.instagram.com/amgas.pm/"><i class="bi bi-instagram"></i></a>
                            </div>
                        </div>
                        <div class="member-info">
                            <h4>Amgas Putra</h4>
                            <span>21051204026</span>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
@endsection
