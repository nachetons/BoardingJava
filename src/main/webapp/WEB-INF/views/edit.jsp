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
                            <label for="">Activo</label>
                            <input name="activoInstrumento" value="${item.activo}">
                        </div>
                        <div class="element">
                            <label for="">Ticker Bloomberg</label>
                            <input name="tickerBloombergInstrumento" value="${item.tickerbloomberg}">
                        </div>
                        <div class="element">
                            <label for="">Última Actualización: ${item.lastUpdate}</label>
                        </div>
                        <div class="element">
                            <input type="submit" value="Guardar" onclick="submitForm(event)">
                        </div>
                </form>

            </c:forEach>

            <script>
                var auth = sessionStorage.getItem("auth");
                var dialog = document.getElementById("alertDialog");
                function openDialog() {
                    dialog.classList.remove("close");
                    setTimeout(closeDialog, 1000);

                }

                function closeDialog() {
                    dialog.classList.add("close");
                    window.location.href = "../";

                }
                if (auth === "true") {




                } else {
                    window.location.href = "../";
                }
                function submitForm(event) {
                    event.preventDefault(); // Evitar que se envíe el formulario de forma predeterminada

                    var codigo = document.getElementsByName("codigoInstrumento")[0].value;
                    var nombre = document.getElementsByName("nombreInstrumento")[0].value;
                    var mercado = document.getElementsByName("mercadoInstrumento")[0].value;
                    var descripcion = document.getElementsByName("descripcionInstrumento")[0].value;
                    var activo = document.getElementsByName("activoInstrumento")[0].value;
                    var tickerBloomberg = document.getElementsByName("tickerBloombergInstrumento")[0].value;

                    var data = {
                        "code": codigo,
                        "nombre": nombre,
                        "mercado": mercado,
                        "descripcion": descripcion,
                        "tickerbloomberg": tickerBloomberg,
                        "activo": activo
                    };

                    console.log(data);

                    var id = document.getElementsByName("idInstrumento")[0].value;
                    var url = "/demo-0.0.1-SNAPSHOT/update/" + id + "/";

                    var xhr = new XMLHttpRequest();
                    xhr.open("PUT", url, true);
                    xhr.setRequestHeader('Content-Type', 'application/json');
                    xhr.send(JSON.stringify(data));

                    openDialog(); // Mostrar el diálogo en caso de éxito



                }


            </script>
        </body>

        </html>