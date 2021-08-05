
package Elearning.dao;

import Elearning.modelo.Curso;
import java.util.List;


public interface CursoDao {
    
    public List<Curso> findAll();
    public Curso create(final Curso elCurso);
    public Curso getCurso(final Integer idCurso);
    public Curso update(final Curso elCurso);
    public boolean delete(final Curso elCurso);
    public List<Curso> findbyCategory(String categoria);
    
    
}
