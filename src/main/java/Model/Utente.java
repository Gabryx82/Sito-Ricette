package Model;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
public class Utente
{
    private String email;
    private String passwordEmail;
    private String nome;
    private String dataDiNascita;
    private String citta;
    private boolean amministratore;

    public String getEmail() {
        return email;
    }

    public String getPasswordEmail() {
        return passwordEmail;
    }

    public String getNome() {
        return nome;
    }

    public String getDataDiNascita() {
        return dataDiNascita;
    }

    public String getCitta() {
        return citta;
    }

    public boolean isAmministratore() {
        return amministratore;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPasswordEmail(String passwordEmail)
    {
        try
        {
            MessageDigest digest = MessageDigest.getInstance("SHA-1");
            digest.reset();
            digest.update(passwordEmail.getBytes(StandardCharsets.UTF_8));
            this.passwordEmail = String.format("%040x",new BigInteger(1,digest.digest()));
        }
        catch (NoSuchAlgorithmException e)
        {
            throw new RuntimeException(e);
        }
    }
    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setCitta(String citta) {
        this.citta = citta;
    }

    public void setDataDiNascita(String dataDiNascita) {
        this.dataDiNascita = dataDiNascita;
    }

    public void setAmministratore(boolean amministratore) {
        this.amministratore = amministratore;
    }
}
