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
public class OtrasPruebas {
    
   
    public String DemoLogin(String email, String contrasena){
        
        UsuarioDaoImpl user = new UsuarioDaoImpl();
        Usuario user1 = new Usuario();
        user1.setEmail(email);
        user1.setContrasena(contrasena);
        user1 = user.loginUsuario(user1);
        String rol ="";
        String error = "No existe en la BD";
        
        if(user1 != null){
            rol = user1.gettUsuario();
            if(rol.equals("Administrador")){
                
                return rol;
            }else if(rol.equals("semillero")){
                
                return rol;
            }else {
                
                return error;

            }
        }
        
    return error;
 
    }

    
    
    
    
}
