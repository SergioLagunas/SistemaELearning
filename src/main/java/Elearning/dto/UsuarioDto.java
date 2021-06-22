
package Elearning.dto;

import java.util.List;

public class UsuarioDto{
   
    private Integer idUsuario;
    private String nombre;
    private String aPaterno;
    private String aMaterno;
    private String genero;
    private String email;
    private String contrasena;
    private String tUsuario;
    private String rfc;
    private List<CursoDto> cursos;

    public UsuarioDto() {
    }
    
    public UsuarioDto(String nombre, String aPaterno, String aMaterno, String genero, String email, String contrasena, String tUsuario, String rfc) {
        this.nombre = nombre;
        this.aPaterno = aPaterno;
        this.aMaterno = aMaterno;
        this.genero = genero;
        this.email = email;
        this.contrasena = contrasena;
        this.tUsuario = tUsuario;
        this.rfc = rfc;
    }

    public UsuarioDto(String nombre, String aPaterno, String aMaterno, String genero, String email, String contrasena, String tUsuario, String rfc, List<CursoDto> cursos) {
        this.nombre = nombre;
        this.aPaterno = aPaterno;
        this.aMaterno = aMaterno;
        this.genero = genero;
        this.email = email;
        this.contrasena = contrasena;
        this.tUsuario = tUsuario;
        this.rfc = rfc;
        this.cursos = cursos;
    }
    
  
    
    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getaPaterno() {
        return aPaterno;
    }

    public void setaPaterno(String aPaterno) {
        this.aPaterno = aPaterno;
    }

    public String getaMaterno() {
        return aMaterno;
    }

    public void setaMaterno(String aMaterno) {
        this.aMaterno = aMaterno;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String gettUsuario() {
        return tUsuario;
    }

    public void settUsuario(String tUsuario) {
        this.tUsuario = tUsuario;
    }

    public String getRfc() {
        return rfc;
    }

    public void setRfc(String rfc) {
        this.rfc = rfc;
    }

}
