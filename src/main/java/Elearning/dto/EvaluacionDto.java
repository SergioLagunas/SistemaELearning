package Elearning.dto;


public class EvaluacionDto {
    
    private Integer idEvaluacion;
    private String tipo;
    private float calificacion;
    private String aprobacion;
    private LeccionDto idLeccion;

    public EvaluacionDto() {
    }

    public EvaluacionDto(String tipo, float calificacion, String aprobacion) {
        this.tipo = tipo;
        this.calificacion = calificacion;
        this.aprobacion = aprobacion;
    }

    public Integer getIdEvaluacion() {
        return idEvaluacion;
    }

    public void setIdEvaluacion(Integer idEvaluacion) {
        this.idEvaluacion = idEvaluacion;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public float getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(float calificacion) {
        this.calificacion = calificacion;
    }

    public String getAprobacion() {
        return aprobacion;
    }

    public void setAprobacion(String aprobacion) {
        this.aprobacion = aprobacion;
    }

    public LeccionDto getIdLeccion() {
        return idLeccion;
    }

    public void setIdLeccion(LeccionDto idLeccion) {
        this.idLeccion = idLeccion;
    }

    
}
