package Elearning.pruebas;

import Elearning.dao.impl.CuestionarioDaoImpl;
import Elearning.dao.impl.CursoDaoImpl;
import Elearning.dao.impl.MiCuestionarioDaoImpl;
import Elearning.dao.impl.MiCursoDaoImpl;
import Elearning.dao.impl.ModuloDaoImpl;
import Elearning.dao.impl.UsuarioDaoImpl;
import Elearning.dao.impl.PreguntasDaoImpl;
import Elearning.modelo.Cuestionario;
import Elearning.modelo.Preguntas;
import Elearning.modelo.Modulo;
import Elearning.modelo.Usuario;
import Elearning.modelo.Curso;
import Elearning.modelo.MiCuestionario;
import Elearning.modelo.MiCurso;
import Elearning.util.HibernateUtil;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author sergi
 */
public class PruebasDao {

    public static void main(String[] args) {
        //----------CREAR CUESTIONARIO----------
        /*//Obtener el Modulo
        Modulo ModuloPrueba = new Modulo();
        ModuloDaoImpl ModuloImpl = new ModuloDaoImpl();
        ModuloPrueba = ModuloImpl.getModulo(101); //--> Establecer el ID del Modulo que se recupera
        //Crear el Cuestionario
        Cuestionario Cuest = new Cuestionario("Cuestionario Prueba7");
        //Agregar Cuestionario al Modulo (Solo relaciona las tablas)
        ModuloPrueba.addCuestionarios(Cuest);
        //Agregar Cuestionario a la BD (Previamente se tuvieron que relacionar las tablas)
        CuestionarioDaoImpl CuestDao = new CuestionarioDaoImpl();
        Cuest = CuestDao.create(Cuest);*/
        
        //----------OBTENER CUESTIONARIO----------
//        CuestionarioDaoImpl CuestDao = new CuestionarioDaoImpl();
//        List<Cuestionario> cuestionarios = CuestDao.findAll();
//      
//        for(Cuestionario u : cuestionarios){
//            System.out.println(u.getNombre());
//        }
        
        //----------CREAR PREGUNTA----------
        //Obtener el Cuestionario
        /*Cuestionario Cuest = new Cuestionario();
        CuestionarioDaoImpl CuestDao = new CuestionarioDaoImpl();
        Cuest = CuestDao.getCuestionario(4); //--> Establecer el ID del Cuestionario que se recupera
        //Crear la Pregunta
        Preguntas Pre = new Preguntas("¿Esta es la primera pregunta?","RespuestaA","RespuestaB","RespuestaC");
        //Agregar Pregunta al Cuestionario (Solo relaciona las tablas)
        Cuest.addPreguntas(Pre);
        //Agregar Pregunta a la BD (Previamente se tuvieron que relacionar las tablas)
        PreguntasDaoImpl PreguntasDao = new PreguntasDaoImpl();
        Pre = PreguntasDao.create(Pre);*/
        
        //----------CREAR MICUESTIONARIO----------
        //Obtener el Usuario
        /*Usuario User = new Usuario();
        UsuarioDaoImpl UserDao = new UsuarioDaoImpl();
        User = UserDao.getUsuario(70); //--> Establecer el ID del Usuario que se recupera
        //Obtener el Cuestionario
        Cuestionario Cuest = new Cuestionario();
        CuestionarioDaoImpl CuestDao = new CuestionarioDaoImpl();
        Cuest = CuestDao.getCuestionario(14); //--> Establecer el ID del Cuestionario que se recupera
        //Crear MiCuestionario
        MiCuestionario miCuestionario = new MiCuestionario();
        miCuestionario.setEvaluacion(true);
        miCuestionario.setUsuario(User);
        miCuestionario.setCuestionario(Cuest);
        //Agregar MiCuestionario a Usuario (Solo relaciona las tablas)
        User.addMiCuestionario(miCuestionario);
        //Agregar MiCuestionario a Cuestionario (Solo relaciona las tablas)
        Cuest.addMiCuestionario(miCuestionario);
        //Agregar MiCuestionario a la BD (Previamente se tuvieron que relacionar las tablas)
        MiCuestionarioDaoImpl MiCuestionarioDao = new MiCuestionarioDaoImpl();
        miCuestionario = MiCuestionarioDao.create(miCuestionario);*/
        
        //----------OBTENER CUESTIONARIO----------
//        MiCuestionarioDaoImpl MiCuestionarioDao = new MiCuestionarioDaoImpl();
//        List<MiCuestionario> miCuestionarios = MiCuestionarioDao.findAll();
//      
//        System.out.println("LISTANDO MICUESTIONARIO...");
//        for(MiCuestionario u : miCuestionarios){
//            System.out.println(u.getIdMiCuestionario());
//        }

        //----------OBTENER MICUESTIONARIO----------
//        MiCuestionarioDaoImpl MiCuestionarioDao = new MiCuestionarioDaoImpl();
//        MiCuestionario miCuestionario = MiCuestionarioDao.getByUsuarioByCuestionario(63, 1);
//      
//        System.out.println("ID MICUESTIONARIO: " + miCuestionario.getIdMiCuestionario());

        
//        //----------ESTABLECER PROGRESO (MICURSO) EN RELACION CON MICUESTIONARIO----------
        CuestionarioDaoImpl CuestionarioDao = new CuestionarioDaoImpl();
        int CuestionariosByCurso = 0;
        CuestionariosByCurso = CuestionarioDao.countByCurso(27); //--> Establecer ID del Curso.
      
        System.out.println("Total de Cuestionarios por Curso: " + CuestionariosByCurso);
        
        //Establecer Progreso en base al Total de Cuestionarios por Curso y a la Evaluacion de MiCuestionario. 
        MiCuestionarioDaoImpl miCuestionarioDao = new MiCuestionarioDaoImpl();
        int CuestionariosAprobados = miCuestionarioDao.countApproved(69, 27);
        
        int ProgresoObtenido = (CuestionariosAprobados * 100) / CuestionariosByCurso;
        
        System.out.println("Cuestionarios Aprobados: " + CuestionariosAprobados);
        System.out.println("Progreso Obtenido: " + ProgresoObtenido);
        
        MiCursoDaoImpl miCursoDao = new MiCursoDaoImpl();
        MiCurso miCurso = miCursoDao.getMiCursoByUsuarioCurso(69, 27);
        
        System.out.println("Estableciendo Progreso Obtenido...");
        //miCurso.setProgreso(ProgresoObtenido);
        System.out.println("MiCurso Obtenido: " + miCurso.getProgreso());
        System.out.println("MiCurso Obtenido: " + miCurso.getIdUsuario());
        System.out.println("MiCurso Obtenido: " + miCurso.getIdCurso());
        miCurso.setProgreso(ProgresoObtenido);
        miCurso = miCursoDao.update(miCurso);

//        CuestionarioDaoImpl CuestionarioDao = new CuestionarioDaoImpl();
//        List<Cuestionario> Cuestionarios = CuestionarioDao.findAllByCurso(27);
//        for (Cuestionario c : Cuestionarios) {
//            System.out.println(c.getNombre());
//        }
                
        //System.out.println("Modulo: " + ModuloPrueba.toString());
        //System.out.println("Cuestionario: " + ModuloPrueba.getIdCuestionario().toString());

       //Session session = HibernateUtil.getSessionFactory().openSession();

       //UsuarioDaoImpl user = new UsuarioDaoImpl();
       
       //CursoDaoImpl curso = new CursoDaoImpl();
      //  CursoDaoImpl cur = new CursoDaoImpl();
        //Usuario usuario1 = new Usuario("Prueba", "nose", "nose", "Masculino", "karina@gmail.com", "contrasena", "semillero", "sdasd");

        /* int idUs=15;
        Usuario newUser = session.get(Usuario.class, idUs);
        newUser.setNombre("Sergio");
        newUser.setContrasena("12345454");  
        user.update(newUser);*/
 /*
       int idUser = 21;
       Usuario miUsuario = session.get(Usuario.class, idUser);
       miUsuario.setEmail("sergio@hotmail.com");
       miUsuario.setRfc("LAGS9712");
       
       user.update(miUsuario);
        
         */
 /*
      int idUsuario=4;
      Usuario elimUsuario = new Usuario();
      elimUsuario.setIdUsuario(idUsuario);
      user.getUsuario(idUsuario);
        System.out.println(user);
 
       
         */
        //Pruebas LisAll
        /*
      List<Usuario> usuarios = user.findAll();
      
      for(Usuario u : usuarios){
          System.out.println(u);
      }*/
        //Prueba para el query del login 
        /* 
      Usuario admin1 = new Usuario("Administrado0", "nose", "nose", "Masculino", "ricardo@gmail.com", "contrasena", "Administrador", "sdasd");
      Usuario admin2 = new Usuario("Administrado1", "nose", "nose", "Masculino", "ricardo@gmail.com", "contrasena", "Administrador", "sdasd");
      
      user.create(admin1);
      user.create(admin2);
         */
        // List<Usuario> newUser = user.findAll();
        /*int idUs = 31;
        Usuario newUser = session.get(Usuario.class, idUs);
        newUser.getEmail();
        newUser.getContrasena();
        newUser.gettUsuario();
        user.loginUsuario(newUser);
        */
       // System.out.println(user);

//        List<Usuario> usuarios = user.findAll();
//
//        for (Usuario u : usuarios) {
//            System.out.println(u);
//        }
       
       /* 
        String email ="otro@gmail.com";
        String contrasena = "contrasena123";
        
        Usuario user1 = new Usuario();
        user1.setEmail(email);
        user1.setContrasena(contrasena);
        user1 = user.loginUsuario(user1);
 
       if(user1 != null){
           String priv = user1.gettUsuario();
           if(priv.equals("semillero")){
               System.out.println("Semillero de nombre: "+user1.getNombre());
           }else if(priv.equals("Administrador")){
               System.out.println("Es admin de nombre: "+user1.getNombre());
           }
       }else{
           System.out.println("No existe en la BD");
       }
        */
        /* if(user1 != null){
            JOptionPane.showMessageDialog(null, "El usuario diguitado si existe en la BD con el nombre "
                    +user1.getNombre()+ " y con el rol de "+user1.gettUsuario());
            System.out.println("");
        }else{
            JOptionPane.showMessageDialog(null, "El usuario diguitado no existe");
        }
        
        */
        /*
        
        OtrasPruebas otra = new OtrasPruebas();
        String email ="ricardo@gmail.com";
        String contrasena = "contrasena";
        
        String prue=otra.DemoLogin(email, contrasena);
        System.out.println(prue);
   */
        
      // Usuario usuarioa = new Usuario("Administrador","Administrador","Administrador","Administrador","administradorb1@gmail.com","12345","Administrador","ADMIN");
      // user.create(usuarioa);
    }
   
   
}
