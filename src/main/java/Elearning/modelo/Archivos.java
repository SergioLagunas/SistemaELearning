
package Elearning.modelo;

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
@Table(name="Archivos")
public class Archivos implements Serializable{
    
    @Id
    @Column(name="idArchivos")
    private Integer idArchivos;
    
    @Column(name="tipo")
    private String tipo;
    
    @Column(name="nombre")
    private String nombre;
    
    @ManyToOne(cascade=CascadeType.ALL)
    @JoinColumn(name="idModulo")
    List<Modulo> idModulo;

    public Archivos() {
    }

    public Archivos(String tipo, String nombre, List<Modulo> idModulo) {
        this.tipo = tipo;
        this.nombre = nombre;
        this.idModulo = idModulo;
    }

    public Integer getIdArchivos() {
        return idArchivos;
    }

    public void setIdArchivos(Integer idArchivos) {
        this.idArchivos = idArchivos;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public List<Modulo> getIdModulo() {
        return idModulo;
    }

    public void setIdModulo(List<Modulo> idModulo) {
        this.idModulo = idModulo;
    }

    @Override
    public String toString() {
        return "Archivos{" + "idArchivos=" + idArchivos + ", tipo=" + tipo + ", nombre=" + nombre + ", idModulo=" + idModulo + '}';
    }
    
}
