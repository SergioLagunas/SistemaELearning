
package Elearning.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
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
@Table(name="Curso")
public class Curso implements Serializable{
   
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="idCurso")
    private Integer idCurso;
    
    @Column(name="nombre")
    private String nombre;
    
    @Column(name="descripcion")
    private String descripcion;
    
    @Column(name="caratula")
    private String caratula;
    
    @Column(name="progreso")
    private int progreso;
    
    @Column(name="categoria")
    private String categoria;
    
    //Relacion UNO A MUCHOS con Modulo
    @OneToMany(mappedBy = "idCurso",fetch=FetchType.EAGER,cascade = {CascadeType.ALL,CascadeType.MERGE,CascadeType.DETACH,CascadeType.REFRESH})
    private List<Modulo> idModulo;
    
    //Relacion Uno a Muchos con Archivo
    @OneToMany(mappedBy = "idCurso",fetch=FetchType.LAZY,cascade = {CascadeType.ALL,CascadeType.MERGE,CascadeType.DETACH,CascadeType.REFRESH})
    private Set<Archivo> idArchivo;
    
    //Relacion MUCHOS A MUCHOS con Usuario
    @ManyToMany(mappedBy = "cursos",cascade = {CascadeType.PERSIST,CascadeType.MERGE,CascadeType.DETACH,CascadeType.REFRESH},fetch = FetchType.EAGER)
    private Set<Usuario> usuarios= new HashSet<>();

    public Curso() {
    }

    public Curso(String nombre, String descripcion, String caratula, int progreso, String categoria) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.caratula = caratula;
        this.progreso = progreso;
        this.categoria = categoria;
    }

    public int getProgreso() {
        return progreso;
    }

    public void setProgreso(int progreso) {
        this.progreso = progreso;
    }

    

    public Integer getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(Integer idCurso) {
        this.idCurso = idCurso;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getCaratula() {
        return caratula;
    }

    public void setCaratula(String caratula) {
        this.caratula = caratula;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public List<Modulo> getIdModulo() {
        return idModulo;
    }

    public void setIdModulo(List<Modulo> idModulo) {
        this.idModulo = idModulo;
    }

    public Set<Usuario> getUsuarios() {
        return usuarios;
    }

    public void setUsuarios(Set<Usuario> usuarios) {
        this.usuarios = usuarios;
    }
    
       
    public void addModulos(Modulo modulo){   
        if(idModulo!=null){
            idModulo=new ArrayList<>();
            idModulo.add(modulo);
            modulo.setIdCurso(this);
        }    
    }
    
    public void addArchivos(Archivo archivo){   
        if(idArchivo!=null){
            idArchivo= new HashSet<>();
            idArchivo.add(archivo);
            archivo.setIdCurso(this);
        }    
    }

  
    @Override
    public String toString() {
        return "Curso{" + "idCurso=" + idCurso + ", nombre=" + nombre + ", descripcion=" + descripcion + ", caratula=" + caratula + ", progreso=" + progreso + ", categoria=" + categoria + '}';
    }


}
