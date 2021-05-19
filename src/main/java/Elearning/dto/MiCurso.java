package Elearning.dto;

public class MiCurso {
    private Integer IdMisCursos;
    private Integer IdUsuario;
    private TipoCurso idTipoCurso;

    public Integer getIdMisCursos() {
        return IdMisCursos;
    }

    public void setIdMisCursos(Integer IdMisCursos) {
        this.IdMisCursos = IdMisCursos;
    }

    public Integer getIdUsuario() {
        return IdUsuario;
    }

    public void setIdUsuario(Integer IdUsuario) {
        this.IdUsuario = IdUsuario;
    }

    public TipoCurso getIdTipoCurso() {
        return idTipoCurso;
    }

    public void setIdTipoCurso(TipoCurso idTipoCurso) {
        this.idTipoCurso = idTipoCurso;
    }

    
    
}
