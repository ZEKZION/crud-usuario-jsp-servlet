<%@ page import="model.dao.UsuarioDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.dto.Usuario" %><%--
  Created by IntelliJ IDEA.
  User: ZEKZION
  Date: 21/05/2024
  Time: 03:03
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

    <!-- Estilo Bootstrap 5 para DataTable -->
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.7/css/dataTables.bootstrap5.css">
    <link href="https://cdn.datatables.net/v/bs5/dt-2.0.7/b-3.0.2/b-html5-3.0.2/r-3.0.2/sc-2.4.2/datatables.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/3.0.2/css/responsive.bootstrap5.min.css">

    <!-- botones  -->
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/3.0.2/css/buttons.dataTables.css">
    <title></title>
</head>
<body>
<div class="container-fluid">
    <h1>Lista de cargos</h1>
    <a class="btn btn-success" href="UsuarioServlet?accion=add">Nuevo Cargo</a>
    <a class="btn btn-success" href="${pageContext.request.contextPath}/index.jsp">Volver a Inicio</a>
    <br>

    <br>
    <div class="card shadow">
        <%--  cabecera de la tarjeta --%>
        <div class="card-header py-3">
            <p class="text-primary m-0 fw-bold">Platos y Bebidas disponibles</p>
        </div>
        <div class="card-body">
            <table class="table table-striped display table-responsive" id="tabla1" width="100%">
                <thead>
                <tr>
                    <th>ID CARGO</th>
                    <th>NOMBRE CARGO</th>
                    <th>SUELDO MIN</th>
                    <th>SUELDO MAX</th>
                    <th>ACCIONES</th>
                </tr>
                </thead>
                <tbody>
                <%
                    UsuarioDAO dao = new UsuarioDAO();
                    ArrayList<Usuario> Lista = dao.getUsuarios();
                    Usuario usuario = null;

                    for (int i = 0; i < Lista.size(); i++) {
                        usuario = Lista.get(i);
                %>


                <tr>
                    <td><%= usuario.getId() %></td>
                    <td><%= usuario.getNombre() %></td>
                    <td><%= usuario.getApellido() %></td>
                    <td><%= usuario.getEmail() %></td>
                    <td>
                        <a class="btn btn-warning" href="UsuarioServlet?accion=editar&idcar=<%=usuario.getId()%>">Editar</a>
                        <a class="btn btn-danger" href="UsuarioServlet?accion=eliminar&idcar=<%=usuario.getId()%>">Eliminar</a>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table></div>
    </div>



</div>

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
</body>
</html>
