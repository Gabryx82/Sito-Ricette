<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <title>Aggiunta nuova ricetta</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ParteCSS/AggiuntaRicetta.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script>
        function validateNewRicetta()
        {
            var idRicetta = document.getElementById(('idRicetta')).value;
            var idRicettaRGX=/^[A-Z0-9]*$/;
            var nomeRicetta=document.getElementById('nomeRicetta').value;
            var nomeRicettaRGX=/^[a-zA-Z' ']*$/;
            var tempoSvolgimento=document.getElementById('tempoSvolgimento').value;
            var tempoSvolgimentoRGX=/^[a-zA-Z' ']*$/;
            var tipoRicetta=document.getElementById('tipoRicetta').value;
            var tipoRicettaRGX=/^[a-zA-Z]*$/;
            var numRicetta=idRicetta.substring(3);
            console.log(numRicetta)
            if(numRicetta<=1)
            {
                alert("Errore nella definizione del valore dell'ID");
                return false;
            }
            if(idRicettaRGX.test(idRicetta)==false)
            {
                alert("Errore nella definiione dell'ID");
                return false;
            }
            if(nomeRicettaRGX.test(nomeRicetta)==false)
            {
                alert("Errore nella definizione del nome");
                return false;
            }
            if(difficoltaRGX.test(difficolta)==false)
            {
                alert("Errore nella definizione della difficoltà");
                return false;
            }
            if(tempoSvolgimentoRGX.test(tempoSvolgimento)==false)
            {
                alert("Errore nella definizione del tempo di svolgimento");
                return false;
            }
            if(tipoRicettaRGX.test(tipoRicetta)==false)
            {
                alert("Errore nella definizione del tipo della ricetta");
                return false;
            }
        }
    </script>
    <style>
        @media screen and (max-width: 1920px)
        {
            textarea
            {
                width: 80%;
            }
        }
        table
        {
            border: 3px solid #d0ba0a;
            padding: 5px;
            border-collapse: collapse;
            margin-left: auto;
            margin-right: auto;
            margin-top: 5%;
            width: 50%
        }
    </style>
</head>
<body>
<form method="post" action="./AggiuntaRicettaServlet">
    <table>
        <tr>
            <th class="inserimento1">
                <label>Per i prodotti la prima lettera rappresenta la categoria e la seconda il numero della ricetta: A001 Antipasto</label>
                <label for="idRicetta">Inserisci l'id della ricetta</label>
                <input type="text" name="idRicetta" id="idRicetta" required><br>
                <label>Scegli la categoria della ricetta</label><br>
                <select name="nomeCategoria">
                    <option id="Antipasto">Antipasto</option>
                    <option id="Primo">Primo</option>
                    <option id="Secondo">Secondo</option>
                    <option id="Dessert">Dessert</option>
                    <option id="Drink">Drink</option>
                </select><br>
                <label for="nomeRicetta">Inserisci il nome della ricetta</label>
                <input type="text" name="nomeRicetta" id="nomeRicetta" required><br>
                <label for="descrizione">Inserisci la descrizione</label>
                <textarea type="text" name="descrizione" id="descrizione" rows="4" cols="80"></textarea><br>
                <label for="ingredienti">Inserisci gli ingredienti</label>
                <textarea type="text" name="ingredienti" id="ingredienti" rows="4" cols="80"></textarea><br>
                <label for="procedimento">Inserisci il procedimento</label>
                <textarea type="text" name="procedimento" id="procedimento" rows="8" cols="120"></textarea><br>
                <label for="difficolta">Inserisci la difficolta</label>
                <input type="text" name="difficolta" id="difficolta"><br>
                <label for="tempoSvolgimento">Inserisci il tempo di svolgimento</label>
                <input type="text" name="tempoSvolgimento" id="tempoSvolgimento"><br>
                <label>Inserisci il tipo della ricetta</label><br>
                <select name="tipoRicetta">
                    <option id="Calda">Calda</option>
                    <option id="Fredda">Fredda</option>
                </select>
            </th>
        </tr>
    </table>
    <button onclick="return(validateNewRicetta())" type="submit" class="cart"><i class="fa fa-cart-plus"></i></button>
    <button onclick="window.location.href='HomeServletAmministratore'" type="submit" class="cart"><i class="fa fa-home"></i></button>
</form>
</body>
</html>
