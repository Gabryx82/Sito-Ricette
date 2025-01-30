<%@ page import="Model.Utente" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width , initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ParteCSS/styleSito.css">
    <link rel="styleshett" href="${pageContext.request.contextPath}/ParteCSS/CategorieRicette.css">
    <style>
        @media screen and (max-width: 1341px) {
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
        @media screen and (max-width: 445px){
            .topnav .search-container{
                margin-top: 2%;
                float: left;
            }
        }
        @media screen and (max-width: 1341px){
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
    <script>
        function myFunction(){
            var x = document.getElementById("myTopnav");
            if(x.className === "topnav") {
                x.className += " responsive";
            } else {
                x.className = "topnav";
            }
        }
    </script>
</head>
<body>
<img src="immagini/logosito.png" class="sfondo">
<div class="topnav" id="myTopnav">
    <div class="dropdown">
        <a href="${pageContext.request.contextPath}/"><i class="fa fa-home"></i></a>
    </div>
    <div class="dropdown">
        <button class="dropbtn" onclick="window.location.href='${pageContext.request.contextPath}/InizioServlet?action=Antipasto'">Antipasti
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
            <a href="${pageContext.request.contextPath}/InizioServlet?action=Antipasto&tipo=Fredda">Antipasti Freddi</a>
            <a href="${pageContext.request.contextPath}/InizioServlet?action=Antipasto&tipo=Calda">Antipasti Caldi</a>
        </div>
    </div>
    <div class="dropdown">
        <button class="dropbtn" onclick="window.location.href='InizioServlet?action=Primo'">Primi
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
            <a href="${pageContext.request.contextPath}/InizioServlet?action=Primo&tipo=Fredda">Primi Freddi</a>
            <a href="${pageContext.request.contextPath}/InizioServlet?action=Primo&tipo=Calda">Primi Caldi</a>
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
        <button class="dropbtn" onclick="window.location.href='${pageContext.request.contextPath}/InizioServlet?action=contatti'">
            <i class="fa fa-phone"></i>
        </button>
    </div>
        <%
        if(session.getAttribute("Utente")==null)
        {%>
    <div class="dropdown">
        <button class="dropbtn" onclick="window.location.href='${pageContext.request.contextPath}/InizioServlet?action=login'">
            <i class="fa fa-user-circle"></i>
        </button>
    </div>
    <%}
        else
        {%>
    <div class="dropdown">
        <button class="dropbtn" onclick="window.location.href='${pageContext.request.contextPath}/LoginServlet?action=logout'">
            <i class="fa fa-sign-out"></i>
        </button>
    </div>
    <div class="dropdown">
        <%Utente u = (Utente) session.getAttribute("Utente");%>
        <a style="text-underline: none; pointer-events: none">Bentornato, <%=u.getNome()%></a>
    </div>
    <%}%>
    <div class="search-container">
        <form action="RicercaServlet">
            <button type="submit" value="Cerca" class="cerca" style="margin-right: 30px; margin-top: 8px; width: 32px; height: 32px; margin-left: 3px; float: right;">
                <i class="fa fa-search"></i>
            </button>
            <input type="text" placeholder="Cerca per nome" name="search" class="nomeRicetta" style="padding: 6px; font-size: 17px; border: none; margin-left: 3px; margin-right: auto; margin-top: 8px; width: 15em; float: right;">
        </form>
    </div>
</div>
</body>
</html>

