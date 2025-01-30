package Controller;
import Model.Ricetta;
import Model.RicettaDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
@WebServlet("/RimuoviRicettaServlet")
public class RimuoviRicettaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Ricetta p = (Ricetta) session.getAttribute("ricettaModifica");

        // Log per verificare che l'oggetto Ricetta sia stato trovato nella sessione
        if (p == null) {
            System.out.println("Errore: Ricetta non trovata nella sessione.");
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Ricetta non trovata nella sessione.");
            return;  // Termina il metodo se p è null
        } else {
            System.out.println("Ricetta trovata: " + p.getIdRicetta());
        }

        // Procedi con la rimozione della ricetta
        String ricettaId = p.getIdRicetta();
        // Codice per rimuovere la ricetta dal database (es. chiamata a RicettaDAO.doRemove(ricettaId))
        RicettaDAO.cancellaProdotto(ricettaId);

        // Dopo la rimozione, puoi reindirizzare alla home o mostrare un messaggio di successo
        response.sendRedirect("HomeServletAmministratore"); // Reindirizza alla home
    }
}


