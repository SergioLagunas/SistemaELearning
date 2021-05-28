
package Elearning.dto;


public class MiCursoDto {
    
    private Integer idUsuario;
    private Integer idCurso;

    public MiCursoDto() {
    }

    public MiCursoDto(Integer idUsuario, Integer idCurso) {
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
        return "MiCursoDto{" + "idUsuario=" + idUsuario + ", idCurso=" + idCurso + '}';
    }
    
    
}
