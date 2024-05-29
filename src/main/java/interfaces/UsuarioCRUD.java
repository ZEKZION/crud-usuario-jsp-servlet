package interfaces;

import model.dto.Usuario;

import java.util.ArrayList;

public interface UsuarioCRUD {
    public ArrayList<Usuario> getUsuarios();
    public Usuario getUsuario(String id);
    public boolean addUsuario(Usuario usuario);
    public boolean updateUsuario(Usuario usuario);
    public boolean deleteUsuario(String id);
}
