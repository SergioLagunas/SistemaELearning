package Elarning.dao;

import Elearning.dto.Usuario;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class UsuarioDao {

    JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    public int save(Usuario p) {
        String sql = "insert into Usuario(nombre,aPaterno,aMaterno,genero,email,contrasena,tUsuario,rfc) values('"
                + p.getNombre() + "'," + p.getaPaterno() + ",'" + p.getaMaterno() + ",'" + p.getGenero() + ",'" + p.getEmail()
                + ",'" + p.getContrasena() + ",'" + p.gettUsuario() + ",'" + p.getRfc() + "')";

        return template.update(sql);
    }

    public int update(Usuario p) {
        String sql = "update Usuario set nombre='" + p.getNombre() + "',aPaterno=" + p.getaPaterno()
                + ",aMaterno='" + p.getaMaterno() + ",genero='" + p.getGenero() + ",email='" + p.getEmail()
                + ",contrasena='" + p.getContrasena() + ",tUsuario='" + p.gettUsuario() + ",rfc='" + p.getRfc()
                + "' where idUsuario=" + p.getIdUsuario() + "";
        return template.update(sql);
    }

    public int delete(int idUsuario) {
        String sql = "delete from Usuario where idUsuario=" + idUsuario + "";
        return template.update(sql);
    }

    public Usuario getUsuarioById(int idUsuario) {
        String sql = "select * from Usuario where idUsuario=?";
        return template.queryForObject(sql, new Object[]{idUsuario}, new BeanPropertyRowMapper<Usuario>(Usuario.class));
    }
    
    public List<Usuario> getEmployees(){    
    return template.query("select * from Usuario",new RowMapper<Usuario>(){    
        public Usuario mapRow(ResultSet rs, int row) throws SQLException {    
            Usuario e=new Usuario();    
            e.setIdUsuario(rs.getInt(1));    
            e.setNombre(rs.getString(2));
            e.setaPaterno(rs.getString(3));
            e.setaMaterno(rs.getString(4));
            e.setGenero(rs.getString(5));
            e.setEmail(rs.getString(6));
            e.setContrasena(rs.getString(7));
            e.settUsuario(rs.getString(8));
            e.setRfc(rs.getString(9));
             
            return e;    
        }    
    });    
}    
    

}
