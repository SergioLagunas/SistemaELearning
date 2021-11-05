
package Elearning.modelo.formModel;

import org.springframework.web.multipart.MultipartFile;

public class ModuloModel {
    
    private String titulo;
    private String descripcion;
    private MultipartFile url;
    private String youtubeUrl;

    public ModuloModel() {
    }

    public ModuloModel(String tirulo, String descripcion, MultipartFile url) {
        this.titulo = tirulo;
        this.descripcion = descripcion;
        this.url = url;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String tirulo) {
        this.titulo = tirulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public MultipartFile getUrl() {
        return url;
    }

    public void setUrl(MultipartFile url) {
        this.url = url;
    }

    public String getYoutubeUrl() {
        return youtubeUrl;
    }

    public void setYoutubeUrl(String youtubeUrl) {
        this.youtubeUrl = youtubeUrl;
    }

    @Override
    public String toString() {
        return "ModuloModel{" + "titulo=" + titulo + ", descripcion=" + descripcion + ", url=" + url + ", youtubeUrl=" + youtubeUrl + '}';
    }  
}
