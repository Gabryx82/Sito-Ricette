<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contatti</title>
    <link rel="stylesheet" type="text/css" href="ParteCSS/Contatti.css">
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var elements = ["1", "2", "3", "4", "5"];

            elements.forEach(function (id) {
                var element = document.getElementById(id);
                if (element) {
                    element.addEventListener("mouseenter", function () {
                        element.style.color = "#c7730f";
                    });

                    element.addEventListener("mouseleave", function () {
                        element.style.color = "black";
                    });
                }
            });

            // Nascondi inizialmente l'elemento con id "5"
            var element5 = document.getElementById("5");
            if (element5) {
                element5.style.display = "none";
                element5.style.color = "transparent";
                element5.style.overflow = "hidden"; // Necessario per l'animazione di scorrimento
                element5.style.height = "0"; // Imposta l'altezza a 0 per nasconderlo
                element5.style.transition = "height 0.5s ease"; // Aggiungi transizione all'altezza
            }

            // Aggiungi l'evento click per il bottone "chiSiamo"
            var chiSiamo = document.getElementById("chiSiamo");
            if (chiSiamo) {
                chiSiamo.addEventListener("click", function () {
                    if (element5.style.height === "0px" || element5.style.display === "none") {
                        element5.style.display = "block"; // Assicurati che sia visibile
                        element5.style.height = element5.scrollHeight + "px"; // Imposta l'altezza al contenuto
                    } else {
                        element5.style.height = "0px"; // Riduci l'altezza a 0 per nasconderlo
                        setTimeout(function () {
                            element5.style.display = "none"; // Nascondi l'elemento dopo l'animazione
                        }, 500); // Il timeout deve corrispondere alla durata della transizione
                    }
                    element5.style.color = "black";
                    element5.style.fontWeight = "bold";
                });
            }
        });

    </script>
</head>
<body>
<img src="immagini/Contatti.jpg" class="contatti" style="width: 800px; height: 450px">
<table>
    <tr>
        <th style="font-size: 2vw">Indirizzo:</th>
        <th style="font-size: 2vw">Contatti Telefonici:</th>
        <th style="font-size: 2vw">E-mail:</th>
        <th style="font-size: 2vw">Orario:</th>
    </tr>
    <tr>
        <th><p id="1">Via campole case sparse SNC <br> 81040 Liberi (CE) <br> loc. Liberi</p></th>
        <th><p id="2">Cellulare:3332984857<br>Fisso:0923870381</p></th>
        <th><p id="3">Ricette@libero.it</p></th>
        <th><p id="4">Lun - Ven 09:30 - 18:00 <br> Sabato 09:00 - 13:00 <br> Domenica chiuso</p></th>
        <td><button id="chiSiamo" class="cart">Chi siamo</button></td>
        <td><button class="cart" onclick="window.location.href='./'">HomePage</button></td>
    </tr>
</table>
<p id="5" style="text-align: center; font-size: 1.5vw; font-weight: bold; padding: 20px;">Vi presentiamo le nostre ricette , della tradizionale cucina italiana e non , fatte con amore e passione.<br></p>
</body>
</html>

