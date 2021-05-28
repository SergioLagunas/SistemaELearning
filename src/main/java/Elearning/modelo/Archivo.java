
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
    
    @ManyToOne(cascade=CascadeType.ALL)
    @JoinColumn(name="idLeccion")
    List<Leccion> idLeccion;

    public Archivo() {
    }

    public Archivo(String tipo, String nombre) {
        this.tipo = tipo;
        this.nombre = nombre;
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

    public List<Leccion> getIdLeccion() {
        return idLeccion;
    }

    public void setIdLeccion(List<Leccion> idLeccion) {
        this.idLeccion = idLeccion;
    }

    @Override
    public String toString() {
        return "Archivo{" + "idArchivos=" + idArchivos + ", tipo=" + tipo + ", nombre=" + nombre + ", idLeccion=" + idLeccion + '}';
    }
    
}