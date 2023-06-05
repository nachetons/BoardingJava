<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

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

      .disabled-link {
  pointer-events: none;
  color: gray;
  text-decoration: none;
  cursor: default;
}
    </style>
  </head>

  <body>
    <h1>Instrumentos</h1>

    <div class="userContent">
      <input type="text" placeholder="nombre usuario" name="checkUser" />
      <input type="submit" value="Enviar" onclick="submitForm(event)" />
    </div>

    <div class="headerContent">
      <button><a href="new" class="disabled-link">Nuevo</a></button>
      <br />
      <div class="filterContent">
        <form action="#" method="GET">
          <input type="text" name="search" placeholder="Buscar" />
          <input type="submit" value="Buscar" />
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
              <a href="edit/${item.id}" class="disabled-link">Editar</a>
              <a href="delete/${item.id}" class="disabled-link">Eliminar</a>
            </td>
          </tr>
        </c:forEach>
        <p id="autenticar"></p>








        <script>

var auth = sessionStorage.getItem("auth");
var autenticar = document.getElementById("autenticar");

if (auth === "true") {
    autenticar.innerHTML = "<p>El usuario está autenticado y tiene el rol admin.</p>";
} else {
    autenticar.innerHTML = "<p>El usuario no está autenticado o no tiene el rol admin.</p>";
}


          function submitForm(event) {
            event.preventDefault(); // Evitar que se envíe el formulario de forma predeterminada

            var user = document.getElementsByName("checkUser")[0].value;

            var xhr = new XMLHttpRequest();
            xhr.open(
              "GET",
              "/demo-0.0.1-SNAPSHOT/auth?checkUser=" + encodeURIComponent(user),
              true
            );
            xhr.onreadystatechange = function () {
              if (
                xhr.readyState === XMLHttpRequest.DONE &&
                xhr.status === 200
              ) {
                var auth = JSON.parse(xhr.responseText).auth;
                sessionStorage.setItem("auth", auth.toString());
                window.location.reload(); // Recargar la página para mostrar el resultado actualizado
              }
            };
            xhr.send();
          }

          document.addEventListener("DOMContentLoaded", function () {
            // Obtener el valor de auth del sessionStorage
            var auth = sessionStorage.getItem("auth");

            // Obtener todos los botones de la página
            var buttons = document.getElementsByTagName("button");
            var links = document.getElementsByTagName("a");

            // Verificar el valor de auth y habilitar o deshabilitar los botones en consecuencia
            for (var i = 0; i < buttons.length; i++) {
              if (auth === "true") {
                buttons[i].removeAttribute("disabled");
              } else {
                buttons[i].setAttribute("disabled", "disabled");
              }
            }

            // Verificar el valor de auth y habilitar o deshabilitar los enlaces en consecuencia
            for (var i = 0; i < links.length; i++) {
              if (auth === "true") {
                links[i].classList.remove("disabled-link");
              } else {
                links[i].classList.add("disabled-link");
              }
            }
          });
        </script>
      </tbody>
    </table>
  </body>
</html>
