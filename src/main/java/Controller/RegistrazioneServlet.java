package Controller;
import Model.Utente;
import Model.UtenteDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/RegistrazioneServlet")
public class RegistrazioneServlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        Utente u = new Utente();
        u.setEmail(request.getParameter("email"));
        u.setPasswordEmail(request.getParameter("passwordEmail"));
        u.setNome(request.getParameter("nome"));
        u.setDataDiNascita(request.getParameter("datadiNascita"));
        u.setCitta(request.getParameter("citta"));
        u.setAmministratore(false);
        if(UtenteDAO.controlloEmail(request.getParameter("email")))
        {
            request.setAttribute("controllo","Email già presente");
            RequestDispatcher dispatcher =
                    request.getRequestDispatcher("/WEB-INF/results/RegisterUser.jsp");
            dispatcher.forward(request, response);
        }
        else
        {
            UtenteDAO.doRegistrazione(u);
            RequestDispatcher dispatcher =
                    request.getRequestDispatcher("/WEB-INF/results/Login.jsp");
            dispatcher.forward(request, response);
        }
    }
}

