package Controller;

import Model.Ricetta;
import Model.RicettaDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/ModificaRicettaServletAmministratore")
public class ModificaRicettaServletAmministratore extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sessione = request.getSession();
        Ricetta ricetta = (Ricetta) sessione.getAttribute("ricettaModifica");

        if (ricetta == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Errore: ricetta non trovata in sessione.");
            return;
        }

        // Aggiorna ingredienti, tempo di svolgimento e procedimento
        String ingredienti = request.getParameter("ingredienti");
        String tempoSvolgimento = request.getParameter("tempoSvolgimento");
        String procedimento = request.getParameter("procedimento");

        if (ingredienti != null) {
            ricetta.setIngredienti(ingredienti);
        }
        if (tempoSvolgimento != null) {
            ricetta.setTempoSvolgimento(tempoSvolgimento);
        }
        if (procedimento != null) {
            ricetta.setProcedimento(procedimento);
        }

        // Aggiorna la ricetta nel database
        RicettaDAO.doUpdateRicetta(ricetta);

        // Reindirizza alla pagina home dell'amministratore
        RequestDispatcher ds = request.getRequestDispatcher("HomeServletAmministratore");
        ds.forward(request, response);
    }
}

