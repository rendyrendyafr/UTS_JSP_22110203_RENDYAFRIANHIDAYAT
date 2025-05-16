<%@ page import="java.util.*, model.Film" %>
<%
    String nama = request.getParameter("nama");
    String filmDipilih = request.getParameter("film");
    String jam = request.getParameter("jam");
    int jumlah = 0;

    try {
        jumlah = Integer.parseInt(request.getParameter("jumlah"));
    } catch (Exception e) {
        jumlah = 0;
    }

    List<Film> daftarFilm = (List<Film>) session.getAttribute("daftarFilm");

    int hargaTiket = 0;
    String genre = "";
    int durasi = 0;
    String gambar = "";

    if (daftarFilm != null) {
        for (Film f : daftarFilm) {
            if (f.getJudul().equalsIgnoreCase(filmDipilih)) {
                hargaTiket = f.getHargaTiket();
                genre = f.getGenre();
                durasi = f.getDurasi();
                gambar = f.getGambar();
                break;
            }
        }
    }

    int total = jumlah * hargaTiket;
%>

<!DOCTYPE html>
<html>
<head>
    <title>Struk Pemesanan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(270deg, #74ebd5, #ACB6E5, #74ebd5, #ACB6E5);
            background-size: 800% 800%;
            animation: gradientAnimation 20s ease infinite;
            min-height: 100vh;
            font-family: 'Poppins', sans-serif;
            padding-top: 3rem;
            padding-bottom: 3rem;
        }
        @keyframes gradientAnimation {
            0% {background-position: 0% 50%;}
            50% {background-position: 100% 50%;}
            100% {background-position: 0% 50%;}
        }

        h2 {
            color: #dc3545;
            font-weight: 700;
            text-align: center;
            margin-bottom: 2rem;
            border-bottom: 3px solid #dc3545;
            padding-bottom: 0.5rem;
        }

        .card-custom {
            max-width: 600px;
            background-color: #fff;
            border-radius: 15px;
            border: 2px solid #0d6efd;
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.4);
            padding: 30px;
            margin: auto;
            transition: box-shadow 0.3s ease, transform 0.3s ease;
        }
        .card-custom:hover {
            box-shadow: 0 18px 55px rgba(0, 0, 0, 0.6);
            transform: translateY(-7px);
        }

        .film-img {
            width: 100%;
            height: 300px;
            border-radius: 15px;
            object-fit: cover;
            margin-bottom: 25px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.25);
            transition: transform 0.3s ease;
        }
        .film-img:hover {
            transform: scale(1.03);
        }

        p {
            font-size: 1.1rem;
            color: #333;
        }

        p strong {
            color: #0d6efd;
        }

        hr {
            border-top: 2px solid #0d6efd;
            margin: 1.5rem 0;
        }

        h5 {
            color: #198754;
            font-weight: 700;
            font-size: 1.4rem;
        }

        .btn-primary {
            display: block;
            width: 100%;
            padding: 12px 0;
            font-size: 1.2rem;
            font-weight: 600;
            border-radius: 8px;
            background-color: #0d6efd;
            border-color: #0d6efd;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #084298;
            border-color: #084298;
            color: #fff;
        }
    </style>
</head>
<body>
    <h2><i class="bi bi-receipt-cutoff me-2"></i>Struk Pemesanan Tiket</h2>

    <div class="card-custom">
        <img src="<%= gambar %>" alt="Poster <%= filmDipilih %>" class="film-img">

        <p><strong>Nama Pemesan:</strong> <%= nama %></p>
        <p><strong>Judul Film:</strong> <%= filmDipilih %></p>
        <p><strong>Genre:</strong> <%= genre %></p>
        <p><strong>Durasi:</strong> <%= durasi %> menit</p>
        <p><strong>Jam Tayang:</strong> <%= jam %></p>
        <p><strong>Jumlah Tiket:</strong> <%= jumlah %></p>
        <p><strong>Harga per Tiket:</strong> Rp <%= hargaTiket %></p>

        <hr>

        <h5><strong>Total Bayar:</strong> Rp <%= total %></h5>
    </div>

    <div class="container mt-4" style="max-width: 600px;">
        <a href="index.jsp" class="btn btn-primary">Kembali ke Beranda</a>
    </div>
</body>
</html>
