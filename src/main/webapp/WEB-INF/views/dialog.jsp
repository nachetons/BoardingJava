<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
  <link href="<c:url value="/resources/styles/dialogo.css" />" rel="stylesheet">
</head>
<h2>Precios</h2>
<div class="header">
  <p>Los precios de los productos son:</p>
  <button class="addBtn">Añadir</button>
</div>
  <p id="precios"></p>
  <button onclick="closeDialog()">Cerrar</button>