package Elearning.dto;

public class MiCursoDto {
    private Integer idMiCurso;
    private CursoDto idCurso;
    private UsuarioDto idUsuario;

    public Integer getIdMiCurso() {
        return idMiCurso;
    }

    public void setIdMiCurso(Integer idMiCurso) {
        this.idMiCurso = idMiCurso;
    }

    public UsuarioDto getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(UsuarioDto idUsuario) {
        this.idUsuario = idUsuario;
    }

    public CursoDto getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(CursoDto idCurso) {
        this.idCurso = idCurso;
    }

    
}
