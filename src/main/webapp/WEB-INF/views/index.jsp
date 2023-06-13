<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html lang="es">

    <head>
      <link href="<c:url value="/resources/styles/style.css" />" rel="stylesheet">
    </head>

    <body>
      <h1 class="mainTitle">Instrumentos</h1>

      <div id="dialog" class="close">
        <jsp:include page="dialog.jsp" />
      </div>

      <div class="userContent">
        <input type="text" placeholder="codigo usuario" name="checkUser" />
        <input type="submit" value="Enviar" onclick="submitForm(event)" />
      </div>

      <div class="headerContent">
        <button><a href="create" class="disabled-link">Nuevo</a></button>
        <br />
        <div class="filterContent">
          <input type="text" name="search" placeholder="Buscar" />
          <input type="submit" value="Buscar" />
        </div>
      </div>

      <table>
        <thead>
          <tr>
            <th>Código</th>
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
            <tr class="instrumento" id="filas" ondblclick="openDialog('${item.id}','${item.activo}')">
              <td class="cell">${item.code}</td>
              <td class="cell">${item.nombre}</td>
              <td class="cell">${item.mercado}</td>
              <td class="cell">${item.descripcion}</td>
              <td class="cell">${item.tickerbloomberg}</td>
              <td class="cell">${item.activo}</td>
              <td class="cell">${item.lastUpdate}</td>
              <td>
                <a href="edit/${item.id}" class="disabled-link editBtn cell" onclick="event.stopPropagation()">Editar</a>
                <a href="delete/${item.id}" class="disabled-link deleteBtn cell" onclick="event.stopPropagation()">Eliminar</a>
              </td>
            </tr>
          </c:forEach>
          <div class="auth-message">
            <p id="autenticar"></p>
          </div>

          <script src="<c:url value='/resources/js/index.js' />"></script>
        </tbody>
      </table>
    </body>

    </html>