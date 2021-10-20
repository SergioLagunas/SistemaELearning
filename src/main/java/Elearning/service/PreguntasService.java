package Elearning.service;

import org.springframework.ui.Model;

public interface PreguntasService {
    //public String listAllPreguntas(Model model);
    public String createNewPreguntas(int IdCuestionario, String pregunta, String respuestaA, String respuestaB, String respuestaC);
    public String updatePreguntas(int idPregunta, String pregunta, String respuestaA, String respuestaB, String respuestaC);
    public boolean deletePreguntas(int idPregunta);
}
