<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
  <head>
  <style>
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
      }

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
        justify-content: flex-end;
        align-items: center;
        padding: 10px 20px;
        margin-bottom: 2%;
      }

      .headerContent {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 20px;
        margin-bottom: 2%;
        background-color: #f2f2f2;
      }

      .filterContent input[type="text"],
      .filterContent input[type="submit"] {
        margin-right: 15px;
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

      .auth-message {
        text-align: center;
        margin-bottom: 10px;
      }

        #dialog {
          position: fixed;
          top: 50%;
          left: 50%;
          transform: translate(-50%, -50%);
          width: 600px;
          height: 400px;
          background-color: white;
          padding: 20px;
          border: 1px solid black;
          box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
          opacity: 1;
          transition: opacity 0.3s ease-in-out;
        }

        #dialog.close {
          opacity: 0;
        }
    </style>
  </head>

  <body>
    <h1>Instrumentos</h1>

    <div id="dialog" class="close">
      <jsp:include page="dialog.jsp" />
    </div>

    <div class="userContent">
      <input type="text" placeholder="nombre usuario" name="checkUser" />
      <input type="submit" value="Enviar" onclick="submitForm(event)" />
    </div>

    <div class="headerContent">
      <button><a href="new" class="disabled-link">Nuevo</a></button>
      <br />
      <div class="filterContent">
        <input type="text" name="search" placeholder="Buscar" />
        <input type="submit" value="Buscar" />
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
          <tr class="instrumento" ondblclick="openDialog()">
            <td>${item.nombre}</td>
            <td>${item.mercado}</td>
            <td>${item.descripcion}</td>
            <td>${item.tickerbloomberg}</td>
            <td>${item.activo}</td>
            <td>${item.lastUpdate}</td>
            <td>
              <a href="edit/${item.id}" class="disabled-link" onclick="event.stopPropagation()">Editar</a>
              <a href="delete/${item.id}" class="disabled-link" onclick="event.stopPropagation()">Eliminar</a>
            </td>
          </tr>
        </c:forEach>
        <div class="auth-message">
          <p id="autenticar"></p>
        </div>

        <script>
          var auth = sessionStorage.getItem("auth");
          var autenticar = document.getElementById("autenticar");
          var dialog = document.getElementById("dialog");

          if (auth === "true") {
            autenticar.innerHTML =
              "<p>El usuario está autenticado y tiene el rol admin.</p>";
                function openDialog() {
                  dialog.classList.remove("close");
                }

                function closeDialog() {
                  dialog.classList.add("close");
                }
          } else {
            autenticar.innerHTML =
              "<p>El usuario no está autenticado o no tiene el rol admin.</p>";
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
                window.location.reload();
              }
            };
            xhr.send();
          }

          document.addEventListener("DOMContentLoaded", function () {
            // Obtener el valor de auth del sessionStorage
            var auth = sessionStorage.getItem("auth");
            var filas = document.querySelectorAll(".instrumento");

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
