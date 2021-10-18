package Elearning.modelo;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Preguntas")
public class Preguntas implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="idPregunta")
    private int idPregunta;
    
    @Column(name="pregunta")
    private String pregunta;
    
    @Column(name="respuestaA")
    private String respuestaA;
    
    @Column(name="respuestaB")
    private String respuestaB;
    
    @Column(name="respuestaC")
    private String respuestaC;
    
    //Relación MUCHOS a UNO con Cuestionario
    @ManyToOne(fetch = FetchType.LAZY,cascade = {CascadeType.PERSIST,CascadeType.MERGE,CascadeType.DETACH,CascadeType.REFRESH})
    @JoinColumn(name="idCuestionario")
    private Cuestionario idCuestionario;

    public Preguntas() {}
    
    public Preguntas(String pregunta, String respuestaA, String respuestaB, String respuestaC) {
        this.pregunta = pregunta;
        this.respuestaA = respuestaA;
        this.respuestaB = respuestaB;
        this.respuestaC = respuestaC;
    }

    public int getIdPregunta() {
        return idPregunta;
    }

    public void setIdPregunta(int idPregunta) {
        this.idPregunta = idPregunta;
    }
    
    public String getPregunta() {
        return pregunta;
    }

    public void setPregunta(String pregunta) {
        this.pregunta = pregunta;
    }
    
    public String getRespuestaA() {
        return respuestaA;
    }

    public void setRespuestaA(String respuestaA) {
        this.respuestaA = respuestaA;
    }
    
    public String getRespuestaB() {
        return respuestaB;
    }

    public void setRespuestaB(String respuestaB) {
        this.respuestaB = respuestaB;
    }
    
    public String getRespuestaC() {
        return respuestaC;
    }

    public void setRespuestaC(String respuestaC) {
        this.respuestaC = respuestaC;
    }
    
    public Cuestionario getIdCuestionario() {
        return idCuestionario;
    }

    public void setIdCuestionario(Cuestionario idCuestionario) {
        this.idCuestionario = idCuestionario;
    }
}
