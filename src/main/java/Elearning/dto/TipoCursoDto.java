
package Elearning.dto;


import java.util.Date;

public class TipoCursoDto {
    
    private Integer idTipoCurso;
    private String titulo;
    private Date fInicio;
    private Date fTermino;
    private Integer progreso;
    private CursoDto idCurso;

    
    public Integer getIdTipoCurso() {
        return idTipoCurso;
    }

    public void setIdTipoCurso(Integer idTipoCurso) {
        this.idTipoCurso = idTipoCurso;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public Date getfInicio() {
        return fInicio;
    }

    public void setfInicio(Date fInicio) {
        this.fInicio = fInicio;
    }

    public Date getfTermino() {
        return fTermino;
    }

    public void setfTermino(Date fTermino) {
        this.fTermino = fTermino;
    }

    public Integer getProgreso() {
        return progreso;
    }

    public void setProgreso(Integer progreso) {
        this.progreso = progreso;
    }

    public CursoDto getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(CursoDto idCurso) {
        this.idCurso = idCurso;
    }


    
    
}

