package Elearning.dto;

public class CursoDto {

    private Integer idCurso;
    private String nombre;
    private String descripcion;
    private String caratula;
    private int progreso;
    private String categoria;

    public CursoDto() {
    }

    public CursoDto(String nombre, String descripcion, String caratula, int progreso, String categoria) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.caratula = caratula;
        this.progreso = progreso;
        this.categoria = categoria;
    }

    public Integer getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(Integer idCurso) {
        this.idCurso = idCurso;
    }

    public String getCaratula() {
        return caratula;
    }

    public void setCaratula(String caratula) {
        this.caratula = caratula;
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

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getProgreso() {
        return progreso;
    }

    public void setProgreso(int progreso) {
        this.progreso = progreso;
    }

    @Override
    public String toString() {
        return "CursoDto{" + "idCurso=" + idCurso + ", nombre=" + nombre + ", descripcion=" + descripcion + ", caratula=" + caratula + ", progreso=" + progreso + ", categoria=" + categoria + '}';
    }
    
}
