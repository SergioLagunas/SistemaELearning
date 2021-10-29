package Elearning.dao;

import Elearning.modelo.MiCuestionario;
import Elearning.modelo.Usuario;
import java.util.List;

public interface MiCuestionarioDao {

    public List<MiCuestionario> findAll();
    public List<MiCuestionario> findByUsuarioByCuestionario(int idUsuario, int idCuestionario);
    public MiCuestionario getMiCuestionario(Integer idMiCuestionario);
    public MiCuestionario create(MiCuestionario miCuestionario);
    public MiCuestionario update(MiCuestionario miCuestionario);
    public boolean delete(MiCuestionario miCuestionario);
    public Integer countApproved(int idUsuario,int idCurso);
    //public Usuario findbyCurso(int idCuestionario);
    //public MiCuestionario AsginProgreso(int idUsuario,int idCuestionario);
    
}
