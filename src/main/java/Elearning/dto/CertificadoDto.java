
package Elearning.dto;

import java.util.Date;


public class CertificadoDto {
    
    private Integer idCertificado;
    private Date fEntrega;
    private String descripcion;
    private Integer idEvaluacion;

    public CertificadoDto() {
    }

    public CertificadoDto(Date fEntrega, String descripcion) {
        this.fEntrega = fEntrega;
        this.descripcion = descripcion;
    }
    

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

    public Integer getIdEvaluacion() {
        return idEvaluacion;
    }

    public void setIdEvaluacion(Integer idEvaluacion) {
        this.idEvaluacion = idEvaluacion;
    }
    
}
