
package Elearning.modelo;

import java.io.Serializable;
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
@Table(name="Evaluacion")
public class Evaluacion implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="idEvaluacion")
    private Integer idEvaluacion;
        
    @Column(name="tipo")
    private String tipo;
    
    @Column(name="calificacion")
    private float calificacion;
   
    @Column(name="aprobacion")
    private String aprobacion;
          
    @ManyToOne(cascade=CascadeType.ALL)
    @JoinColumn(name="idLeccion")
    List<Leccion> idLeccion;

    public Evaluacion() {
    }

    public Evaluacion(String tipo, float calificacion, String aprobacion) {
        this.tipo = tipo;
        this.calificacion = calificacion;
        this.aprobacion = aprobacion;
    }

    public Integer getIdEvaluacion() {
        return idEvaluacion;
    }

    public void setIdEvaluacion(Integer idEvaluacion) {
        this.idEvaluacion = idEvaluacion;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public float getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(float calificacion) {
        this.calificacion = calificacion;
    }

    public String getAprobacion() {
        return aprobacion;
    }

    public void setAprobacion(String aprobacion) {
        this.aprobacion = aprobacion;
    }

    public List<Leccion> getIdLeccion() {
        return idLeccion;
    }

    public void setIdLeccion(List<Leccion> idLeccion) {
        this.idLeccion = idLeccion;
    }

    @Override
    public String toString() {
        return "Evaluacion{" + "idEvaluacion=" + idEvaluacion + ", tipo=" + tipo + ", calificacion=" + calificacion + ", aprobacion=" + aprobacion + ", idLeccion=" + idLeccion + '}';
    }

    
}
