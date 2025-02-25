package Controller;
import Model.Ricetta;
import Model.RicettaDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
@WebServlet("/InizioServlet")
public class InizioServlet extends HttpServlet
{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        String richiesta = request.getParameter("action");
        if(richiesta == null)
        {
            if(request.getParameter("valore")!=null)
            {
                ArrayList<Ricetta> ricetteCategorieAmministratore = new ArrayList<Ricetta>();
                ricetteCategorieAmministratore = RicettaDAO.doRetriveByCategoria(request.getParameter("valore"));
                request.setAttribute("CategorieRicette",ricetteCategorieAmministratore);
                request.setAttribute("Categoria",request.getParameter("valore"));
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/amministratore/CategorieRicette.jsp");
                dispatcher.forward(request,response);
            }
        }
        if(richiesta.equals("login"))
        {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/Login.jsp");
            dispatcher.forward(request,response);
        }
        if(richiesta.equals("contatti"))
        {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/Contatti.jsp");
            dispatcher.forward(request,response);
        }
        HttpSession session = request.getSession();
        session.setAttribute("filtri", richiesta);
        ArrayList<Ricetta> ricetteCategoria = new ArrayList<Ricetta>();
        String tipo = request.getParameter("tipo");
        if (tipo == null)
        {
            ricetteCategoria = RicettaDAO.doRetriveByCategoria(richiesta);
        }
        else
        {
            ricetteCategoria = RicettaDAO.doRetriveByCategoriaTipo(richiesta , tipo);
        }

        request.setAttribute(richiesta, ricetteCategoria);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/Ricette.jsp");
        dispatcher.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        doGet(req, resp);
    }
}
