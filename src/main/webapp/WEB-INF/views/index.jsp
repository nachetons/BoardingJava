<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Esto es una prueba</title>
  </head>
  <body>
    <h1>Esto es una prueba y estás pasando el id</h1>
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
        <c:forEach var="instrument" items="${list}">
          <tr>
            <td>${instrument.nombre}</td>
            <td>${instrument.mercado}</td>
            <td>${instrument.descripccion}</td>
            <td>${instrument.tickerbloomberg}</td>
            <td>${instrument.activo}</td>
            <td>${instrument.lastUpdate}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </body>
</html>