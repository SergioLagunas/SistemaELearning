
package Elearning.modelo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Certificado")
public class Certificado implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="idCertificado")
    private Integer idCertificado;
    
    @Column(name="fEntrega")
    private String fEntrega;
    
    @Column(name="descripcion")
    private String descripcion;
    
    @Column(name="idEvaluacion")
    private String idEvaluacion;

    public Certificado() {
    }

    public Certificado(String fEntrega, String descripcion) {
        this.fEntrega = fEntrega;
        this.descripcion = descripcion;
    }

    public Integer getIdCertificado() {
        return idCertificado;
    }

    public void setIdCertificado(Integer idCertificado) {
        this.idCertificado = idCertificado;
    }

    public String getfEntrega() {
        return fEntrega;
    }

    public void setfEntrega(String fEntrega) {
        this.fEntrega = fEntrega;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getIdEvaluacion() {
        return idEvaluacion;
    }

    public void setIdEvaluacion(String idEvaluacion) {
        this.idEvaluacion = idEvaluacion;
    }

    @Override
    public String toString() {
        return "Certificado{" + "idCertificado=" + idCertificado + ", fEntrega=" + fEntrega + ", descripcion=" + descripcion + ", idEvaluacion=" + idEvaluacion + '}';
    }

    
}
