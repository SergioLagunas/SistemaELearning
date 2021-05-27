
package Elearning.dto;


public class LeccionDto {
    private Integer idLeccion;
    private String titulo;
    private String objetivo;
    private ModuloDto  idModulo;

    public LeccionDto() {
    }

    public LeccionDto(String titulo, String objetivo) {
        this.titulo = titulo;
        this.objetivo = objetivo;
    }

    public Integer getIdLeccion() {
        return idLeccion;
    }

    public void setIdLeccion(Integer idLeccion) {
        this.idLeccion = idLeccion;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(String objetivo) {
        this.objetivo = objetivo;
    }

    public ModuloDto getIdModulo() {
        return idModulo;
    }

    public void setIdModulo(ModuloDto idModulo) {
        this.idModulo = idModulo;
    }

    @Override
    public String toString() {
        return "LeccionDto{" + "idLeccion=" + idLeccion + ", titulo=" + titulo + ", objetivo=" + objetivo + ", idModulo=" + idModulo + '}';
    }

}
