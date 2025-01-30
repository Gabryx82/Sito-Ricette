<%@ page import="Model.Ricetta" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/ParteHTML/navBar.jsp" %>
<%@ include file="/ParteHTML/Filter.html" %>
<html>
<head>
    <link rel="stylesheet" href="ParteCSS/CategorieRicette.css">
    <%
        String x;
        ArrayList<Ricetta> prod = new ArrayList<Ricetta>();
        if(request.getParameter("action") != null) {
            prod = (ArrayList<Ricetta>) request.getAttribute(request.getParameter("action"));
            x = request.getParameter("action");
        } else {
            prod = (ArrayList<Ricetta>) request.getAttribute("filtra");
            x = (String) request.getAttribute("filtraggio");
        }
    %>
    <title><%= x %></title>
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
<% for (Ricetta p : prod) {
    String val = p.getIdRicetta().substring(3);
    int y = Integer.parseInt(val);
    String directory = "immagini/" + p.getIdRicetta() + ".jpg";
    if(y > 1) {
        directory = "immagini/fotoNonDisponibile.jpg";
    }
%>
<div class="box-container">
    <div class="box">
        <div class="image">
            <a href="RicercaServlet?search=<%= p.getNomeRicetta() %>">
                <img src="<%= directory %>">
            </a>
        </div>
        <div class="info">
            <b style="text-align: center;"><%= p.getNomeRicetta() %></b><br>
            <b style="text-align: center;"><%= p.getTempoSvolgimento() %></b><br>
            <b style="text-align: center; color: red"><%="Difficoltà: " + p.getDifficolta() %></b><br>
        </div>
    </div>
</div>
<% } %>
</body>
</html>
