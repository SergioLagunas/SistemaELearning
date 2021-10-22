package Elearning.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Modulo")
public class Modulo implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idModulo")
    private Integer idModulo;

    @Column(name = "titulo")
    private String titulo;

    @Column(name = "descripcion")
    private String descripcion;
    
    @Column(name = "url")
    private String url;

    //Relación MUCHOS a UNO con Curso
    @ManyToOne(fetch = FetchType.LAZY,cascade = {CascadeType.ALL,CascadeType.MERGE,CascadeType.DETACH,CascadeType.REFRESH})
    @JoinColumn(name="idCurso")
    private Curso idCurso;
    
    //Relación UNO a MUCHOS con Cuestionario
    @OneToMany(mappedBy = "idModulo",fetch=FetchType.LAZY,cascade = {CascadeType.ALL,CascadeType.MERGE,CascadeType.DETACH,CascadeType.REFRESH})
    private List<Cuestionario> idCuestionario;

    public Modulo() {}

    public Modulo(String titulo, String descripcion, String url) {
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.url = url;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
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

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Curso getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(Curso idCurso) {
        this.idCurso = idCurso;
    }
    
    public List<Cuestionario> getIdCuestionario() {
        return idCuestionario;
    }

    public void setIdCuestionario(List<Cuestionario> idCuestionario) {
        this.idCuestionario = idCuestionario;
    }

    public void addCuestionarios(Cuestionario cuestionario){   
        if(idCuestionario != null){
            idCuestionario = new ArrayList<>();
            idCuestionario.add(cuestionario);
            cuestionario.setIdModulo(this);
        }    
    }
    
    @Override
    public String toString() {
        return "Modulo{" + "idModulo=" + idModulo + ", titulo=" + titulo + ", descripcion=" + descripcion + ", url=" + url + ", idCurso=" + idCurso + '}';
    }
}
