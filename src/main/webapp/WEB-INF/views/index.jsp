<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="es">

        <head>

            <style>
                table {
                    border-collapse: collapse;
                    width: 100%;
                }

                th,
                td {
                    padding: 8px;
                    text-align: center;
                    border-bottom: 1px solid #ddd;
                }

                th {
                    background-color: #f2f2f2;
                }

                tr:hover {
                    background-color: #f5f5f5;
                    cursor: pointer;
                }

                h1 {
                    color: #333;
                    text-align: center;
                }

                .userContent {
                    display: flex;
                    justify-content: right;
                    align-items: center;
                    margin-bottom: 2%;
                    margin-right: 1.4%;
                }

                .headerContent {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    padding: 0 20px;
                    margin-bottom: 2%;
                }

                a {
                    list-style: none;
                    text-decoration: none;
                    color: #333;
                }
            </style>


        </head>

        <body>
            <h1>Instrumentos</h1>

            <div class="userContent">
                    <input type="text" placeholder="nombre usuario" name="checkUser">
                    <input type="submit" value="Enviar" onclick="submitForm(event)">

            </div>


            <div class="headerContent">
                <button><a href="new">Nuevo</a></button>
                <br>
                <div class="filterContent">
                    <form action="#" method="GET">
                        <input type="text" name="search" placeholder="Buscar">
                        <input type="submit" value="Buscar">
                    </form>

                </div>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Mercado</th>
                        <th>Descripción</th>
                        <th>Ticker Bloomberg</th>
                        <th>Activo</th>
                        <th>Última Actualización</th>
                        <th></th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="item">
                        <tr>
                            <td>${item.nombre}</td>
                            <td>${item.mercado}</td>
                            <td>${item.descripccion}</td>
                            <td>${item.activo}</td>
                            <td>${item.tickerbloomberg}</td>
                            <td>${item.lastUpdate}</td>
                            <td>
                                <a href="edit/${item.id}">Editar</a>
                                <a href="delete/${item.id}">Eliminar</a>
                            </td>

                        </tr>
                    </c:forEach>
                    <c:if test="${sessionScope.auth}">
                        <p>El usuario está autenticado y tiene rol admin.</p>
                    </c:if>
                    <c:if test="${not sessionScope.auth}">
                        <p>El usuario no está autenticado o no tiene el rol admin.</p>
                    </c:if>


                    <script>

                        function onClick() {
                            var auth = "${auth}";
                            if (auth) {
                                sessionStorage.setItem("auth", "true");
                            } else {
                                sessionStorage.setItem("auth", "false");
                            }
                        }

                        function submitForm(event) {
                            event.preventDefault(); // Evitar que se envíe el formulario de forma predeterminada

                            var user = document.getElementsByName("checkUser")[0].value;

                            var baseUrl = window.location.origin;
                            var url = baseUrl + "/demo-0.0.1-SNAPSHOT/auth?checkUser=" + encodeURIComponent(user);
                            window.location.href = url;


                            //var auth = sessionStorage.getItem("auth");
                            // if (auth == "true") {
                            //     alert("El usuario " + user + " está autenticado y tiene rol admin.");
                            // } else {
                            //     alert("El usuario " + user + " no está autenticado o no tiene el rol admin.");
                            // }
                        }


                    </script>


                </tbody>
            </table>
        </body>

        </html>