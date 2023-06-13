<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <link href="<c:url value="/resources/styles/edit.css" />" rel="stylesheet">
          </head>

        <body>
                <h1>Crear Instrumento </h1>
                <div id="alertDialog" class="close">
                    <jsp:include page="message.jsp" />
                </div>
                <form>

                    <div class="content">
                        
                        <div class="element">
                            <label for="">Codigo</label>
                            <input name="codigoInstrumento">
                        </div>
                        <div class="element">
                            <label for="">Nombre</label>
                            <input name="nombreInstrumento">
                        </div>
                        <div class="element">
                            <label for="">Mercado</label>
                            <input name="mercadoInstrumento">
                        </div>
                        <div class="element">

                            <label for="">Descripccion</label>
                            <input name="descripcionInstrumento">
                        </div>
                        <div class="element">
                            <label for="">Ticker Bloomberg</label>
                            <input name="tickerBloombergInstrumento">
                        </div>
                        <div class="element">
                            <input type="submit" value="Guardar" onclick="submitForm(event)">
                        </div>
                        <div class="element">
                            <input type="button" value="Volver" onclick="redirectHome()">
                        </div>
                </form>

            <script>
                var auth = sessionStorage.getItem("auth");
                var dialog = document.getElementById("alertDialog");
                function openDialog() {
                    dialog.classList.remove("close");
                    setTimeout(closeDialog, 1000);

                }

                function closeDialog() {
                    dialog.classList.add("close");
                    window.location.href = "../demo-0.0.1-SNAPSHOT";

                }
                if (auth === "true") {




                } else {
                    window.location.href = "../demo-0.0.1-SNAPSHOT";
                }

                function redirectHome() {
                    window.location.href = "../demo-0.0.1-SNAPSHOT";
                }

                function submitForm(event) {
                    event.preventDefault(); // Evitar que se envíe el formulario de forma predeterminada
                    console.log("submitForm");
                    var codigo = document.getElementsByName("codigoInstrumento")[0].value;
                    var nombre = document.getElementsByName("nombreInstrumento")[0].value;
                    var mercado = document.getElementsByName("mercadoInstrumento")[0].value;
                    var descripcion = document.getElementsByName("descripcionInstrumento")[0].value;
                    var tickerBloomberg = document.getElementsByName("tickerBloombergInstrumento")[0].value;

                    var data = {
                        "code": codigo,
                        "nombre": nombre,
                        "mercado": mercado,
                        "descripcion": descripcion,
                        "tickerbloomberg": tickerBloomberg
                                        };

                    var url = "/demo-0.0.1-SNAPSHOT/save";

                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", url, true);
                    xhr.setRequestHeader('Content-Type', 'application/json');
                    xhr.send(JSON.stringify(data));

                    openDialog(); // Mostrar el diálogo en caso de éxito



                }


            </script>
        </body>

        </html>