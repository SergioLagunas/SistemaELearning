
package Elearning.dto;


import java.util.Date;

public class ModuloDto {
    
    private Integer idModulo;
    private String titulo;
    private Integer descripcion;
    private Integer idCurso;

    public ModuloDto() {
    }

    public ModuloDto(Integer idModulo, String titulo, Date fInicio, Date fTermino, Integer progreso) {
        this.idModulo = idModulo;
        this.titulo = titulo;
        this.descripcion = progreso;
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

    public Integer getProgreso() {
        return descripcion;
    }

    public void setProgreso(Integer progreso) {
        this.descripcion = progreso;
    }

    public Integer getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(Integer idCurso) {
        this.idCurso = idCurso;
    }
    
}

