<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <link href="<c:url value="/resources/styles/edit.css" />" rel="stylesheet">
          </head>

        <body>
            <c:forEach items="${list}" var="item">
                <h1>Editar Instrumento </h1>
                <div id="alertDialog" class="close">
                    <jsp:include page="message.jsp" />
                </div>
                <form>

                    <div class="content">
                        <div class="element">
                            <label for="">Id</label>
                            <input name="idInstrumento" value="${item.id}" disabled>
                        </div>
                        <div class="element">
                            <label for="">Codigo</label>
                            <input name="codigoInstrumento" value="${item.code}">
                        </div>
                        <div class="element">
                            <label for="">Nombre</label>
                            <input name="nombreInstrumento" value="${item.nombre}">
                        </div>
                        <div class="element">
                            <label for="">Mercado</label>
                            <input name="mercadoInstrumento" value="${item.mercado}">
                        </div>
                        <div class="element">

                            <label for="">Descripccion</label>
                            <input name="descripcionInstrumento" value="${item.descripcion}">
                        </div>
                        
                        <div class="element">
                            <label for="">Ticker Bloomberg</label>
                            <input name="tickerBloombergInstrumento" value="${item.tickerbloomberg}">
                        </div>
                        <div class="element">
                            <!-- <label for="">Activo</label>
                            <input name="activoInstrumento" value="${item.activo}"> -->
                            <label for="">Activo</label>
                            <select name="activoInstrumento">
                                <option value="1" ${item.activo == 1 ? 'selected' : ''}>Activo</option>
                                <option value="0" ${item.activo == 0 ? 'selected' : ''}>Inactivo</option>
                            </select>
                        </div>
                        <div class="element">
                            <label for="">Última Actualización: ${item.lastUpdate}</label>
                        </div>
                        <div class="element">
                            <input type="submit" value="Guardar" onclick="submitForm(event)">
                        </div>
                </form>

            </c:forEach>

            <script src="<c:url value='/resources/js/edit.js' />"></script>

        </body>

        </html>