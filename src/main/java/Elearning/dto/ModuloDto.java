
package Elearning.dto;


public class ModuloDto {
    
    private Integer idModulo;
    private String titulo;
    private String descripcion;
    private String url;
    private Integer idCurso;

    public ModuloDto() {
    }

    public ModuloDto(String titulo, String descripcion, String url) {
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.url = url;
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

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Integer getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(Integer idCurso) {
        this.idCurso = idCurso;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "ModuloDto{" + "idModulo=" + idModulo + ", titulo=" + titulo + ", descripcion=" + descripcion + ", url=" + url + ", idCurso=" + idCurso + '}';
    }
 
    
    
}

