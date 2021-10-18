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
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="Cuestionario")
public class Cuestionario implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="idCuestionario")
    private int idCuestionario;
    
    @Column(name="nombre")
    private String nombre;
    
    //Relación MUCHOS a UNO con Modulo
    @ManyToOne(fetch = FetchType.LAZY,cascade = {CascadeType.PERSIST,CascadeType.MERGE,CascadeType.DETACH,CascadeType.REFRESH})
    @JoinColumn(name="idModulo")
    private Modulo idModulo;
    
    //Relacion UNO A MUCHOS con Preguntas
    @OneToMany(mappedBy = "idCuestionario",fetch=FetchType.LAZY,cascade = {CascadeType.PERSIST,CascadeType.MERGE,CascadeType.DETACH,CascadeType.REFRESH})
    private List<Preguntas> idPregunta;

    //Relacion UNO A MUCHOS con MiCuestionario --> "MUCHOS A MUCHOS"
    @OneToMany(mappedBy = "cuestionario",fetch=FetchType.LAZY,cascade = CascadeType.PERSIST)
    private List<MiCuestionario> miCuestionario;
    
    //Relacion MUCHOS A MUCHOS con Usuario
//    @ManyToMany(mappedBy = "cuestionarios",cascade = {CascadeType.PERSIST,CascadeType.MERGE,CascadeType.DETACH,CascadeType.REFRESH},fetch = FetchType.EAGER)
//    private Set<Usuario> usuarios = new HashSet<>();

    public Cuestionario() {}

    public Cuestionario(String nombre) {
        this.nombre = nombre;
    }
     
    public int getIdCuestionario() {
        return idCuestionario;
    }

    public void setIdCuestionario(int idCuestionario) {
        this.idCuestionario = idCuestionario;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public Modulo getIdModulo() {
        return idModulo;
    }

    public void setIdModulo(Modulo idModulo) {
        this.idModulo = idModulo;
    }
    
    public List<Preguntas> getIdPregunta() {
        return idPregunta;
    }

    public void setIdPregunta(List<Preguntas> idPregunta) {
        this.idPregunta = idPregunta;
    }
    
    public List<MiCuestionario> getMiCuestionario() {
        return miCuestionario;
    }

    public void setMiCuestionario(List<MiCuestionario> miCuestionario) {
        this.miCuestionario = miCuestionario;
    }
    
    public void addPreguntas(Preguntas preguntas){   
        if(idPregunta != null){
            idPregunta = new ArrayList<>();
            idPregunta.add(preguntas);
            preguntas.setIdCuestionario(this);
        }    
    }
    
    public void addMiCuestionario(MiCuestionario miCuestionario){   
        if(this.miCuestionario != null){
            this.miCuestionario = new ArrayList<>();
            this.miCuestionario.add(miCuestionario);
            miCuestionario.setCuestionario(this);
        }    
    }
}
