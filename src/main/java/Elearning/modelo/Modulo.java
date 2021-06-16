
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
    private Integer idModulo;
    
    @Column(name="titulo")
    private String titulo;
    
    @Column(name="fInicio")
    private Date fInicio;
    
    @Column(name="fTermino")
    private Date fTermino;
    
    @Column(name="progreso")
    private Integer progreso;
    
    @Id
    @Column(name="idCurso")
    private Integer idCurso;

    public Modulo() {
    }

    public Modulo(String titulo, Date fInicio, Date fTermino, Integer progreso) {
        this.titulo = titulo;
        this.fInicio = fInicio;
        this.fTermino = fTermino;
        this.progreso = progreso;
    }

    public Integer getIdModulo() {
        return idModulo;
    }

    public void setIdModulo(Integer idModulo) {
        this.idModulo = idModulo;
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

    public Integer getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(Integer idCurso) {
        this.idCurso = idCurso;
    }

    @Override
    public String toString() {
        return "Modulo{" + "idModulo=" + idModulo + ", titulo=" + titulo + ", fInicio=" + fInicio + ", fTermino=" + fTermino + ", progreso=" + progreso + ", idCurso=" + idCurso + '}';
    }
    
    
}
