package Model;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import java.sql.*;
import java.util.ArrayList;
@WebServlet(name = "UtenteDAO", value = "/UtenteDAO")
public class UtenteDAO extends HttpServlet
{
    public static Utente doLogin(String email, String password)
    {
        Utente utente = new Utente();
        try(Connection con = ConPool.getConnection())
        {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Utente WHERE email = ? AND passwordEmail = SHA1(?)");
            ps.setString(1,email);
            ps.setString(2,password);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
                utente.setEmail(rs.getString(1));
                utente.setPasswordEmail(rs.getString(2));
                utente.setNome(rs.getString(3));
                utente.setDataDiNascita(rs.getString(4));
                utente.setCitta(rs.getString(5));
                utente.setAmministratore(rs.getBoolean(6));
                return utente;
            }
            return null;
        }
        catch(SQLException e)
        {
            throw new RuntimeException(e);
        }
    }
    public static void doRegistrazione(Utente utente)
    {
        try(Connection con = ConPool.getConnection())
        {
            PreparedStatement ps = con.prepareStatement("INSERT INTO Utente ( email,passwordEmail,nome,dataDiNascita,citta,amministratore) VALUES (?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
            ps.setString(1,utente.getEmail());
            ps.setString(2,utente.getPasswordEmail());
            ps.setString(3,utente.getNome());
            ps.setString(4,utente.getDataDiNascita());
            ps.setString(5, utente.getCitta());
            ps.setBoolean(6,false);
            if(ps.executeUpdate() != 1)
                throw new RuntimeException("Errore nel definire l'utente");
        }
        catch(SQLException e)
        {
            throw new RuntimeException(e);
        }
    }
    public static boolean controlloEmail(String email)
    {
        try (Connection con = ConPool.getConnection())
        {
            PreparedStatement ps = con.prepareStatement("SELECT email FROM Utente WHERE email=?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next())
            {
                return true;
            }

        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
        return false;
    }
    public static ArrayList<Utente> doRetriveUtente()
    {
        ArrayList<Utente> u =new ArrayList<Utente>();
        try (Connection con = ConPool.getConnection())
        {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Utente");
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                Utente utente = new Utente();
                utente.setEmail(rs.getString(1));
                utente.setPasswordEmail(rs.getString(2));
                utente.setNome(rs.getString(3));
                utente.setDataDiNascita(rs.getString(4));
                utente.setCitta(rs.getString(5));
                utente.setAmministratore(rs.getBoolean(6));
                u.add(utente);
            }
            return u;
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
    }
    public static void rendiAmministratore(String email)
    {
        try (Connection con = ConPool.getConnection())
        {
            PreparedStatement ps = con.prepareStatement("UPDATE Utente SET amministratore=? WHERE email = ? ", Statement.RETURN_GENERATED_KEYS);
            ps.setBoolean(1,true);
            ps.setString(2,email);
            if (ps.executeUpdate() != 1)
            {
                throw new RuntimeException("UPDATE error.");
            }
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
    }
    public static void rimuoviAmministratore(String email)
    {
        try (Connection con = ConPool.getConnection())
        {
            PreparedStatement ps = con.prepareStatement("UPDATE Utente SET amministratore=? WHERE email = ? ", Statement.RETURN_GENERATED_KEYS);
            ps.setBoolean(1,false);
            ps.setString(2,email);
            if (ps.executeUpdate() != 1)
            {
                throw new RuntimeException("UPDATE error.");
            }
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
    }
}

