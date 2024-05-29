package controller;

import model.dao.UsuarioDAO;
import model.dto.Usuario;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "UsuarioServlet", value = "/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {

    // bindear las paginas a redireccionar
    String listar = "views/listar.jsp";
    String add = "views/agregar.jsp";
    String editar = "views/editar.jsp";
    String buscar = "views/buscar.jsp";

    // creacion de usuario
    Usuario usuario = new Usuario();

    // creacion de los metodos crud al usuario
    UsuarioDAO usuarioDAO = new UsuarioDAO();

    // establecer id
    String id;

    // constructor
    public UsuarioServlet() throws SQLException, ClassNotFoundException {
    }


    // funcion para leer los datos del usuario
    public void leerDatosUsuario(HttpServletRequest request, HttpServletResponse response) {
        usuario.setId(request.getParameter("idusuario"));
        usuario.setNombre(request.getParameter("nombres"));
        usuario.setApellido(request.getParameter("apellidos"));
        usuario.setEmail(request.getParameter("email"));
    }

    // funcion request
    protected void processRequest(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");


        String acceso = "";
        String action = request.getParameter("accion");

        if (action.equalsIgnoreCase("listar")) {
            acceso = listar;
        } else if (action.equalsIgnoreCase("add")) {
            acceso = add;
        } else if (action.equalsIgnoreCase("agregar")) {
            leerDatosUsuario(request, response);
            usuarioDAO.addUsuario(usuario);
            acceso = listar;
        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idusuario", request.getParameter("id"));
            acceso = editar;
        }else if (action.equalsIgnoreCase("actualizar")) {
            leerDatosUsuario(request, response);
            usuarioDAO.updateUsuario(usuario);
            acceso = listar;
        } else if (action.equalsIgnoreCase("eliminar")) {
            id = request.getParameter("idusuario");
            usuarioDAO.deleteUsuario(id);
            acceso = listar;
        }else if (action.equalsIgnoreCase("buscar")) {
            String id = request.getParameter("idusuario");
            try {
                usuario = usuarioDAO.getUsuario(id);
                request.setAttribute("usuario", usuario);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            acceso = buscar;
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}