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
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "ArchivoUsuario")
public class ArchivoUsuario implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idArchivoUsuario")
    private Integer idArchivoUsuario;

    @Column(name = "archivoPortafolio")
    private String archivoPortafolio;

    //Relacion UNO A MUCHOS con idArchivoUsuario
    @OneToMany(mappedBy = "idArchivoUsuario", fetch = FetchType.LAZY, cascade = {CascadeType.ALL, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
    private List<Usuario> idUsuario;

    public ArchivoUsuario() {
    }

    public ArchivoUsuario(String archivoPortafolio) {
        this.archivoPortafolio = archivoPortafolio;
    }
    
    

    public Integer getIdArchivoUsuario() {
        return idArchivoUsuario;
    }

    public void setIdArchivoUsuario(Integer idArchivoUsuario) {
        this.idArchivoUsuario = idArchivoUsuario;
    }

    public String getArchivoPortafolio() {
        return archivoPortafolio;
    }

    public void setArchivoPortafolio(String archivoPortafolio) {
        this.archivoPortafolio = archivoPortafolio;
    }

    public List<Usuario> getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(List<Usuario> idUsuario) {
        this.idUsuario = idUsuario;
    }

    public void addUsuario(Usuario usuario) {
        if (idUsuario != null) {
            idUsuario = new ArrayList<>();
            idUsuario.add(usuario);
        }
    }

    @Override
    public String toString() {
        return "ArchivoUsuario{" + "idArchivoUsuario=" + idArchivoUsuario + ", archivoPortafolio=" + archivoPortafolio + '}';
    }
}
