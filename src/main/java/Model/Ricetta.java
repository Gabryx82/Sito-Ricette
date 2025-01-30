package Model;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class Ricetta
{
    private String idRicetta;
    private String nomeCategoria;
    private String nomeRicetta;
    private String tipoRicetta;
    private String descrizione;
    private String ingredienti;
    private String procedimento;
    private String tempoSvolgimento;
    private String difficolta;

    public String getIdRicetta() {
        return idRicetta;
    }

    public String getNomeCategoria() {
        return nomeCategoria;
    }

    public String getNomeRicetta() {
        return nomeRicetta;
    }

    public String getTipoRicetta() {
        return tipoRicetta;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public String getIngredienti() {
        return ingredienti;
    }

    public String getProcedimento() {
        return procedimento;
    }

    public String getTempoSvolgimento() {
        return tempoSvolgimento;
    }

    public String getDifficolta() {
        return difficolta;
    }

    public void setIdRicetta(String idRicetta) {
        this.idRicetta = idRicetta;
    }

    public void setNomeCategoria(String nomeCategoria) {
        this.nomeCategoria = nomeCategoria;
    }

    public void setNomeRicetta(String nomeRicetta) {
        this.nomeRicetta = nomeRicetta;
    }

    public void setTipoRicetta(String tipoRicetta) {
        this.tipoRicetta = tipoRicetta;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public void setIngredienti(String ingredienti) {
        this.ingredienti = ingredienti;
    }

    public void setProcedimento(String procedimento) {
        this.procedimento = procedimento;
    }

    public void setTempoSvolgimento(String tempoSvolgimento) {
        this.tempoSvolgimento = tempoSvolgimento;
    }

    public void setDifficolta(String difficolta) {
        this.difficolta = difficolta;
    }
    public List<String> getSvolgimentoPassaggi() {
        // Dividi i passaggi usando la regex "\d+\."
        String[] passaggi = this.procedimento.split("\\d+\\.");
        return Arrays.stream(passaggi)
                .map(String::trim) // Rimuovi eventuali spazi vuoti
                .filter(p -> !p.isEmpty()) // Escludi passaggi vuoti
                .collect(Collectors.toList());
    }

    @Override
    public String toString()
    {
        return "Ricetta{"+"idRicetta='"+idRicetta+'\''+",nomeCategoria='"+nomeCategoria+'\''+",nomeRicetta='"+nomeRicetta+'\''+",tipoRicetta='"+tipoRicetta+'\''+",descrizione='"+descrizione+'\''+",ingredienti='"+ingredienti+'\''+",procedimento='"+procedimento+'\''+",tempoSvolgimento='"+tempoSvolgimento+'\''+",difficoltà='"+difficolta+'}';
    }
}

