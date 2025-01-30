<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="ParteCSS/styleSito.css">
    <link rel="stylesheet" type="text/css" href="ParteCSS/Registrazione.css">
    <title>Registrazione</title>
    <% String x=" ";
        if(request.getAttribute("controllo")!=null)
        {
            x="Email già presente!";
        }%>
    <script>
        function validateRegistrazione(){
            var email = document.getElementById('email').value;
            var emailRGX = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            if((emailRGX.test(email)==false)){
                alert("Formato email non valido!");
                return false;
            }
            var passwordRGX=/^[a-zA-Z0-9!@?]*$/;
            var password = document.getElementById('passwordEmail').value;
            if((passwordRGX.test(password))==false){
                alert("Caratteri password non validi!");
                return false;
            }
            if((password.length<5 ||password.length>30 ))
            {
                alert("Dimensione password non valida!");
                return false;
            }
            var nomeRGX=/^[a-zA-Z' ']*$/;
            var nome=document.getElementById('nome').value;

            if((nomeRGX.test(nome))==false){
                alert("Nome non valido!");
                return false;
            }
            var dataRGX=/^[0-9'/']*$/;
            var data=document.getElementById('datadiNascita').value;
            if((dataRGX.test(data))==false){
                alert("Formato data errato!");
                return false;
            }
            var citta=document.getElementById('citta').value;
            var cittaRGX=/^[A-Za-zìòàèéù' ']*$/;
            if((cittaRGX.test(citta))==false)
            {
                alert("Nome citta' errato!");
                return false;
            }
            return true;
        }

    </script>
</head>
<body>
<img src="immagini/logosito.png" class="sfondo">
<form method="post" action="RegistrazioneServlet">
    <table>
        <tr>
            <th>
                <label for="nome">Inserisci il nome</label><br>
                <input type="text" placeholder="Mario" name="nome" id="nome" required><br>
                <label for="datadiNascita">Inserisci la data di nascita</label><br>
                <input type="text" placeholder="GG/MM/AAAA" id="datadiNascita" name="datadiNascita" required><br>
                <label for="email">Inserisci l'email</label><br>
                <input type="email" placeholder="prova@esempio.it" name="email" id="email" required><br>
                <label for="passwordEmail">Inserisci la password</label><br>
                <input type="password" placeholder="Esempio2!" name="passwordEmail" id="passwordEmail" required ><br>
                <label for="citta">Inserisci la citta'</label><br>
                <input type="text" id="citta" name="citta" required><br>
            </th>
        </tr>
    </table>
    <button onclick="return(validateRegistrazione())" type="submit" class="cart">Registrati</button>
    <p style="color: red; text-align: center"><%=x%></p>
</form>
<br>

</body>
</html>