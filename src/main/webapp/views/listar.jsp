<%@ page import="model.dao.UsuarioDAO" %>
<%@page import="model.dto.Usuario" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ZEKZION
  Date: 27/05/2024
  Time: 00:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- Importar Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>S-DISTR-CRUD</title>


    <%--    segunda opcion --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tom-select@2.0.1/dist/css/tom-select.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.min.css">


    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.7/css/dataTables.bootstrap5.css">
    <link href="https://cdn.datatables.net/v/bs5/dt-2.0.7/b-3.0.2/b-html5-3.0.2/r-3.0.2/sc-2.4.2/datatables.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/3.0.2/css/responsive.bootstrap5.min.css">

    <!-- botones  -->
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/3.0.2/css/buttons.dataTables.css">

</head>

<body style="font-family: Poppins, sans-serif;">
<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvas-1">
    <div class="offcanvas-header"><a class="navbar-brand d-flex align-items-center fw-bold" href="#"><span
            class="bs-icon-sm bs-icon-rounded bs-icon-primary d-flex justify-content-center align-items-center me-2 bs-icon"><svg
            xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16"
            class="bi bi-clipboard-minus-fill">
                        <path d="M6.5 0A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0zm3 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5z"></path>
                        <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1A2.5 2.5 0 0 1 9.5 5h-3A2.5 2.5 0 0 1 4 2.5zM6 9h4a.5.5 0 0 1 0 1H6a.5.5 0 0 1 0-1"></path>
                    </svg></span><span style="font-family: Poppins, sans-serif;">Admin</span></a>
        <button class="btn-close" type="button" aria-label="Close" data-bs-dismiss="offcanvas"></button>
    </div>
    <div class="offcanvas-body" style="font-family: Poppins, sans-serif;">
        <ul class="nav nav-pills flex-column nav-fill bg-light" id="opcion">
            <li class="nav-item m-1"><a class="nav-link  text-start" href="index.jsp"><i
                    class="far fa-list-alt mx-1"></i><span>Inicio</span></a></li>
            <li class="nav-item m-1"><a class="nav-link text-start"
                                        href="${pageContext.request.contextPath}/UsuarioServlet?accion=buscar"><i
                    class="far fa-user-circle mx-1"></i><span>Buscar Usuario</span></a></li>
            <li class="nav-item m-1">
                <a class="nav-link text-start active" href="#">
                    <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24" fill="none"
                         class="mx-1">
                        <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M12 0C5.37258 0 0 5.37258 0 12C0 18.6274 5.37258 24 12 24C18.6274 24 24 18.6274 24 12C24 5.37258 18.6274 0 12 0ZM4.14355 13.5165C4.85219 17.2096 8.10023 20 12 20C16.4183 20 20 16.4183 20 12C20 7.58172 16.4183 4 12 4C8.0886 4 4.83283 6.80704 4.13728 10.5165L6.72824 10.5071C7.37819 8.20738 9.49236 6.52222 12.0001 6.52222C15.0254 6.52222 17.4779 8.9747 17.4779 12C17.4779 15.0253 15.0254 17.4778 12.0001 17.4778C9.49752 17.4778 7.3869 15.7995 6.73228 13.5071L4.14355 13.5165ZM9.52234 12C9.52234 13.3684 10.6317 14.4778 12.0001 14.4778C13.3685 14.4778 14.4779 13.3684 14.4779 12C14.4779 10.6316 13.3685 9.52222 12.0001 9.52222C10.6317 9.52222 9.52234 10.6316 9.52234 12Z"
                              fill="currentColor"></path>
                    </svg>
                    <span>Lista de Usuarios</span></a>
            </li>

        </ul>
    </div>
</div>
<div class="container-fluid sticky-top">
    <nav class="navbar navbar-expand bg-white shadow mb-4">
        <div class="container-fluid"><a class="btn btn-link" role="button" id="sidebarToggleTop"
                                        data-bs-target="#offcanvas-1" data-bs-toggle="offcanvas"><i
                class="fas fa-bars"></i></a><a
                class="navbar-brand w-100 d-flex align-items-center justify-content-center"
                href="${pageContext.request.contextPath}/index.jsp"><span
                class="bs-icon-sm bs-icon-rounded bs-icon-primary d-flex justify-content-center align-items-center me-2 bs-icon"><svg
                xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16"
                class="bi bi-clipboard-minus-fill">
                            <path d="M6.5 0A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0zm3 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5z"></path>
                            <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1A2.5 2.5 0 0 1 9.5 5h-3A2.5 2.5 0 0 1 4 2.5zM6 9h4a.5.5 0 0 1 0 1H6a.5.5 0 0 1 0-1"></path>
                        </svg></span><span class="text-muted fw-bold"
                                           style="font-family: Poppins, sans-serif;">Admin</span></a></div>
    </nav>
</div>
<div class="container">
    <div class="row">
        <div class="col">
            <h2 class="text-center mt-4 mb-4 fw-bold">Lista de usuarios</h2>
            <div class="my-3 text-end">


                <a class="btn btn-primary" role="button" data-bs-target="#modal-nuevo-usuario" data-bs-toggle="modal">
                    <i class="fa fa-user-plus fs-5"></i>&nbsp;Nuevo Usuario</a>
            </div>
            <div class="card shadow">
                <div class="card-header py-3">
                    <p class="text-primary m-0 fw-bold">Información de usuarios</p>
                </div>
                <div class="card-body">

                        <%--     tabla de usuarios  --%>

                        <table class="table table-striped display table-responsive" id="tablausuario" >
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombres</th>
                                <th>Apellidos</th>
                                <th>email</th>
                                <th>Acciones</th>
                            </tr>
                            </thead>

                            <tbody>
                            <%--   generar registros de la base de datos    --%>
                            <%
                                UsuarioDAO usuarioDAO = new UsuarioDAO();
                                ArrayList<Usuario> usuarios = usuarioDAO.getUsuarios();

                                Usuario usuario = null;

                                for (int i = 0; i < usuarios.size(); i++) {
                                    usuario = usuarios.get(i);
                            %>
                            <tr>
                                <td><%= usuario.getId()  %>
                                </td>
                                <td><%= usuario.getNombre()  %>
                                </td>
                                <td><%= usuario.getApellido()  %>
                                </td>
                                <td><%= usuario.getEmail()  %>
                                </td>
                                <td>
                                    <a class="btn btn-warning"
                                       href="UsuarioServlet?accion=editar&idusuario=<%=usuario.getId()%>">Editar</a>
                                    <a class="btn btn-danger"
                                       onclick="confirmarEliminar('UsuarioServlet?accion=eliminar&idusuario=<%=usuario.getId()%>', '<%=usuario.getId()%>')">Eliminar</a>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>

                </div>
            </div>
            <div class="modal fade" role="dialog" tabindex="-1" id="modal-nuevo-usuario">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title w-100 text-center">Información de Usuario</h4>
                            <button class="btn-close" type="button" aria-label="Close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <form class="row g-3" action="UsuarioServlet">
                                <div class="form-group">
                                    <label class="form-label" for="idusuario">ID Usuario</label>
                                    <input class="form-control" type="text" id="idusuario" name="idusuario">
                                </div>
                                <div class="form-group">
                                    <label class="form-label" for="nombres">Nombres</label>
                                    <input class="form-control" type="text" id="nombres" name="nombres">
                                </div>
                                <div class="form-group">
                                    <label class="form-label" for="apellidos">Apellidos</label>
                                    <input class="form-control" type="text" id="apellidos" name="apellidos">
                                </div>
                                <div class="form-group">
                                    <label class="form-label" for="email">Email</label>
                                    <input class="form-control" type="text" id="email" name="email">
                                </div>
                                <div class="text-end">
                                    <input class="btn btn-primary" type="submit" name="accion" value="Agregar">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <!-- Modal de confirmación de eliminación -->
            <div class="modal fade" id="confirmarEliminacion" tabindex="-1" role="dialog"
                 aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="confirmDeleteModalLabel">Confirmar Eliminación</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                        </div>
                        <div class="modal-body">
                            ¿Estas seguro que quieres eliminar a este usuario?
                            <p id="usuarioid"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>

                            <a id="confirmarEliminar" href="#" class="btn btn-danger">Eliminar</a>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                // Función para abrir el modal de confirmación de eliminación
                function confirmarEliminar(url, id) {
                    let confirmarEliminarbtn = document.getElementById("confirmarEliminar");
                    confirmarEliminarbtn.href = url;

                    $('#usuarioid').text('ID de usuario: ' + id);
                    $('#confirmarEliminacion').modal('show');
                }
            </script>

        </div>
    </div>
</div>
<a class="border rounded d-flex justify-content-center align-items-center m-2 text-decoration-none" id="page-top-go"
   href="#page-top"><i class="fas fa-angle-up"></i></a>

<!-- Importar Scripts JS Bootstrap 5 -->
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.min.js"></script>

<!-------------------------------------- Importar Scripts JS obligatorios ------------------------------------>

<!-- Importar Scripts JS Bootstrap 5 -->
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<!-- JQuery -->
<script defer src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- Script DataTable -->
<script defer src="https://cdn.datatables.net/2.0.7/js/dataTables.js"></script>

<!-- Script DataTable Bootstrap 5 -->
<script defer src="https://cdn.datatables.net/2.0.7/js/dataTables.bootstrap5.js"></script>


<!-- js para hacer las tablas responsive -->
<script defer src="https://cdn.datatables.net/responsive/3.0.2/js/dataTables.responsive.min.js"></script>
<script defer src="https://cdn.datatables.net/responsive/3.0.2/js/responsive.bootstrap5.min.js"></script>

<!-- botones para exportar pdf, excel o visibilidad de columnas de la tabla -->
<script defer src="https://cdn.datatables.net/buttons/3.0.2/js/dataTables.buttons.js"></script>
<script defer src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.dataTables.js"></script>
<script defer src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.colVis.min.js"></script>

<!-- Importar Scripts JS para generar el  DataTable-->
<script defer src="../assets/js/datatableusuario.js"></script>
<script defer src="assets/js/datatableusuario.js"></script>

</body>

</html>