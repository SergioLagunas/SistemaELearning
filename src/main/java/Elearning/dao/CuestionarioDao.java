package Elearning.dao;

import java.util.List;
import Elearning.modelo.Cuestionario;

public interface CuestionarioDao {

    public List<Cuestionario> findAll(int idModulo);
    public List<Cuestionario> findAllByCurso(int idCurso);
    public Integer countByCurso(final Integer idCurso);
    public Cuestionario getCuestionario(final Integer idCuestionario);
    public Integer getIdByModulo(final Integer idModulo);
    public Cuestionario create(final Cuestionario elCuestionario);
    public Cuestionario update(final Cuestionario elCuestionario);
    public boolean delete(final Cuestionario elCuestionario);
    
}
