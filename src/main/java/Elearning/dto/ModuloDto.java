
package Elearning.dto;


import java.util.Date;

public class ModuloDto {
    
    private Integer idModulo;
    private String titulo;
    private Date fInicio;
    private Date fTermino;
    private Integer progreso;
    private Integer idCurso;

    public ModuloDto() {
    }

    public ModuloDto(Integer idModulo, String titulo, Date fInicio, Date fTermino, Integer progreso) {
        this.idModulo = idModulo;
        this.titulo = titulo;
        this.fInicio = fInicio;
        this.fTermino = fTermino;
        this.progreso = progreso;
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

    public Integer getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(Integer idCurso) {
        this.idCurso = idCurso;
    }
    
}

