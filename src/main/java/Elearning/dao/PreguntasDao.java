package Elearning.dao;

import Elearning.modelo.Preguntas;
import java.util.List;

public interface PreguntasDao {
    
    public List<Preguntas> findAll(int idCuestionario);
    public Preguntas getPregunta(final Integer idPregunta);
    public Preguntas create(final Preguntas laPregunta);
    public Preguntas update(final Preguntas laPregunta);
    public boolean delete(final Preguntas laPregunta);
    
}
