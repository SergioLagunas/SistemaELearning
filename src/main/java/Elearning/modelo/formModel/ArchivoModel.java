
package Elearning.modelo.formModel;

import org.springframework.web.multipart.MultipartFile;

public class ArchivoModel {
    
    private String nombre;
    private MultipartFile archivo;

    public ArchivoModel() {
    }

    public ArchivoModel(String nombre, MultipartFile archivo) {
        this.nombre = nombre;
        this.archivo = archivo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public MultipartFile getArchivo() {
        return archivo;
    }

    public void setArchivo(MultipartFile archivo) {
        this.archivo = archivo;
    }

    @Override
    public String toString() {
        return "ArchivoModel{" + "nombre=" + nombre + ", archivo=" + archivo + '}';
    }
}
