package Elearning.modelo.formModel;

import org.springframework.web.multipart.MultipartFile;

public class CursoModel {

    private String nombre;
    private String descripcion;
    private MultipartFile caratula;
    private String categoria;

    public CursoModel() {
    }

    public CursoModel(String nombre, String descripcion, MultipartFile caratula, String categoria) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.caratula = caratula;
        this.categoria = categoria;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public MultipartFile getCaratula() {
        return caratula;
    }

    public void setCaratula(MultipartFile caratula) {
        this.caratula = caratula;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

   
    
    

}
