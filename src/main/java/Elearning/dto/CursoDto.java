package Elearning.dto;

public class CursoDto {

    private Integer idCurso;
    private String nombre;
    private String descripcion;
    
    public int getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(Integer idCurso) {
        this.idCurso = idCurso;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getIdTipoCurso() {
        return descripcion;
    }

    public void setIdTipoCurso(String idTipoCurso) {
        this.descripcion = idTipoCurso;
    }
    
}
