<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Model.Ricetta" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Utente" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="ParteCSS/CategorieRicette.css">
    <link rel="stylesheet" href="ParteCSS/styleSito.css">
    <title>Ricette</title>
    <%
        List<Ricetta> prod = (ArrayList<Ricetta>) request.getAttribute("ricette");
        int n = (int) request.getAttribute("Valore");
    %>
    <script>
        function myFunction() {
            var x = document.getElementById("myTopnav");
            if (x.className === "topnav") {
                x.className += " responsive";
            } else {
                x.className = "topnav";
            }
        }
    </script>
    <style>
        /* Layout di base e supporto per mobile */
        @media screen and (max-width: 1482px) {
            .topnav a:not(:first-child), .dropdown .dropbtn {
                display: none;
            }
            .topnav a.icon {
                float: right;
                display: block;
            }
            .topnav .search-container {
                float: left;
            }
        }
        @media screen and (max-width: 1482px) {
            .topnav.responsive {position: relative;}
            .topnav.responsive .icon {
                position: absolute;
                right: 0;
                top: 0;
            }
            .topnav.responsive a {
                float: none;
                display: block;
                text-align: left;
            }
            .topnav.responsive .dropdown {float: none;}
            .topnav.responsive .dropdown-content {position: relative;}
            .topnav.responsive .dropdown .dropbtn {
                display: block;
                width: 100%;
                text-align: left;
            }
        }
        /* Effetto di ingrandimento */
        .box-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }
        .box {
            width: 250px;
            overflow: hidden;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: transform 0.3s ease;
        }
        .box:hover {
            transform: scale(1.05); /* Ingrandisce il box del 5% */
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2); /* Aggiunge un'ombra per l'effetto */
        }
        .box .image img {
            width: 100%;
            height: auto;
            transition: transform 0.3s ease;
        }
        .box:hover .image img {
            transform: scale(1.1); /* Ingrandisce l'immagine */
        }
        .box .info {
            padding: 10px;
            text-align: center;
            font-size: 16px;
            color: #333;
        }
    </style>
</head>
<body>
<img src="immagini/logosito.png" class="sfondo">
<div class="topnav" id="myTopnav">
    <div class="dropdown">
        <button class="dropbtn" onclick="window.location.href='InizioServlet?action=Antipasto'">Antipasti
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
            <a href="InizioServlet?action=Antipasto&tipo=Fredda">Antipasti Freddi</a>
            <a href="InizioServlet?action=Antipasto&tipo=Calda">Antipasti Caldi</a>
        </div>
    </div>
    <div class="dropdown">
        <button class="dropbtn" onclick="window.location.href='InizioServlet?action=Primo'">Primi
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
            <a href="InizioServlet?action=Primo&tipo=Fredda">Primi Freddi</a>
            <a href="InizioServlet?action=Primo&tipo=Calda">Primi Caldi</a>
        </div>
    </div>
    <div class="dropdown">
        <button class="dropbtn" onclick="window.location.href='InizioServlet?action=Secondo'">Secondi
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
            <a href="InizioServlet?action=Secondo&tipo=Fredda">Secondi Freddi</a>
            <a href="InizioServlet?action=Secondo&tipo=Calda">Secondi Caldi</a>
        </div>
    </div>
    <div class="dropdown">
        <button class="dropbtn" onclick="window.location.href='InizioServlet?action=Dessert'">Dessert</button>
    </div>
    <div class="dropdown">
        <button class="dropbtn" onclick="window.location.href='InizioServlet?action=Drink'">Drink</button>
    </div>
    <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
    <div class="dropdown">
        <button class="dropbtn" onclick="window.location.href='InizioServlet?action=contatti'">
            <i class="fa fa-phone"></i>
        </button>
    </div>
    <%
        if (session.getAttribute("Utente") == null) {
    %>
    <div class="dropdown">
        <button class="dropbtn" onclick="window.location.href='InizioServlet?action=login'">
            <i class="fa fa-user-circle"></i>
        </button>
    </div>
    <% } else { %>
    <div class="dropdown">
        <button class="dropbtn" onclick="window.location.href='LoginServlet?action=logout'">
            <i class="fa fa-sign-out"></i>
        </button>
    </div>
    <div class="dropdown">
        <% Utente u = (Utente) session.getAttribute("Utente"); %>
        <a style="text-underline: none; pointer-events: none">Bentornato, <%= u.getNome() %></a>
    </div>
    <% } %>
    <div class="search-container">
        <form action="RicercaServlet">
            <button type="submit" class="cerca" style="margin-right: 30px; margin-top: 8px; width: 32px; height:32px; margin-left: 3px; float: right;">
                <i class="fa fa-search"></i>
            </button>
            <input type="text" placeholder="Cerca per nome" name="search" style="padding: 6px; font-size: 17px; border: none; margin-left: 3px; margin-right: auto; margin-top: 8px; width: 15em; float: right;">
        </form>
    </div>
</div>
<%
    if (n >= prod.size()) {
        n = prod.size() - 1;
    }
    for (int i = 0; i < 5; i++, n--) {
        String directory = "immagini/" + prod.get(n).getIdRicetta() + ".jpg";
        if (Integer.parseInt(prod.get(n).getIdRicetta().substring(3)) > 1) {
            directory = "immagini/fotoNonDisponibile.jpg";
        }
%>
<div class="box-container">
    <div class="box">
        <div class="image">
            <a href="RicercaServlet?search=<%= prod.get(n).getNomeRicetta() %>">
                <img src="<%= directory %>" style="width: 250px; height: 250px">
            </a>
        </div>
        <div class="info">
            <b style="text-align: center;"><%= prod.get(n).getNomeRicetta() %></b><br>
            <b style="text-align: center;"><%= prod.get(n).getTempoSvolgimento() %></b><br>
            <b style="text-align: center; color: red;">Difficoltà: <%= prod.get(n).getDifficolta() %></b>
        </div>
    </div>
</div>
<% } %>
</body>
</html>
