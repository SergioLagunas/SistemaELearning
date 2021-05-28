
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
  

    

    
}

