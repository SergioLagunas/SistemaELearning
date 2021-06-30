
package Elearning.dao;

import Elearning.modelo.Evaluacion;
import java.util.List;

public interface EvaluacionDao {
    
    public List<Evaluacion> findAll();
    public Evaluacion create(final Evaluacion laEvaluacion);
    public Evaluacion getEvaluacion(final Integer idEvaluacion);
    public Evaluacion update(final Evaluacion laEvaluacion);
    public boolean delete(final Evaluacion laEvaluacion);
    
}
