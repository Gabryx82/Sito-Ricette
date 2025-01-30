<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Utente" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/ParteHTML/navBarAmministratore.jsp" %>
<html>
<head>
    <title>Ripielogo utenti</title>
</head>
<% ArrayList<Utente> riepilogoUtente= (ArrayList<Utente>) request.getAttribute("riepilogoUtente");
    Utente utente = (Utente) session.getAttribute("Amministratore");%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ParteCSS/VisualizzaUtenti.css">
<body>
<table>
    <tr>
        <th>Nome utente</th>
        <th>Email utente</th>
        <th>Amministratore</th>
        <th>Aggiungi</th>
        <th>Rimuovi</th>
    </tr>
    <% for(Utente ut: riepilogoUtente){ %>
    <tr>
        <td><%=ut.getNome()%></td>
        <td><%=ut.getEmail()%></td>
        <td><%=ut.isAmministratore()%></td>
        <% if(utente.getEmail().compareTo(ut.getEmail())!=0) {%>
        <td><button class="cart"><a style="text-decoration: none; color: white; text-underline: none" href="RendiAmministratoreServlet?action=amministratore<%=ut.getEmail()%>">Rendi Amministratore</a></button></td>
        <td><button class="cart"><a style="text-decoration: none; color: white; text-underline: none" href="RendiAmministratoreServlet?action=rimuovipermessi<%=ut.getEmail()%>">Rimuovi Amministratore</a></button></td>
        <%}%>
    </tr>
    <%}%>
</table>
</body>
</html>

