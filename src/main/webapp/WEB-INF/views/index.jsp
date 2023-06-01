<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
  <head>

    <title>Esto es una prueba</title>
  </head>
  <body>
    <h1>Esto es una prueba y estás pasando el id 1</h1>
    <table>
      <thead>
        <tr>
          <th>Nombre</th>
          <th>Mercado</th>
          <th>Descripción</th>
          <th>Ticker Bloomberg</th>
          <th>Activo</th>
          <th>Última Actualización</th>
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
          </tr>
        </c:forEach>



      </tbody>
    </table>
  </body>
</html>