
package Elearning.modelo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Certificado")
public class Certificado implements Serializable{
    
    @Id
    @Column(name="idCertificado")
    private Integer idCertificado;
    
    @Column(name="fEntrega")
    private Date fEntrega;
    
    @Column(name="descripcion")
    private String descripcion;
    
    @ManyToOne(cascade=CascadeType.ALL)
    @JoinColumn(name="idEvaluacion")
    List<Evaluacion> idEvaluacion;

    public Certificado() {
    }

    public Certificado(Date fEntrega, String descripcion, List<Evaluacion> idEvaluacion) {
        this.fEntrega = fEntrega;
        this.descripcion = descripcion;
        this.idEvaluacion = idEvaluacion;
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

    public List<Evaluacion> getIdEvaluacion() {
        return idEvaluacion;
    }

    public void setIdEvaluacion(List<Evaluacion> idEvaluacion) {
        this.idEvaluacion = idEvaluacion;
    }

    @Override
    public String toString() {
        return "Certificado{" + "idCertificado=" + idCertificado + ", fEntrega=" + fEntrega + ", descripcion=" + descripcion + ", idEvaluacion=" + idEvaluacion + '}';
    }
    
}
