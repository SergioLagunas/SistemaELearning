
package Elearning.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class MiCurso implements Serializable{
  
    @Id
    @Column(name="idUsuario")
    private Integer idUsuario;
    @Id
    @Column(name="idCurso")
    private Integer idCurso;

    public MiCurso() {
    }

    public MiCurso(Integer idUsuario, Integer idCurso) {
        this.idUsuario = idUsuario;
        this.idCurso = idCurso;
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
        return "MiCurso{" + "idUsuario=" + idUsuario + ", idCurso=" + idCurso + '}';
    }
 

    
}
