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

@WebServlet("/FiltraggioServletDifficolta")
public class FiltraggioServletDifficolta extends HttpServlet
{
    @Override
    protected void doGet (HttpServletRequest request , HttpServletResponse response) throws ServletException,  IOException
    {
        String difficolta = request.getParameter("difficolta");
        ArrayList<Ricetta> ricetteFiltrate = RicettaDAO.getRicettaByDifficolta(difficolta);
        request.setAttribute("filtra",ricetteFiltrate);
        request.setAttribute("filtraggio", difficolta);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/results/Ricette.jsp");
        dispatcher.forward(request,response);
    }
}