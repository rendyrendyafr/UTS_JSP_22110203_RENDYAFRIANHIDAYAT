<%@ page import="java.util.*, model.Film" %>
<%
    List<Film> daftarFilm = new ArrayList<>();
    daftarFilm.add(new Film("One Piece: Red", "Action, Adventure", 120, 45000, "img/onepiece.jpg", new String[]{"11:00", "14:00", "17:00"}));
    daftarFilm.add(new Film("Your Name", "Romance, Drama", 110, 42000, "img/yourname.jpg", new String[]{"13:00", "16:00", "19:00"}));
    daftarFilm.add(new Film("Demon Slayer: Mugen Train", "Action, Thriller", 105, 48000, "img/demon.jpg", new String[]{"12:00", "15:00", "18:00"}));
    daftarFilm.add(new Film("Jujutsu Kaisen 0", "Action, Supernatural", 100, 46000, "img/jujutsu.jpg", new String[]{"10:00", "13:00", "16:00"}));
    daftarFilm.add(new Film("A Silent Voice", "Romance, Drama", 130, 40000, "img/silentvoice.jpg", new String[]{"11:30", "14:30", "17:30"}));
    daftarFilm.add(new Film("Spirited Away", "Fantasy, Adventure", 125, 44000, "img/spiritedaway.jpg", new String[]{"12:00", "15:00", "18:00"}));
    session.setAttribute("daftarFilm", daftarFilm);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Daftar Film Anime</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        /* Background animasi gradient bergerak */
        body {
            background: linear-gradient(270deg, #74ebd5, #ACB6E5, #74ebd5, #ACB6E5);
            background-size: 800% 800%;
            animation: gradientAnimation 20s ease infinite;
            min-height: 100vh;
            font-family: 'Poppins', sans-serif;
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
            margin-bottom: 1.5rem;
            border-bottom: 3px solid #dc3545;
            padding-bottom: 0.5rem;
        }

        .card-custom {
            background-color: #fff;
            border-radius: 15px;
            border: 2px solid #0d6efd;
            box-shadow: 0 12px 35px rgba(0, 0, 0, 0.35);
            transition: box-shadow 0.3s ease, transform 0.3s ease;
        }
        .card-custom:hover {
            box-shadow: 0 18px 50px rgba(0, 0, 0, 0.5);
            transform: translateY(-5px);
        }

        .card-img-top {
            height: 650px;
            object-fit: cover;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }

        .card-body {
            padding: 1.5rem;
        }

        .card-title {
            font-weight: 700;
            font-size: 1.6rem;
            color: #0d6efd;
            margin-bottom: 1rem;
            text-align: center;
            text-shadow: 1px 1px 4px rgba(0,0,0,0.1);
        }

        .info-list {
            list-style: none;
            padding: 0;
            margin: 0;
            font-size: 1.1rem;
            color: #333;
        }
        .info-list li {
            margin-bottom: 0.7rem;
            display: flex;
            align-items: center;
        }
        .info-list li i {
            color: #0d6efd;
            margin-right: 10px;
            font-size: 1.3rem;
            min-width: 24px;
            text-align: center;
        }

        .btn-success {
            background-color: #198754;
            border-color: #198754;
            font-weight: 600;
            padding: 10px 30px;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }
        .btn-success:hover {
            background-color: #157347;
            border-color: #146c43;
        }
        .btn-secondary:hover {
            background-color: #5c636a;
        }
        .btn-lg {
            font-size: 1.2rem;
        }
        
        .card-title {
    font-weight: 700;
    font-size: 1.6rem;
    color: #0d6efd;
    margin-bottom: 1rem;
    text-align: center;
    text-shadow: 1px 1px 4px rgba(0,0,0,0.1);
    word-spacing: 0.15em;     
    letter-spacing: 0.03em;    
}

.info-list li {
    margin-bottom: 0.7rem;
    display: flex;
    align-items: center;
    word-spacing: 0.12em;     
    letter-spacing: 0.02em;    
}

    </style>
</head>
<body class="container py-5">
    <h2><i class="bi bi-film"></i> Film Anime Hari Ini</h2>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <% for (Film film : daftarFilm) { %>
            <div class="col">
                <div class="card card-custom h-100 border-primary shadow-sm">
                    <img src="<%= film.getGambar() %>" alt="Poster <%= film.getJudul() %>" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title"><%= film.getJudul() %></h5>
                        <ul class="info-list">
                            <li><i class="bi bi-tags-fill" title="Genre"></i> <strong>Genre  :</strong> <%= film.getGenre() %></li>
                            <li><i class="bi bi-clock-fill" title="Durasi"></i> <strong>Durasi  :</strong> <%= film.getDurasi() %> menit</li>
                            <li><i class="bi bi-cash-stack" title="Harga"></i> <strong>Harga  :</strong> Rp<%= film.getHargaTiket() %></li>
                            <li><i class="bi bi-clock-history" title="Jam Tayang"></i> <strong>Jam Tayang  :</strong> <%= String.join(", ", film.getJamTayang()) %></li>
                        </ul>
                    </div>
                </div>
            </div>
        <% } %>
    </div>

    <div class="text-center mt-5">
        <a href="formPesan.jsp" class="btn btn-success btn-lg">Pesan Tiket</a>
    </div>
</body>
</html>
