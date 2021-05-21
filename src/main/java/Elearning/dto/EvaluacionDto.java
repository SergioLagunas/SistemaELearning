package Elearning.dto;


public class EvaluacionDto {
    
    private Integer idEvaluacion;
    private String tipo;
    private float calificacion;
    private String aprobacion;
    private ModuloDto idModulo;

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

    public ModuloDto getIdModulo() {
        return idModulo;
    }

    public void setIdModulo(ModuloDto idModulo) {
        this.idModulo = idModulo;
    }
}
