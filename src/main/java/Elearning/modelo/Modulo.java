
package Elearning.modelo;

import Elearning.dto.TipoCursoDto;
import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Modulo")
public class Modulo implements Serializable{
    
    @Id
    @Column(name="idModulo")
    private Integer idModulo;
    
    @Column(name="unidad")
    private String unidad;
    
    @Column(name="leccion")
    private String leccion;
    
    @ManyToOne(cascade=CascadeType.ALL)
    @JoinColumn(name="idTipoCurso")
    List<TipoCurso> idTipoCurso;

    public Modulo() {
    }

    public Modulo(String unidad, String leccion, List<TipoCurso> idTipoCurso) {
        this.unidad = unidad;
        this.leccion = leccion;
        this.idTipoCurso = idTipoCurso;
    }

    public Integer getIdModulo() {
        return idModulo;
    }

    public void setIdModulo(Integer idModulo) {
        this.idModulo = idModulo;
    }

    public String getUnidad() {
        return unidad;
    }

    public void setUnidad(String unidad) {
        this.unidad = unidad;
    }

    public String getLeccion() {
        return leccion;
    }

    public void setLeccion(String leccion) {
        this.leccion = leccion;
    }

    public List<TipoCurso> getIdTipoCurso() {
        return idTipoCurso;
    }

    public void setIdTipoCurso(List<TipoCurso> idTipoCurso) {
        this.idTipoCurso = idTipoCurso;
    }

    @Override
    public String toString() {
        return "Modulo{" + "idModulo=" + idModulo + ", unidad=" + unidad + ", leccion=" + leccion + ", idTipoCurso=" + idTipoCurso + '}';
    }
    
}
