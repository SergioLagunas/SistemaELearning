
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
@Table(name="MiCurso")
public class MiCurso implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="idMiCurso")
    private Integer idMiCurso;
    
    @ManyToOne(cascade=CascadeType.ALL)
    @JoinColumn(name="idCurso")
    List<Curso> idCurso;
    
    @ManyToOne(cascade=CascadeType.ALL)
    @JoinColumn(name="idUsuario")
    List<Usuario> idUsuario;

    public MiCurso() {
    }

    public MiCurso(List<Curso> idCurso, List<Usuario> idUsuario) {
        this.idCurso = idCurso;
        this.idUsuario = idUsuario;
    }

    public Integer getIdMiCurso() {
        return idMiCurso;
    }

    public void setIdMiCurso(Integer idMiCurso) {
        this.idMiCurso = idMiCurso;
    }

    public List<Curso> getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(List<Curso> idCurso) {
        this.idCurso = idCurso;
    }

    public List<Usuario> getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(List<Usuario> idUsuario) {
        this.idUsuario = idUsuario;
    }

    @Override
    public String toString() {
        return "MiCurso{" + "idMiCurso=" + idMiCurso + ", idCurso=" + idCurso + ", idUsuario=" + idUsuario + '}';
    }

    
}
