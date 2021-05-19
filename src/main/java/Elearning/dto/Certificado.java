
package Elearning.dto;

import java.util.Date;


public class Certificado {
    
    private Integer idCertificado;
    private Date fEntrega;
    private String descripcion;
    private Evaluacion idEvaluacion;

    public Integer getIdCertificado() {
        return idCertificado;
    }

    public void setIdCertificado(Integer idCertificado) {
        this.idCertificado = idCertificado;
    }

    public Date getfEntrega() {
        return fEntrega;
    }

    public void setfEntrega(Date fEntrega) {
        this.fEntrega = fEntrega;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Evaluacion getIdEvaluacion() {
        return idEvaluacion;
    }

    public void setIdEvaluacion(Evaluacion idEvaluacion) {
        this.idEvaluacion = idEvaluacion;
    }
    
    
    
}
