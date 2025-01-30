package Controller;
import Model.Ricetta;
import Model.RicettaDAO;
import Model.Utente;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
@WebServlet("/AggiuntaRicettaServlet")
public class AggiuntaRicettaServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request , HttpServletResponse response) throws ServletException,IOException
    {
        doPost(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        Ricetta p = new Ricetta();
        p.setIdRicetta(request.getParameter("idRicetta"));
        p.setNomeCategoria(request.getParameter("nomeCategoria"));
        p.setNomeRicetta(request.getParameter("nomeRicetta"));
        p.setDifficolta(request.getParameter("difficolta"));
        p.setTempoSvolgimento(request.getParameter("tempoSvolgimento"));
        p.setTipoRicetta(request.getParameter("tipoRicetta"));
        p.setDescrizione(request.getParameter("descrizione"));
        p.setIngredienti(request.getParameter("ingredienti"));
        p.setProcedimento(request.getParameter("procedimento"));
        RicettaDAO.aggiuntaProdotto(p);
        RequestDispatcher dispatcher = request.getRequestDispatcher("HomeServletAmministratore");
        dispatcher.forward(request,response);
    }
}
