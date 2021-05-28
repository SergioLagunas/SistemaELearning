
package Elearning.dto;


public class ArchivosDto {
    
    private Integer idArchivos;
    private String tipo;
    private String nombre;
    private Integer idLeccion;

    public ArchivosDto() {
    }

    public ArchivosDto(String tipo, String nombre) {
        this.tipo = tipo;
        this.nombre = nombre;
    }

    public Integer getIdArchivos() {
        return idArchivos;
    }

    public void setIdArchivos(Integer idArchivos) {
        this.idArchivos = idArchivos;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Integer getIdLeccion() {
        return idLeccion;
    }

    public void setIdLeccion(Integer idLeccion) {
        this.idLeccion = idLeccion;
    }

    
}
