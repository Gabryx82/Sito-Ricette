<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.Ricetta" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ParteCSS/paginaRicetta.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ParteCSS/navBarAmministratore.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ParteCSS/CategorieRicette.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <%
        Ricetta prodottoModifica = (Ricetta) request.getAttribute("ricettaModifica");
        if (prodottoModifica == null) {
            System.out.println("Errore: Ricetta non trovata.");
            return;
        }
        String val = prodottoModifica.getIdRicetta().substring(3);
        int y = Integer.parseInt(val);
        String directory = "immagini/" + prodottoModifica.getIdRicetta() + ".jpg";
        if (y > 1) {
            directory = "immagini/fotoNonDisponibile.jpg";
        }
    %>
    <title><%= prodottoModifica.getNomeRicetta() %></title>
    <style>
        /* Centra il contenuto principale della pagina */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .box-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }

        .box {
            padding: 20px;
            max-width: 600px;
            width: 100%;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .image img {
            width: 100%;
            max-width: 400px;
            height: auto;
            border-style: solid;
            border-width: 2px;
            border-color: #ccc;
            margin-bottom: 20px;
        }

        /* Nome della ricetta */
        .nome-ricetta {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        /* Stile per la difficoltà */
        .difficolta {
            color: red;
            font-weight: bold;
        }

        /* Ingrandisce le caselle di input e textarea */
        input[type="text"], textarea {
            width: 100%;
            font-size: 16px;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        /* Stile per i pulsanti */
        /*.cart {
            margin-top: 15px;
            padding: 12px;
            font-size: 16px;
            color: #333;
            background-color: yellow;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            display: inline-block;
            width: 100%;*/ /* Pulsanti più larghi *//*
        }*/

        .cart:hover {
            background-color: #ffd700; /* Giallo più intenso */
        }
    </style>
</head>
<body>
<div class="box-container">
    <div class="box">
        <p class="nome-ricetta"><%= prodottoModifica.getNomeRicetta() %></p>

        <div class="image">
            <img src="<%= directory %>">
        </div>

        <p><b>Categoria:</b> <%= prodottoModifica.getNomeCategoria() %></p>
        <p><b>Tipo:</b> <%= prodottoModifica.getTipoRicetta() %></p>
        <p class="difficolta"><b>Difficoltà:</b> <%= prodottoModifica.getDifficolta() %></p>

        <form action="ModificaRicettaServletAmministratore" method="post">
            <label>Ingredienti:</label><br>
            <textarea name="ingredienti" rows="4"><%= prodottoModifica.getIngredienti() %></textarea><br>

            <label>Tempo di svolgimento:</label><br>
            <input type="text" name="tempoSvolgimento" value="<%= prodottoModifica.getTempoSvolgimento() %>"><br>

            <label>Procedimento:</label><br>
            <textarea name="procedimento" rows="6"><%= prodottoModifica.getProcedimento() %></textarea><br>

            <button type="submit" class="cart">Salva modifiche</button>
        </form>

        <button class="cart" onclick="window.location.href='RimuoviRicettaServlet'"><i class="fa fa-trash-o"></i> Rimuovi Ricetta</button>
        <button class="cart" onclick="window.location.href='HomeServletAmministratore'"><i class="fa fa-home"></i> Torna alla Home</button>
    </div>
</div>
</body>
</html>



