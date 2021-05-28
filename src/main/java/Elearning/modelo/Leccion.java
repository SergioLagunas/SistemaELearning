
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
@Table(name="Leccion")
public class Leccion implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="idLeccion")
    private Integer idLeccion;
    
    @Column(name="titulo")
    private String titulo;
    
    @Column(name="objetivo")
    private String objetivo;
    
    @Column(name="idModulo")
    private Integer idModulo ;
    

    public Leccion() {
    }

    public Leccion(String titulo, String objetivo) {
        this.titulo = titulo;
        this.objetivo = objetivo;
    }

    public Integer getIdLeccion() {
        return idLeccion;
    }

    public void setIdLeccion(Integer idLeccion) {
        this.idLeccion = idLeccion;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(String objetivo) {
        this.objetivo = objetivo;
    }

    public Integer getIdModulo() {
        return idModulo;
    }

    public void setIdModulo(Integer idModulo) {
        this.idModulo = idModulo;
    } 

    @Override
    public String toString() {
        return "Leccion{" + "idLeccion=" + idLeccion + ", titulo=" + titulo + ", objetivo=" + objetivo + ", idModulo=" + idModulo + '}';
    }
    
}
