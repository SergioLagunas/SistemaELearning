
package Elearning.modelo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="Modulo")
public class Modulo implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="idModulo")
    private Integer idTipoCurso;
    
    @Column(name="titulo")
    private String titulo;
    
    @Column(name="fInicio")
    private Date fInicio;
    
    @Column(name="fTermino")
    private Date fTermino;
    
    @Column(name="progreso")
    private Integer progreso;
    
    @ManyToOne(cascade=CascadeType.ALL)
    @JoinColumn(name="idCurso")
    List<Curso> idCurso;

    public Modulo() {
    }

    public Modulo(String titulo, Date fInicio, Date fTermino, Integer progreso, List<Curso> idCurso) {
        this.titulo = titulo;
        this.fInicio = fInicio;
        this.fTermino = fTermino;
        this.progreso = progreso;
        this.idCurso = idCurso;
    }

    public Integer getIdTipoCurso() {
        return idTipoCurso;
    }

    public void setIdTipoCurso(Integer idTipoCurso) {
        this.idTipoCurso = idTipoCurso;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public Date getfInicio() {
        return fInicio;
    }

    public void setfInicio(Date fInicio) {
        this.fInicio = fInicio;
    }

    public Date getfTermino() {
        return fTermino;
    }

    public void setfTermino(Date fTermino) {
        this.fTermino = fTermino;
    }

    public Integer getProgreso() {
        return progreso;
    }

    public void setProgreso(Integer progreso) {
        this.progreso = progreso;
    }

    public List<Curso> getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(List<Curso> idCurso) {
        this.idCurso = idCurso;
    }

    @Override
    public String toString() {
        return "TipoCurso{" + "idTipoCurso=" + idTipoCurso + ", titulo=" + titulo + ", fInicio=" + fInicio + ", fTermino=" + fTermino + ", progreso=" + progreso + ", idCurso=" + idCurso + '}';
    }
    
}
