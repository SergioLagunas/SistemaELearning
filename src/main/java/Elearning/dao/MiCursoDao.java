
package Elearning.dao;

import Elearning.modelo.MiCurso;
import java.util.List;

public interface MiCursoDao {
    
    public List<MiCurso> findAll();
    public MiCurso create(final MiCurso entidad);
    public List<MiCurso> getMiCurso(final Integer idUsuario);
    public MiCurso update(final MiCurso entidad);
    public boolean delete(final MiCurso entidad);
    
}
