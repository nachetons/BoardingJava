<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <style>
                .element {
                    margin: 20px;
                }
            </style>
        </head>

        <body>
            <h1>Esto es una prueba y estas pasando el id ${id}</h1>
            <form>

                <c:forEach items="${list}" var="item">
                    <div class="content">

                        <div class="element">
                            <label for="">Nombre</label>
                            <input value="${item.nombre}">
                        </div>
                        <div class="element">
                            <label for="">Mercado</label>
                            <input value="${item.mercado}">
                        </div>
                        <div class="element">

                            <label for="">Descripccion</label>
                            <input value="${item.descripccion}">
                        </div>
                        <div class="element">
                            <label for="">Activo</label>
                            <input value="${item.activo}">
                        </div>
                        <div class="element">
                            <label for="">Ticker Bloomberg</label>
                            <input value="${item.tickerbloomberg}">
                        </div>
                        <div class="element">
                            <label for="">Última Actualización: ${item.lastUpdate}</label>
                        </div>
                </c:forEach>
            </form>

        </body>

        </html>