
package Elearning.dto;


public class ArchivosDto {
    
    private Integer idArchivos;
    private String tipo;
    private String nombre;
    private ModuloDto idModulo;

    public ArchivosDto() {
    }

    public ArchivosDto(String tipo, String nombre, ModuloDto idModulo) {
        this.tipo = tipo;
        this.nombre = nombre;
        this.idModulo = idModulo;
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

    public ModuloDto getIdModulo() {
        return idModulo;
    }

    public void setIdModulo(ModuloDto idModulo) {
        this.idModulo = idModulo;
    }

  
    
}
