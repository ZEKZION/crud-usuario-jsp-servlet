package model.dao;

import db.Conexion;
import interfaces.UsuarioCRUD;
import model.dto.Usuario;

import javax.swing.*;
import java.sql.SQLException;
import java.util.ArrayList;

public class UsuarioDAO extends Conexion implements UsuarioCRUD {

    Usuario usuario;

    public UsuarioDAO() throws SQLException, ClassNotFoundException {
        super();
    }


    @Override
    public ArrayList<Usuario> getUsuarios() {
        ArrayList<Usuario> listaUsuarios = new ArrayList<>();
        String sql = "select * from usuario";

        try {
            rs = st.executeQuery(sql);
            while (rs.next()) {
                usuario = new Usuario();

                usuario.setId(rs.getString("id"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido(rs.getString("apellido"));
                usuario.setEmail(rs.getString("email"));

                listaUsuarios.add(usuario);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al listar los usuario" + e.getMessage());
        }
        return listaUsuarios;
    }


    @Override
    public Usuario getUsuario(String id) {
        String sql = "select * from usuario where id = ?";

        try {
            ps = getConexion().prepareStatement(sql);
            ps.setString(1, id);

            rs = ps.executeQuery();

            if (rs.next()) {
                usuario = new Usuario();

                usuario.setId(rs.getString("id"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido(rs.getString("apellido"));
                usuario.setEmail(rs.getString("email"));

            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error no se puede recuperar el usuario" + e.getMessage());
        }
        return usuario;
    }


    /**
     * @param usuario
     * @return
     */
    @Override
    public boolean addUsuario(Usuario usuario) {
        String sql = "insert into usuario (id, nombre, apellido, email) values (?, ?, ?, ?);";

        try {
            ps = getConexion().prepareStatement(sql);

            ps.setString(1, usuario.getId());
            ps.setString(2, usuario.getNombre());
            ps.setString(3, usuario.getApellido());
            ps.setString(4, usuario.getEmail());

            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    /**
     * @param usuario
     * @return
     */
    @Override
    public boolean updateUsuario(Usuario usuario) {
        String sql = "update usuario set nombre = ?, apellido = ?, email = ? where id = ?";

        try {
            ps = getConexion().prepareStatement(sql);

            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getApellido());
            ps.setString(3, usuario.getEmail());
            ps.setString(4, usuario.getId());

            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    /**
     * @param id
     * @return
     */
    @Override
    public boolean deleteUsuario(String id) {
        String sql = "delete from usuario where id = ?";

        try {
            ps = getConexion().prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }
}
