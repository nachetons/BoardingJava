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
      th, td {
        padding: 8px;
        text-align: center;
        border-bottom: 1px solid #ddd;
      }
      th {
        background-color: #f2f2f2;
      }
      tr:hover {
        background-color: #f5f5f5;
      }
            h1 {
        color: #333;
        text-align: center;
      }
    </style>


    <title>Esto es una prueba</title>
  </head>
  <body>
    <h1>Instrumentos</h1>
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
        ${list}
        <c:forEach items="${list}" var="item">
          <tr>
            <td>${item.nombre}</td>
            <td>${item.mercado}</td>
            <td>${item.descripccion}</td>
            <td>${item.activo}</td>
            <td>${item.tickerbloomberg}</td>
            <td>${item.lastUpdate}</td>
            <td>
              <a href="edit/${item.nombre}">Editar</a>
              <a href="delete/${item.nombre}">Eliminar</a>
            </td>

          </tr>
        </c:forEach>



      </tbody>
    </table>
  </body>
</html>