/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Elearning.pruebas;

import Elearning.dao.impl.UsuarioDaoImpl;
import Elearning.modelo.Usuario;

/**
 *
 * @author sergi
 */
public class PruebaRecuperacionContra {
      public static void main(String[] args) {
          
          String correo = "said@gmail.com";
          UsuarioDaoImpl user = new UsuarioDaoImpl();
          Usuario usu = new Usuario();
          
          usu = user.getEmail(correo);
          
          if(usu!=null){
                System.out.println("La contraseña del usuario: "+usu.getNombre()+" es "+usu.getContrasena());
                System.out.println("Eviar la contraseña: "+usu.getContrasena());
          }else{
              System.out.println("Este correo no ha sido registrado");
          }

          
                 
      }
        
    
}
