
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
@Table(name="Archivo")
public class Archivo implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="idArchivo")
    private Integer idArchivos;
    
    @Column(name="tipo")
    private String tipo;
    
    @Column(name="nombre")
    private String nombre;
    
    @Column(name="idLeccion")
    private Integer idLeccion;

    public Archivo() {
    }

    public Archivo(String tipo, String nombre) {
        this.tipo = tipo;
        this.nombre = nombre;
    }

    public Integer getIdArchivo() {
        return idArchivos;
    }

    public void setIdArchivo(Integer idArchivos) {
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

    public Integer getIdLeccion() {
        return idLeccion;
    }

    public void setIdLeccion(Integer idLeccion) {
        this.idLeccion = idLeccion;
    }

    
    @Override
    public String toString() {
        return "Archivo{" + "idArchivos=" + idArchivos + ", tipo=" + tipo + ", nombre=" + nombre + ", idLeccion=" + idLeccion + '}';
    }
    
}
