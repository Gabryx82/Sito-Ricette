package Controller;
import Model.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet
{
    @Override
    /*protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String parametri;
        HttpSession session = request.getSession();
        Utente u = UtenteDAO.doLogin(request.getParameter("Email"), request.getParameter("Password"));
        if(request.getParameter("action")==null)
        {
            if (u == null)
            {
                parametri = "Email o password errati!";
                request.setAttribute("parametri", parametri);
                RequestDispatcher rs = request.getRequestDispatcher("/WEB-INF/results/Login.jsp");
                rs.include(request, response);
            }
            else if (u != null && !u.isAmministratore())
            {
                session.setAttribute("Utente", u);
                RequestDispatcher ds = request.getRequestDispatcher("");
                ds.forward(request, response);
            }
            else if (u != null && u.isAmministratore())
            {
                session.setAttribute("Amministratore", u);
                RequestDispatcher ds = request.getRequestDispatcher("HomeServletAmministratore");
                ds.forward(request, response);
            }
        }
        else if(request.getParameter("action").equals("logout"))
        {
            session.invalidate();
            RequestDispatcher dispatcher = request.getRequestDispatcher("");
            dispatcher.forward(request, response);
        }
    }*/
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String email = request.getParameter("Email");
        String password = request.getParameter("Password");
        HttpSession session = request.getSession();

        Utente u = UtenteDAO.doLogin(email, password);
        PrintWriter out = response.getWriter();
        if (action == null) {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            if (u == null) {
                // Login fallito
                out.write("{\"message\":\"Password o Email errata!\"}");
            } else if (!u.isAmministratore()) {
                // Login riuscito
                session.setAttribute("Utente", u);
                out.write("{\"message\":\"Login effettuato\"}");
            } else {
                session.setAttribute("Amministratore", u);
                out.write("{\"message\":\"Login amministratore effettuato\"}");
            }
        } else {
            // Altri casi come logout mantenuti uguali
            if ("logout".equals(action)) {
                session.invalidate();
                RequestDispatcher dispatcher = request.getRequestDispatcher("");
                dispatcher.forward(request, response);
            }
        }
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}