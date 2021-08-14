/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Elearning.pruebas;

import Elearning.dao.impl.CursoDaoImpl;
import Elearning.dao.impl.MiCursoDaoImpl;
import Elearning.dao.impl.UsuarioDaoImpl;
import Elearning.modelo.Usuario;
import Elearning.modelo.Curso;
import Elearning.modelo.MiCurso;
import Elearning.util.HibernateUtil;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.EntityManager;
import org.hibernate.Session;

/**
 *
 * @author Jose
 */
public class PruebasManyToMany {
    /*
    public static void main(String[] args){
        /*
    CursoDaoImpl curso = new CursoDaoImpl();
    String categoria = "Back-End";
    
     List<Curso> cursos = curso.findbyCategory(categoria);
      
      for(Curso u : cursos){
          System.out.println(u);
      }
    */
    /*    
        MiCursoDaoImpl mc = new MiCursoDaoImpl();
        MiCurso micurso = new MiCurso();
     
        if(mc.RelacionSem(62, 3)){
            System.out.println("ya hay una relacion ");
        }else{
            System.out.println("no hay relacion");
        }

    }*/
 
}
