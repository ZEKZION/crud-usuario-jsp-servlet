<%@ page import="model.dto.Usuario" %><%--
  Created by IntelliJ IDEA.
  User: ZEKZION
  Date: 27/05/2024
  Time: 00:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>S-DISTR-CRUD</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tom-select@2.0.1/dist/css/tom-select.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.min.css">
</head>

<body>
<div class="container-fluid sticky-top">
    <nav class="navbar navbar-expand bg-white shadow mb-4">
        <div class="container-fluid"><a class="btn btn-link" role="button" id="sidebarToggleTop" data-bs-target="#offcanvas-1" data-bs-toggle="offcanvas"><i class="fas fa-bars"></i></a><a class="navbar-brand w-100 d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/index.jsp"><span class="bs-icon-sm bs-icon-rounded bs-icon-primary d-flex justify-content-center align-items-center me-2 bs-icon"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-clipboard-minus-fill">
                            <path d="M6.5 0A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0zm3 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5z"></path>
                            <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1A2.5 2.5 0 0 1 9.5 5h-3A2.5 2.5 0 0 1 4 2.5zM6 9h4a.5.5 0 0 1 0 1H6a.5.5 0 0 1 0-1"></path>
                        </svg></span><span class="text-muted fw-bold" style="font-family: Poppins, sans-serif;">Admin</span></a></div>
    </nav>
</div>
<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvas-1">
    <div class="offcanvas-header"><a class="navbar-brand d-flex align-items-center fw-bold" href="#"><span class="bs-icon-sm bs-icon-rounded bs-icon-primary d-flex justify-content-center align-items-center me-2 bs-icon"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-clipboard-minus-fill">
                        <path d="M6.5 0A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0zm3 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5z"></path>
                        <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1A2.5 2.5 0 0 1 9.5 5h-3A2.5 2.5 0 0 1 4 2.5zM6 9h4a.5.5 0 0 1 0 1H6a.5.5 0 0 1 0-1"></path>
                    </svg></span><span style="font-family: Poppins, sans-serif;">Admin</span></a><button class="btn-close" type="button" aria-label="Close" data-bs-dismiss="offcanvas"></button></div>
    <div class="offcanvas-body" style="font-family: Poppins, sans-serif;">
        <ul class="nav nav-pills flex-column nav-fill bg-light" id="opcion">
            <li class="nav-item m-1"><a class="nav-link text-start" href="${pageContext.request.contextPath}/index.jsp"><i class="far fa-list-alt mx-1"></i><span>Inicio</span></a></li>
            <li class="nav-item m-1"><a class="nav-link active text-start" href="#"><i class="far fa-user-circle mx-1"></i><span>Buscar Usuario</span></a></li>
            <li class="nav-item m-1">
                <a class="nav-link text-start" href="${pageContext.request.contextPath}/UsuarioServlet?accion=listar">
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
<div class="container">
    <div class="row">
        <div class="col-md-10 col-lg-5 mx-auto">
            <h2 class="text-center mt-4 mb-4 fw-bold" style="font-family: Poppins, sans-serif;">Buscar Usuario</h2>
            <div class="card shadow">
                <div class="card-body">
                    <form class="row g-3 " action="UsuarioServlet">
                        <div class="form-group">
                            <div class="input-group input-group-lg">
                                <span class="input-group-text">ID</span>
                                <input class="form-control" type="text" name="idusuario" required>
                                <input class="btn btn-primary" type="submit"  value="Buscar" name="accion">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-10 col-lg-5 mx-auto">
            <h2 class="text-center mt-4 mb-4 fw-bold" style="font-family: Poppins, sans-serif;">Resultados</h2>
            <%
                Usuario usuario = (Usuario) request.getAttribute("usuario");

                if(usuario!=null){
            %>

                <div id="resultados">
                    <p><span class="fw-bold">ID: </span><%=usuario.getId()%></p>
                    <p><span class="fw-bold">Nombre: </span><%=usuario.getNombre()%></p>
                    <p><span class="fw-bold">Apellido: </span><%=usuario.getApellido()%></p>
                    <p><span class="fw-bold">Email: </span><%=usuario.getEmail()%></p>
                </div>
            <%
                }
            %>
        </div>
    </div>
</div><a class="border rounded d-flex justify-content-center align-items-center m-2 text-decoration-none" id="page-top-go" href="#page-top"><i class="fas fa-angle-up"></i></a>
<footer class="text-center"></footer>
<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.min.js"></script>
</body>

</html>
