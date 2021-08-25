package Elearning.pruebas;

import Elearning.dao.impl.CursoDaoImpl;
import Elearning.dao.impl.MiCursoDaoImpl;
import Elearning.dao.impl.UsuarioDaoImpl;
import Elearning.modelo.Curso;
import Elearning.modelo.MiCurso;
import Elearning.modelo.Usuario;
import Elearning.util.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.springframework.dao.support.DaoSupport;

public class MiCursoPrueba {

    public static void main(String[] args) {

        int idUsuario = 63;
        MiCurso micurso = new MiCurso();
        Curso cu = new Curso();
        CursoDaoImpl cu2 = new CursoDaoImpl();
        MiCursoDaoImpl mCurso = new MiCursoDaoImpl();
        UsuarioDaoImpl us = new UsuarioDaoImpl();
        Usuario user = new Usuario();

        List<MiCurso> mcur = mCurso.getMiCurso(idUsuario);
        System.out.println("Imprecion de MiCurso");
        List<Integer> idCurso = new ArrayList<>();
        List<Curso> losCursos = new ArrayList<>();
 
        System.out.println(" " + mcur.size());

        for (int i = 0; i < mcur.size(); i++) {
            idCurso.add(mcur.get(i).getIdCurso());
        }
         for (int i = 0; i < idCurso.size(); i++) {
            losCursos.add(cu2.getCurso(idCurso.get(i)));
        }
        
        System.out.println("");
         for (Curso u : losCursos) {
            System.out.println(u);
        }
        /*for (Integer u : idCurso) {
            System.out.println(u);
        }*/
        // user = mCurso.findbyCurso(idUsuario);

        // System.out.println("Cursos: "+user);
        //user = us.getUsuario(idUsuario);
        // System.out.println("Cursos: "+user.getCursos());
        /* 
        List<Curso> curso = new ArrayList<>(user.getCursos());
        
        System.out.println("Los Cursos del usuario son: ");
        for (Curso u : curso) {
            System.out.println(u);
        }
         */
 /* 
        user = mCurso.findbyCurso(idUsuario);
        
        System.out.println("Cursos del Usuario: "+user);
         */
 /*List<MiCurso> mc = mCurso.findbyCurso(idUsuario);

        for (MiCurso u : mc) {
            System.out.println(u);
        }*/
    }

}
