<%@ page import="Model.Ricetta" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/ParteHTML/navBarAmministratore.jsp" %>
<html>
<head>
    <%
        ArrayList<Ricetta> tuttiProdotti = (ArrayList<Ricetta>) request.getAttribute("CategorieRicette");
    %>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ParteCSS/CategorieRicette.css">
    <title><%=request.getAttribute("Categoria")%></title>
    <style>
        /* Giustificare tutto il testo all'interno dei paragrafi */
        p {
            text-align: justify;
        }
    </style>
</head>
<body>
<% for (int i =0;i<tuttiProdotti.size();i++) {
    String val = tuttiProdotti.get(i).getIdRicetta().substring(3);
    int x = Integer.parseInt(val);
    String directory = "immagini/" + tuttiProdotti.get(i).getIdRicetta() + ".jpg";
    if(x>1)
    {
        directory = "immagini/fotoNonDisponibile.jpg";
    }
    // Ingredienti con ritorno a capo solo per trattini e pallini
    String ingredienti = tuttiProdotti.get(i).getIngredienti().replaceAll("([-•])", "<br>$1");

    // Procedimento con ritorno a capo solo per numeri, trattini e pallini
    String procedimento = tuttiProdotti.get(i).getProcedimento().replaceAll("(-|•|\\d+)", "<br>$1");
%>
<div class="box-container">
    <div class="box">
        <a href="CercaProdottoPerModificaServlet?search=<%=tuttiProdotti.get(i).getNomeRicetta()%>">
            <img src="<%=directory%>" style="width: 250px; height: 250px">
        </a>
    </div>
    <div class="info">
        <p><%=tuttiProdotti.get(i).getNomeRicetta()%></p>
        <p><%=tuttiProdotti.get(i).getTipoRicetta()%></p>
        <p><%=tuttiProdotti.get(i).getTempoSvolgimento()%></p>
        <p style="color:red">Difficoltà:<%=tuttiProdotti.get(i).getDifficolta()%></p>
        <p><%=tuttiProdotti.get(i).getDescrizione()%></p>
        <!-- Ingredienti con ritorno a capo -->
        <p>Ingredienti:</p>
        <p><%= ingredienti %></p>

        <!-- Procedimento con ritorno a capo -->
        <p>Svolgimento:</p>
        <p><%= procedimento %></p>
    </div>
</div>
<%}%>
</body>
</html>