
package Elearning.dao;

import Elearning.modelo.Modulo;
import Elearning.modelo.Usuario;
import java.util.List;

public interface UsuarioDao {
    public List<Usuario> findAll();
    public Usuario create(final Usuario elUsuario);
    public Usuario getUsuario(final Integer idUsuario);
    public Usuario update(final Usuario elUsuario);
    public boolean delete(final Usuario elUsuario);
    public Usuario loginUsuario(Usuario elUsuario);
    public Usuario getEmail(String email);
    public List<Usuario> findbyAdmin(String tUsuario);
    public List<Usuario> findbySemillero(String tUsuario);
}
