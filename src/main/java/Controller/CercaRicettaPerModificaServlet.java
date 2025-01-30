package Controller;
import Model.Ricetta;
import Model.RicettaDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
@WebServlet("/CercaRicettaPerModificaServlet")
public class CercaRicettaPerModificaServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request , HttpServletResponse response) throws ServletException , IOException
    {
        doPost(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException
    {
        String x = request.getParameter("search");
        Ricetta pmod = RicettaDAO.doRetriveBySearch(x);
        HttpSession sessione = request.getSession();
        sessione.setAttribute("ricettaModifica",pmod);
        request.setAttribute("ricettaModifica",pmod);
        RequestDispatcher ds = request.getRequestDispatcher("/WEB-INF/amministratore/ModificaRicetta.jsp");
        ds.forward(request,response);
    }
}
