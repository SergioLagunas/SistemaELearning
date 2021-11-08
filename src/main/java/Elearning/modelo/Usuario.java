package Elearning.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

//Mapero ORM
@Entity
@Table(name = "Usuario")
public class Usuario implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idUsuario")
    private Integer idUsuario;

    @Column(name = "nombre")
    private String nombre;

    @Column(name = "aPaterno")
    private String aPaterno;

    @Column(name = "aMaterno")
    private String aMaterno;

    @Column(name = "genero")
    private String genero;

    @Column(name = "email")
    private String email;

    @Column(name = "contrasena")
    private String contrasena;

    @Column(name = "tUsuario")
    private String tUsuario;

    @Column(name = "rfc")
    private String rfc;

    //Relacion MUCHOS A MUCHOS con Curso
    @ManyToMany(cascade = {CascadeType.PERSIST,CascadeType.MERGE,CascadeType.DETACH,CascadeType.REFRESH},fetch = FetchType.EAGER)
    @JoinTable(name = "MiCurso",joinColumns = {@JoinColumn(name = "idUsuario")},inverseJoinColumns = {@JoinColumn(name = "idCurso")})
    private Set<Curso> cursos= new HashSet<>();

    //Relacion UNO A MUCHOS con MiCuestionario --> "MUCHOS A MUCHOS"
    @OneToMany(mappedBy = "usuario",fetch=FetchType.LAZY,cascade = CascadeType.PERSIST)
    private List<MiCuestionario> miCuestionario;
    
     //Relación MUCHOS a UNO con idArchivoUsuario
//    @ManyToOne(fetch = FetchType.LAZY,cascade = {CascadeType.ALL,CascadeType.MERGE,CascadeType.DETACH,CascadeType.REFRESH})
//    @JoinColumn(name="idArchivoUsuario")
//    private ArchivoUsuario idArchivoUsuario;
    
//    Relacion UNO A MUCHOS con idArchivoUsuario
    @OneToMany(mappedBy = "idUsuario", fetch = FetchType.LAZY, cascade = {CascadeType.ALL, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    private List<ArchivoUsuario> idArchivoUsuario;
    
    //Relacion MUCHOS A MUCHOS con Cuestionario
//    @ManyToMany(cascade = {CascadeType.PERSIST,CascadeType.MERGE,CascadeType.DETACH,CascadeType.REFRESH},fetch = FetchType.EAGER)
//    @JoinTable(name = "MiCuestionario",joinColumns = {@JoinColumn(name = "idUsuario")},inverseJoinColumns = {@JoinColumn(name = "idCuestionario")})
//    private Set<Cuestionario> cuestionarios = new HashSet<>();
    
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

    public Set<Curso> getCursos() {
        return cursos;
    }

    public void setCursos(Set<Curso> cursos) {
        this.cursos = cursos;
    }
    
    public List<MiCuestionario> getMiCuestionario() {
        return miCuestionario;
    }

    public void setMiCuestionario(List<MiCuestionario> miCuestionario) {
        this.miCuestionario = miCuestionario;
    }

    public List<ArchivoUsuario> getIdArchivoUsuario () {
        return idArchivoUsuario;
    }
    
    public void setIdArchivoUsuario (List <ArchivoUsuario> idArchivoUsuario) {
        this.idArchivoUsuario = idArchivoUsuario;
    }

    public void addMiCuestionario(MiCuestionario miCuestionario){   
        if(this.miCuestionario != null){
            this.miCuestionario = new ArrayList<>();
            this.miCuestionario.add(miCuestionario);
            miCuestionario.setUsuario(this);
        }    
    }
    
    @Override
    public String toString() {
        return "Usuario{" + "idUsuario=" + idUsuario + ", nombre=" + nombre + ", aPaterno=" + aPaterno + ", aMaterno=" + aMaterno + ", genero=" + genero + ", email=" + email + ", contrasena=" + contrasena + ", tUsuario=" + tUsuario + ", rfc=" + rfc + '}';
    }

}
