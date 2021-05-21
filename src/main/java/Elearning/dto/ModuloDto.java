
package Elearning.dto;


public class ModuloDto {
    private Integer idModulo;
    private String unidad;
    private String leccion;
    private TipoCursoDto  idTipoCurso;

    public Integer getIdModulo() {
        return idModulo;
    }

    public void setIdModulo(Integer idModulo) {
        this.idModulo = idModulo;
    }

    public String getUnidad() {
        return unidad;
    }

    public void setUnidad(String unidad) {
        this.unidad = unidad;
    }

    public String getLeccion() {
        return leccion;
    }

    public void setLeccion(String leccion) {
        this.leccion = leccion;
    }

    public TipoCursoDto getIdTipoCurso() {
        return idTipoCurso;
    }

    public void setIdTipoCurso(TipoCursoDto idTipoCurso) {
        this.idTipoCurso = idTipoCurso;
    }


}
