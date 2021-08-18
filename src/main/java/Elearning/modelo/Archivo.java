
package Elearning.modelo;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Archivo")
public class Archivo implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="idArchivo")
    private Integer idArchivo;
    
    @Column(name="nombre")
    private String nombre;
   
    @Column(name="archivo")
    private String archivo;
    
    @ManyToOne(fetch = FetchType.LAZY,cascade = {CascadeType.ALL,CascadeType.MERGE,CascadeType.DETACH,CascadeType.REFRESH})
    @JoinColumn(name="idCurso")
    private Curso idCurso;

    public Archivo() {
    }

    public Archivo(String nombre, String archivo) {
        this.nombre = nombre;
        this.archivo = archivo;
    }

    public Integer getIdArchivo() {
        return idArchivo;
    }

    public void setIdArchivo(Integer idArchivo) {
        this.idArchivo = idArchivo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getArchivo() {
        return archivo;
    }

    public void setArchivo(String archivo) {
        this.archivo = archivo;
    }

    public Curso getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(Curso idCurso) {
        this.idCurso = idCurso;
    }

    @Override
    public String toString() {
        return "Archivo{" + "idArchivo=" + idArchivo + ", nombre=" + nombre + ", archivo=" + archivo + ", idCurso=" + idCurso + '}';
    }
    
    
    
}
