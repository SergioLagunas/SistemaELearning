/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Elearning.pruebas;

import Elearning.dao.impl.CursoDaoImpl;
import Elearning.dao.impl.UsuarioDaoImpl;
import Elearning.modelo.Usuario;
import Elearning.modelo.Curso;
import Elearning.util.HibernateUtil;
import java.util.HashSet;
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
        
        Curso cur1 = new Curso();
        cur1.setIdCurso(2);
        cur1.setNombre("Angular");
        
        Curso cur2 = new Curso();
        cur2.setIdCurso(4);
        cur2.setNombre("Java");
        
        Usuario usu1 = new Usuario();
        usu1.setIdUsuario(47);
        usu1.setNombre("Administrador");
        
        Usuario usu2 = new Usuario();
        usu2.setIdUsuario(48);
        usu2.setNombre("Sergio");
        
        Set<Usuario> usuarios1 = new HashSet<Usuario>();
        usuarios1.add(usu1);
        usuarios1.add(usu2);
        Set<Subject> subjects2 = new HashSet<Subject>();
        subjects2.add(subject3);

        
        
        
        
    }
 */
}
