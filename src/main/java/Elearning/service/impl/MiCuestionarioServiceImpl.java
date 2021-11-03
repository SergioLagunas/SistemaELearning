package Elearning.service.impl;

import Elearning.dao.CuestionarioDao;
import Elearning.dao.MiCuestionarioDao;
import Elearning.dao.MiCursoDao;
import Elearning.dao.UsuarioDao;
import Elearning.modelo.Cuestionario;
import Elearning.modelo.MiCuestionario;
import Elearning.modelo.MiCurso;
import Elearning.modelo.Usuario;
import Elearning.service.MiCuestionarioService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service("MiCuestionarioService")
public class MiCuestionarioServiceImpl implements MiCuestionarioService {
    @Autowired
    private MiCuestionarioDao miCuestionarioDao;
    
    @Autowired
    private CuestionarioDao cuestionarioDao;

    @Autowired
    private UsuarioDao usuarioDao;
    
    @Autowired
    private MiCursoDao miCursoDao;
    
    @Override
    public String listAllMiCuestionario(Model model) {
        model.addAttribute("miCuestionarios", miCuestionarioDao.findAll());
        return "cuestionario";
    }

    @Override
    public String createNewMiCuestionario(boolean evaluacion, int idUsuario, int idCuestionario) {
        try{
            //Obtener el Usuario
            Usuario usuario = new Usuario();
            usuario = usuarioDao.getUsuario(idUsuario); //--> Establecer el ID del Usuario que se recupera
            //Obtener el Cuestionario
            Cuestionario cuestionario = new Cuestionario();
            cuestionario = cuestionarioDao.getCuestionario(idCuestionario); //--> Establecer el ID del Cuestionario que se recupera
            //Crear MiCuestionario
            MiCuestionario miCuestionario = new MiCuestionario();
            miCuestionario.setEvaluacion(evaluacion);
            miCuestionario.setUsuario(usuario);
            miCuestionario.setCuestionario(cuestionario);
            //Agregar MiCuestionario a Usuario (Solo relaciona las tablas)
            usuario.addMiCuestionario(miCuestionario);
            //Agregar MiCuestionario a Cuestionario (Solo relaciona las tablas)
            cuestionario.addMiCuestionario(miCuestionario);
            //Agregar MiCuestionario a la BD (Previamente se tuvieron que relacionar las tablas)
            miCuestionario = miCuestionarioDao.create(miCuestionario);
            
            //Retornar respuesta de exito
            return "MiCuestionario creado";
        } catch(Exception e){
            //Retornar respuesta de error
            System.out.println("Hubo un error en createNewMiCuestionario - MiCuestionarioServiceImpl.java ---> " + e);
            return "MiCuestionario no creado";
        }
    }

    @Override
    public String updateMiCuestionario(int idMiCuestionario, boolean evaluacion) {
        try{
            //Crear MiCuestionario
            MiCuestionario miCuestionario = new MiCuestionario();
            //Recuperar por Id MiCuestionario ya existente
            miCuestionario = miCuestionarioDao.getMiCuestionario(idMiCuestionario);
            //Modificar la Evaluacion de MiCuestionario
            miCuestionario.setEvaluacion(evaluacion);
            //Actualizar MiCuestionario en la BD
            miCuestionario = miCuestionarioDao.update(miCuestionario);

            //Retornar respuesta de exito
            return "MiCuestionario actualizado";
        } catch(Exception e){
            //Retornar respuesta de error
            System.out.println("Hubo un error en updateMiCuestionario - MiCuestionarioServiceImpl.java ---> " + e);
            return "MiCuestionario no actualizado";
        }
    }

    @Override
    public boolean deleteMiCuestionario(int idMiCuestionario) {
        try{
            //Crear MiCuestionario
            MiCuestionario miCuestionario = new MiCuestionario();
            //Recuperar por Id MiCuestionario ya existente
            miCuestionario = miCuestionarioDao.getMiCuestionario(idMiCuestionario);
            //Eliminar MiCuestionario en la BD
            if(miCuestionarioDao.delete(miCuestionario)){
                //Retornar respuesta de exito
                return true;
            } else 
                //Retornar respuesta de error
                return false;
        } catch(Exception e){
            //Retornar respuesta de error
            System.out.println("Hubo un error en deleteMiCuestionario - MiCuestionarioServiceImpl.java ---> " + e);
            return false;
        }
    }

    @Override
    public boolean validateMiCuestionario(int idUsuario, int idCuestionario) {
        List<MiCuestionario> list=miCuestionarioDao.findByUsuarioByCuestionario(idUsuario, idCuestionario);
        if (list.isEmpty() || list == null)
            return false;
        else
            return true;
    }
    
    @Override
    public int getIdMiCuestionario(int idUsuario, int idCuestionario) {
        return miCuestionarioDao.getByUsuarioByCuestionario(idUsuario, idCuestionario).getIdMiCuestionario();
    }

    @Override
    public String defineProgress(int idCurso, int idUsuario) {
        try{
            //Obtener el total de Cuestionarios del Curso
            int CuestionariosByCurso = 0;
            CuestionariosByCurso = cuestionarioDao.countByCurso(idCurso);
            System.out.println("Total de Cuestionarios del Curso " + idCurso + ": " + CuestionariosByCurso);
            //Obtener el total de Cuestionarios aprobados por el Usuario
            int CuestionariosAprobados = miCuestionarioDao.countApproved(idUsuario, idCurso);
            //Establecer el progreso obtenido hasta el momento, mediante una regla de 3
            int ProgresoObtenido = (CuestionariosAprobados * 100) / CuestionariosByCurso;
            System.out.println("Cuestionarios Aprobados: " + CuestionariosAprobados);
            System.out.println("Progreso Obtenido: " + ProgresoObtenido);
            //Establecer el Progreso obtenido en la Base de Datos(Tabla MiCurso) 
            MiCurso miCurso = miCursoDao.getMiCursoByUsuarioCurso(idUsuario, idCurso);
            System.out.println("Estableciendo Progreso Obtenido...");
            miCurso.setProgreso(ProgresoObtenido);
            miCurso = miCursoDao.update(miCurso);
            
            return "Progreso establecido";
        } catch(Exception e){
            System.out.println("Hubo un error en defineProgress - MiCuestionarioServiceImpl.java ---> " + e);
            return "Progreso NO establecido";
        }
    }
}
