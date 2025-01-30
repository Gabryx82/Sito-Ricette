package Controller;
import Model.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
@WebServlet("/HomeServletAmministratore")
public class HomeServletAmministratore extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("valore")==null)
        {
            ArrayList<Ricetta> tutteRicette = RicettaDAO.doRetriveAll();
            request.setAttribute("tutteRicette",tutteRicette);
            RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/amministratore/VediTuttiIProdotti.jsp");
            ds.forward(request,response);
        }
        else if(request.getParameter("valore").equals("clienti"))
        {
            ArrayList<Utente> riepilogoUtente = UtenteDAO.doRetriveUtente();
            request.setAttribute("riepilogoUtente",riepilogoUtente);
            RequestDispatcher ds = request.getRequestDispatcher("WEB-INF/amministratore/VisualizzaUtenti.jsp");
            ds.forward(request,response);

        }
        else if(request.getParameter("valore").equals("aggiungi"))
        {
            RequestDispatcher ds=request.getRequestDispatcher("/WEB-INF/amministratore/AggiuntaNuovaRicetta.jsp");
            ds.forward(request,response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doPost(request,response);
    }
}
