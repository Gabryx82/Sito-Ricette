<%@ page import="Model.Utente" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ParteCSS/CategorieProdotti.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ParteCSS/navBarAmministratore.css">
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
        @media screen and (max-width: 1100px) {
            .topnav a:not(:first-child), .dropdown .dropbtn {
                display: none;
            }
            .topnav a.icon {
                float: right;
                display: block;
            }
            .topnav .search-container{
                float: left;
            }
        }

        @media screen and (max-width: 1100px) {
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
    </style>
</head>
<body>
<img src="immagini/logosito.png" class="sfondo">
<div class="topnav" id="myTopnav">
    <a href="./HomeServletAmministratore" class="active"><i class="fa fa-home"></i></a>
    <div class="dropdown">
        <button class="dropbtn" onclick="window.location.href='InizioServlet?valore=Antipasto'">Antipasti
        </button>
    </div>
    <div class="dropdown">
        <button class="dropbtn" onclick="window.location.href='InizioServlet?valore=Primo'">Primi
        </button>
    </div>
    <div class="dropdown">
        <button class="dropbtn" onclick="window.location.href='InizioServlet?valore=Secondo'">Secondi
        </button>
    </div>
    <div class="dropdown">
        <button class="dropbtn" onclick="window.location.href='InizioServlet?valore=Dessert'">Dessert</button>
    </div>
    <div class="dropdown">
        <button class="dropbtn" onclick="window.location.href='InizioServlet?valore=Drink'">Drink</button>
    </div>
    <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
    <div class="dropdown">
        <button class="dropbtn" onclick="window.location.href='LoginServlet?action=logout'">
            <i class="fa fa-sign-out"></i>
        </button>
    </div>
    <div class="dropdown">
        <%Utente u = (Utente) session.getAttribute("Amministratore");%>
        <% if (u != null) { %>
        <a style="text-underline: none; pointer-events: none">Bentornato Amministratore, <%= u.getNome()%></a>
        <% } else { %>
        <a style="text-underline: none; pointer-events: none">Utente non autenticato</a>
        <% } %>
    </div>
    <div class="dropdown">
        <button class="dropbtn" onclick="window.location.href='HomeServletAmministratore?valore=clienti'"><i class="fa fa-group"></i></button>
    </div>
    <div class="dropdown">
        <button class="dropbtn" onclick="window.location.href='HomeServletAmministratore?valore=aggiungi'"><i class="fa fa-plus"></i></button>
    </div>
</div>
</body>
</html>