
package Elearning.dto;


public class Archivos {
    
    private Integer idArchivos;
    private String tipo;
    private String nombre;
    private Modulo idModulo;

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

    public Modulo getIdModulo() {
        return idModulo;
    }

    public void setIdModulo(Modulo idModulo) {
        this.idModulo = idModulo;
    }

  
    
}
