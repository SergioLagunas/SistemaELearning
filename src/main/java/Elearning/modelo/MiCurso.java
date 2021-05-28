
package Elearning.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class MiCurso implements Serializable{
  
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="idMiCurso")
    private Integer idMiCurso;
    
    @Column(name="idUsuario")
    private Integer idUsuario;
    
    @Column(name="idCurso")
    private Integer idCurso;

    public MiCurso() {
    }

    public MiCurso(Integer idUsuario, Integer idCurso) {
        this.idUsuario = idUsuario;
        this.idCurso = idCurso;
    }

    public Integer getIdMiCurso() {
        return idMiCurso;
    }

    public void setIdMiCurso(Integer idMiCurso) {
        this.idMiCurso = idMiCurso;
    }

    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    public Integer getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(Integer idCurso) {
        this.idCurso = idCurso;
    }
 

    @Override
    public String toString() {
        return "MiCurso{" + "idMiCurso=" + idMiCurso + ", idUsuario=" + idUsuario + ", idCurso=" + idCurso + '}';
    }

}
