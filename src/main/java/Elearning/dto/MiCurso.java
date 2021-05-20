package Elearning.dto;

public class MiCurso {
    private Integer idMiCurso;
    private Curso idCurso;
    private Usuario IdUsuario;

    public Integer getIdMiCurso() {
        return idMiCurso;
    }

    public void setIdMiCurso(Integer idMiCurso) {
        this.idMiCurso = idMiCurso;
    }

    public Usuario getIdUsuario() {
        return IdUsuario;
    }

    public void setIdUsuario(Usuario IdUsuario) {
        this.IdUsuario = IdUsuario;
    }

    public Curso getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(Curso idCurso) {
        this.idCurso = idCurso;
    }

    
}
