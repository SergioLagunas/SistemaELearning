
package Elearning.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Usuario")
public class Usuario implements Serializable{
    
    @Id
    @Column(name="idUsuario")
    private Integer idUsuario;
    
    @Column(name="nombre")
    private String nombre;
    
    @Column(name="aPaterno")
    private String aPaterno;
    
    @Column(name="aMaterno")
    private String aMaterno;
    
    @Column(name="genero")
    private String genero;
    
    @Column(name="email")
    private String email;
    
    @Column(name="contrasena")
    private String contrasena;
    
    @Column(name="tUsuario")
    private String tUsuario;
    
    @Column(name="rfc")
    private String rfc;

    public Usuario() {
    }

    public Usuario(String nombre, String aPaterno, String aMaterno, String genero, String email, String contrasena, String tUsuario, String rfc) {
        this.nombre = nombre;
        this.aPaterno = aPaterno;
        this.aMaterno = aMaterno;
        this.genero = genero;
        this.email = email;
        this.contrasena = contrasena;
        this.tUsuario = tUsuario;
        this.rfc = rfc;
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

    @Override
    public String toString() {
        return "Usuario{" + "idUsuario=" + idUsuario + ", nombre=" + nombre + ", aPaterno=" + aPaterno + ", aMaterno=" + aMaterno + ", genero=" + genero + ", email=" + email + ", contrasena=" + contrasena + ", tUsuario=" + tUsuario + ", rfc=" + rfc + '}';
    }
    
}
