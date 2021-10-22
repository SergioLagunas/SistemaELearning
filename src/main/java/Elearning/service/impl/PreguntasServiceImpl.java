package Elearning.service.impl;

import Elearning.dao.CuestionarioDao;
import Elearning.dao.PreguntasDao;
import Elearning.modelo.Cuestionario;
import Elearning.modelo.Preguntas;
import Elearning.service.PreguntasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("PreguntasService")
public class PreguntasServiceImpl implements PreguntasService {
    @Autowired
    private PreguntasDao preguntasDao;
    
    @Autowired
    private CuestionarioDao cuestionarioDao;
    
//    @Override
//    public String listAllPreguntas(Model model) {
//        model.addAttribute("preguntas", preguntasDao.findAll());
//        return "cuestionario";
//    }

    @Override
    public String createNewPreguntas(int IdCuestionario, String pregunta, String respuestaA, String respuestaB, String respuestaC) {
        try{
            //Obtener el Cuestionario
            Cuestionario cuestionario = new Cuestionario();
            cuestionario = cuestionarioDao.getCuestionario(IdCuestionario); //--> Establecer el ID del Cuestionario
            //Crear la Pregunta
            Preguntas preguntas = new Preguntas(pregunta, respuestaA, respuestaB, respuestaC);
            //Agregar Pregunta al Cuestionario (Solo relaciona las tablas)
            cuestionario.addPreguntas(preguntas);
            //Agregar Pregunta a la BD (Previamente se tuvieron que relacionar las tablas)
            preguntas = preguntasDao.create(preguntas);
            
            //Retornar respuesta de exito
            return "Pregunta creada";
        } catch(Exception e){
            //Retornar respuesta de error
            System.out.println("Hubo un error en createNewPreguntas - PreguntasServiceImpl.java ---> " + e);
            return "Pregunta no creada";
        }
    }

    @Override
    public String updatePreguntas(int idPregunta, String pregunta, String respuestaA, String respuestaB, String respuestaC) {
        try{
            //Crear la Pregunta
            Preguntas preguntas = new Preguntas();
            //Recuperar por Id la Pregunta ya existente
            preguntas = preguntasDao.getPregunta(idPregunta);
            //Modificar los datos de la Pregunta
            preguntas.setPregunta(pregunta);
            preguntas.setRespuestaA(respuestaA);
            preguntas.setRespuestaB(respuestaB);
            preguntas.setRespuestaC(respuestaC);
            //Actualizar Pregunta en la BD
            preguntas = preguntasDao.update(preguntas);

            //Retornar respuesta de exito
            return "Pregunta actualizada";
        } catch(Exception e){
            //Retornar respuesta de error
            System.out.println("Hubo un error en updatePreguntas - PreguntasServiceImpl.java ---> " + e);
            return "Pregunta no actualizada";
        }
    }

    @Override
    public boolean deletePreguntas(int idPregunta) {
        try{
            //Crear la Pregunta
            Preguntas preguntas = new Preguntas();
            //Recuperar por Id la Pregunta ya existente
            preguntas = preguntasDao.getPregunta(idPregunta);
            //Eliminar Pregunta en la BD
            if(preguntasDao.delete(preguntas)){
                //Retornar respuesta de exito
                return true;
            } else 
                //Retornar respuesta de error
                return false;
        } catch(Exception e){
            //Retornar respuesta de error
            System.out.println("Hubo un error en deletePreguntas - PreguntasServiceImpl.java ---> " + e);
            return false;
        }
    }
}
