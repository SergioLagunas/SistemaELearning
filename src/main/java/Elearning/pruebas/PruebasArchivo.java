
package Elearning.pruebas;

import Elearning.dao.impl.ArchivoDaoImpl;
import Elearning.dao.impl.CursoDaoImpl;
import Elearning.modelo.Archivo;
import Elearning.modelo.Curso;


public class PruebasArchivo {
     public static void main(String[] args) {
         
         int idCurso = 21;
         System.out.println("id: "+idCurso);
         ArchivoDaoImpl archivo = new ArchivoDaoImpl();
         Archivo arc = new Archivo("Exel","dflskdfmlxvsdfm");
         Archivo arc2 = new Archivo("txt","dflskdfmlsdxvfm");
         Archivo arc3 = new Archivo("point","dflskdfmlsdxvfm");
         arc = archivo.create(arc);
         arc2 = archivo.create(arc2);
         arc3 = archivo.create(arc3);
         Curso curso = new Curso();
         CursoDaoImpl cur = new CursoDaoImpl();
         
         curso = cur.getCurso(idCurso);
         
         
         
         cur.update(curso);
         
     }
}
