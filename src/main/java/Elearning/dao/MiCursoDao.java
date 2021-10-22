package Elearning.dao;

import Elearning.modelo.MiCurso;
import Elearning.modelo.Usuario;
import java.util.List;

public interface MiCursoDao {
    public List<MiCurso> findAll();
    public MiCurso create(final MiCurso entidad);
    public List<MiCurso> getMiCurso(final Integer idUsuario);
    public MiCurso getMiCursoByUsuarioCurso(int idUsuario, int idCurso);
    public MiCurso update(final MiCurso entidad);
    public boolean delete(final MiCurso entidad);
    public boolean RelacionSem(int idUsuario,int idCurso);
    public Usuario findbyCurso(int idCurso);
    public MiCurso AsginProgreso(int idUsuario,int idCurso);
}