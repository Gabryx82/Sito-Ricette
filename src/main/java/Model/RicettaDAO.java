package Model;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import java.sql.*;
import java.util.ArrayList;
@WebServlet(name = "RicettaDAO", value = "/RicettaDAO")
public class RicettaDAO extends HttpServlet
{
    public static ArrayList<Ricetta> doRetriveByCategoria(String categoria)
    {
        ArrayList<Ricetta> elencoRicette = new ArrayList<Ricetta>();
        try(Connection con = ConPool.getConnection())
        {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Ricetta WHERE nomeCategoria LIKE ?");
            ps.setString(1,categoria.concat("%"));
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                Ricetta p = new Ricetta();
                p.setIdRicetta(rs.getString(1));
                p.setNomeCategoria(rs.getString(2));
                p.setNomeRicetta(rs.getString(3));
                p.setTipoRicetta(rs.getString(4));
                p.setDescrizione(rs.getString(5));
                p.setIngredienti(rs.getString(6));
                p.setProcedimento(rs.getString(7));
                p.setTempoSvolgimento(rs.getString(8));
                p.setDifficolta(rs.getString(9));
                elencoRicette.add(p);
            }
            return elencoRicette;
        }
        catch(SQLException e)
        {
            throw new RuntimeException(e);
        }
    }
    public static ArrayList<Ricetta> doRetriveByCategoriaTipo(String categoria, String tipo) {
        ArrayList<Ricetta> elencoRicette = new ArrayList<Ricetta>();

        try (Connection con = ConPool.getConnection()) {
            // Query con due soli parametri
            String query = "SELECT * FROM Ricetta WHERE nomeCategoria = ? AND tipoRicetta = ?";
            PreparedStatement ps = con.prepareStatement(query);

            // Imposta categoria e tipo
            ps.setString(1, categoria);
            ps.setString(2, tipo);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Ricetta p = new Ricetta();
                p.setIdRicetta(rs.getString(1));
                p.setNomeCategoria(rs.getString(2));
                p.setNomeRicetta(rs.getString(3));
                p.setTipoRicetta(rs.getString(4));
                p.setDescrizione(rs.getString(5));
                p.setIngredienti(rs.getString(6));
                p.setProcedimento(rs.getString(7));
                p.setTempoSvolgimento(rs.getString(8));
                p.setDifficolta(rs.getString(9));
                elencoRicette.add(p);
            }

            // Chiudi il ResultSet e PreparedStatement
            rs.close();
            ps.close();

            System.out.println("Ricette trovate: " + elencoRicette.size());
            return elencoRicette;

        } catch (SQLException e) {
            throw new RuntimeException("Errore durante il recupero delle ricette", e);
        }
    }


    public static ArrayList<Ricetta> doRetriveAll()
    {
        ArrayList<Ricetta> elencoRicette = new ArrayList<Ricetta>();
        try(Connection con = ConPool.getConnection())
        {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM Ricetta");
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                Ricetta p = new Ricetta();
                p.setIdRicetta(rs.getString(1));
                p.setNomeCategoria(rs.getString(2));
                p.setNomeRicetta(rs.getString(3));
                p.setTipoRicetta(rs.getString(4));
                p.setDescrizione(rs.getString(5));
                p.setIngredienti(rs.getString(6));
                p.setProcedimento(rs.getString(7));
                p.setTempoSvolgimento(rs.getString(8));
                p.setDifficolta(rs.getString(9));
                elencoRicette.add(p);
            }
            return elencoRicette;
        }
        catch(SQLException e)
        {
            throw new RuntimeException(e);
        }
    }
    public static Ricetta doRetriveBySearch(String nome)
    {
        Ricetta p = new Ricetta();
        try (Connection con = ConPool.getConnection())
        {
            PreparedStatement ps =
                    con.prepareStatement("SELECT * FROM Ricetta WHERE upper(nomeRicetta) LIKE ?");
            ps.setString(1, nome.concat("%"));
            ResultSet rs = ps.executeQuery();
            if (rs.next())
            {
                p.setIdRicetta(rs.getString(1));
                p.setNomeCategoria(rs.getString(2));
                p.setNomeRicetta(rs.getString(3));
                p.setTipoRicetta(rs.getString(4));
                p.setDescrizione(rs.getString(5));
                p.setIngredienti(rs.getString(6));
                p.setProcedimento(rs.getString(7));
                p.setTempoSvolgimento(rs.getString(8));
                p.setDifficolta(rs.getString(9));
            }
            return p;
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
    }
    public static ArrayList<Ricetta> getRicettaByDifficolta(String difficolta)
    {
        ArrayList<Ricetta> ricette = new ArrayList<>();
        try(Connection con = ConPool.getConnection())
        {
            String sql = "SELECT * FROM Ricetta WHERE difficoltà = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,difficolta);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Ricetta ricetta = new Ricetta();
                ricetta.setIdRicetta(rs.getString("idRicetta"));
                ricetta.setNomeRicetta(rs.getString("nomeRicetta"));
                ricetta.setNomeCategoria(rs.getString("nomeCategoria"));
                ricetta.setTipoRicetta(rs.getString("nomeRicetta"));
                ricetta.setDescrizione(rs.getString("descrizione"));
                ricetta.setIngredienti(rs.getString("ingredienti"));
                ricetta.setProcedimento(rs.getString("procedimento"));
                ricetta.setTempoSvolgimento(rs.getString("tempoSvolgimento"));
                ricetta.setDifficolta(rs.getString("difficoltà"));
                ricette.add(ricetta);
            }
        }
        catch(SQLException e)
        {
            throw new RuntimeException(e);
        }
        return ricette;
    }
    public static void cancellaProdotto(String idProdotto)
    {
        try (Connection con = ConPool.getConnection())
        {
            PreparedStatement ps = con.prepareStatement("DELETE FROM Ricetta WHERE idRicetta=?", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1,idProdotto);
            if (ps.executeUpdate() != 1)
            {
                throw new RuntimeException("INSERT error.");
            }
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
    }
    public static void aggiuntaProdotto(Ricetta p)
    {
        try (Connection con = ConPool.getConnection())
        {
            PreparedStatement ps = con.prepareStatement("INSERT INTO Ricetta (idRicetta,nomeCategoria,nomeRicetta,descrizione,ingredienti,procedimento,difficoltà,tempoSvolgimento,tipoRicetta) VALUES (?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, p.getIdRicetta());
            ps.setString(2, p.getNomeCategoria());
            ps.setString(3, p.getNomeRicetta());
            ps.setString(4, p.getTipoRicetta());
            ps.setString(5, p.getDescrizione());
            ps.setString(6, p.getIngredienti());
            ps.setString(7, p.getProcedimento());
            ps.setString(8, p.getTempoSvolgimento());
            ps.setString(9, p.getDifficolta());
            if (ps.executeUpdate() != 1)
                throw new RuntimeException("Errore nel definire la ricetta");
        }
        catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
    }
    public static void doUpdateRicetta(Ricetta ricetta) {
        String query = "UPDATE Ricetta SET ingredienti = ?, tempoSvolgimento = ?, procedimento = ? WHERE idRicetta = ?";

        try (Connection conn = ConPool.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, ricetta.getIngredienti());
            stmt.setString(2, ricetta.getTempoSvolgimento());
            stmt.setString(3, ricetta.getProcedimento());
            stmt.setString(4, ricetta.getIdRicetta());

            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Ricetta aggiornata con successo.");
            } else {
                System.out.println("Errore: nessuna ricetta trovata con l'ID specificato.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
