
package Elearning.pruebas;

import Elearning.dao.impl.ArchivoDaoImpl;
import Elearning.modelo.Archivo;


public class PruebasArchivo {
     public static void main(String[] args) {
         
         ArchivoDaoImpl archivo = new ArchivoDaoImpl();
         Archivo arc = new Archivo("pdf","dflskdfmlsdfm");
         arc = archivo.create(arc);
     }
    
}
