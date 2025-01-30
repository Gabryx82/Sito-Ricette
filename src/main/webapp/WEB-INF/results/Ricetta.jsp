<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="ricetta" scope="request" type="Model.Ricetta"/>
<%@ page import="Model.Ricetta"%>
<%@ page contentType="text/html;charset>=UTF-8" language="java"%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="ParteCSS/paginaRicetta.css">
    <link rel="stylesheet" type="text/css" href="ParteCSS/styleSito.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>${ricetta.nomeRicetta}</title>
    <style>
        .box-container .box .image img
        {
            width: 500px;
            height: 500px;
            border-style: solid;
            border-width: 2px;
            filter: drop-shadow(0 3px 5px rgba(0,0,0,.7));
        }
        .box-container
        {
            border: none;
            display: flex;
            flex-direction: column;
            align-items: center;
            border: 0;
        }
        .table
        {
            margin: 20px auto;
            border-collapse: collapse;
            width: 60%;
            text-align: center;
        }
        .table th{
            font-size: 24px;
            padding: 15px;
        }
        .difficolta{
            color: red;
            font-size: 30px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<table class="table">
    <tr>
        <th>
            <h1 style="font-size: 40px">${ricetta.nomeRicetta}</h1>
            <h2 class="difficolta">Difficolta: ${ricetta.difficolta}</h2>
        </th>
    </tr>
</table>
<div class="box-container">
    <div class="box">
        <img src="${(ricetta.idRicetta.substring(3)>1)?'immagini/fotoNonDisponibile.jpg' : 'immagini/'.concat(ricetta.idRicetta.concat('.jpg'))}" alt="" style="height: 500px">
    </div>
    <div class="info">
        <p style="text-justify: auto">${ricetta.descrizione}</p>
        <p style="text-justify: auto">Categoria ricetta: ${ricetta.nomeCategoria}</p>
        <p style="text-justify: auto">Tipo ricetta: ${ricetta.tipoRicetta}</p>
        <p style="text-justify: auto">Tempo di svolgimento: ${ricetta.tempoSvolgimento}</p>
        <p style="text-justify: auto">Ingredienti: </p>
        <ul>
            <c:forEach var="ingrediente" items="${ricetta.ingredienti.split('-')}">
                <c:if test="${not empty ingrediente.trim()}">
                    <li>${ingrediente.trim()}</li>
                </c:if>
            </c:forEach>
        </ul>
        <p style="text-justify: auto">Svolgimento: </p>
        <ol style="text-justify: auto">
            <c:forEach var="passo" items="${ricetta.svolgimentoPassaggi}">
                <li style="text-justify: auto">${passo}</li>
            </c:forEach>
        </ol>
        <button class="cart" onclick="window.location.href='./'"><i class="fa fa-home"></i> Torna alla Home</button>
    </div>
</div>
</body>
</html>
