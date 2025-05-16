<%@ page import="java.util.*, model.Film" %>
<%
    List<Film> daftarFilm = (List<Film>) session.getAttribute("daftarFilm");
    if (daftarFilm == null || daftarFilm.isEmpty()) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Form Pemesanan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #d7f2fc, #e9f7fe);
            font-family: 'Poppins', sans-serif;
            animation: fadeIn 0.5s ease-in;
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(20px);}
            to {opacity: 1; transform: translateY(0);}
        }

        .card-custom {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.35);
            padding: 30px;
            transition: box-shadow 0.3s ease;
        }

        .card-custom:hover {
            box-shadow: 0 12px 30px rgba(0,0,0,0.25);
            transform: translateY(-5px);
        }

        label {
            font-weight: 600;
            color: #0d6efd;
        }

        button.btn-success {
            background-color: #198754;
            border: none;
            font-weight: 600;
            padding: 10px 25px;
            transition: background-color 0.3s ease;
        }

        button.btn-success:hover {
            background-color: #157347;
        }

        .preview-img {
            width: 100%;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            object-fit: cover;
            max-height: 650px;
            transition: opacity 0.4s ease;
        }
    </style>
</head>
<body class="container py-5">
    <h2 class="display-5 fw-semibold text-success text-center mb-4 border-bottom border-3 border-success pb-2">
        Form Pemesanan Tiket
    </h2>

    <div class="card-custom mx-auto" style="max-width: 900px;">
        <div class="row g-4 align-items-center">
            <!-- Form kiri -->
            <div class="col-md-6">
                <form action="struk.jsp" method="post" id="formPesan">
                    <div class="mb-4">
                        <label for="nama" class="form-label">Nama Pemesan</label>
                        <input type="text" id="nama" name="nama" class="form-control" required placeholder="Masukkan nama lengkap">
                    </div>
                    <div class="mb-4">
                        <label for="jumlah" class="form-label">Jumlah Tiket</label>
                        <input type="number" id="jumlah" name="jumlah" class="form-control" min="1" required>
                    </div>
                    <div class="mb-4">
                        <label for="film" class="form-label">Pilih Film</label>
                        <select id="film" name="film" class="form-select" onchange="updateFilmDetail()" required>
                            <% for (Film f : daftarFilm) { %>
                                <option value="<%= f.getJudul() %>" data-img="<%= f.getGambar() %>">
                                    <%= f.getJudul() %>
                                </option>
                            <% } %>
                        </select>
                    </div>
                    <div class="mb-4">
                        <label for="jam" class="form-label">Pilih Jam Tayang</label>
                        <select id="jamSelect" name="jam" class="form-select" required>
                            <% for (String jam : daftarFilm.get(0).getJamTayang()) { %>
                                <option value="<%= jam %>"><%= jam %></option>
                            <% } %>
                        </select>
                    </div>

                    <div class="d-flex gap-2">
                        <button type="submit" class="btn btn-success">Pesan</button>
                        <a href="index.jsp" class="btn btn-secondary">Kembali</a>
                    </div>
                </form>
            </div>

            <div class="col-md-6 text-center">
                <img src="<%= daftarFilm.get(0).getGambar() %>" alt="Preview Film" id="previewImage" class="preview-img" />
            </div>
        </div>
    </div>

    <script>
        const daftarFilm = [
            <% for (Film f : daftarFilm) { %>
                {
                    judul: "<%= f.getJudul().replace("\"", "\\\"") %>",
                    jamTayang: [<%
                        String[] jadwal = f.getJamTayang();
                        for (int i = 0; i < jadwal.length; i++) {
                            out.print("\"" + jadwal[i] + "\"");
                            if (i < jadwal.length - 1) out.print(", ");
                        }
                    %>],
                    gambar: "<%= f.getGambar() %>"
                },
            <% } %>
        ];

        const filmSelect = document.getElementById('film');
        const jamSelect = document.getElementById('jamSelect');
        const previewImage = document.getElementById('previewImage');

        function updateFilmDetail() {
            const selectedFilm = filmSelect.value;
            const filmData = daftarFilm.find(f => f.judul === selectedFilm);

            jamSelect.innerHTML = '';
            filmData.jamTayang.forEach(jam => {
                const opt = document.createElement('option');
                opt.value = jam;
                opt.text = jam;
                jamSelect.appendChild(opt);
            });

            previewImage.style.opacity = 0;
            setTimeout(() => {
                previewImage.src = filmData.gambar;
                previewImage.style.opacity = 1;
            }, 250);
        }
    </script>
</body>
</html>
