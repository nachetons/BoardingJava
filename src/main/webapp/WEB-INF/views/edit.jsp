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
                <c:forEach items="${list}" var="item">
                <form>

                    <div class="content">
                        <div class="element">
                            <label for="">Id</label>
                            <input name="idInstrumento" value="${item.id}">
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
                            <input name="descripcionInstrumento" value="${item.descripccion}">
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

                if (auth === "true") {




                } else {
                    window.location.href = "../";
                }
                function submitForm(event) {
            event.preventDefault(); // Evitar que se envíe el formulario de forma predeterminada

            var nombre = document.getElementsByName("nombreInstrumento")[0].value;
            var mercado = document.getElementsByName("mercadoInstrumento")[0].value;
            var descripcion = document.getElementsByName("descripcionInstrumento")[0].value;
            var activo = document.getElementsByName("activoInstrumento")[0].value;
            var tickerBloomberg = document.getElementsByName("tickerBloombergInstrumento")[0].value;

            var data = {
                "nombre": nombre,
                "mercado": mercado,
                "descripcion": descripcion,
                "activo": activo,
                "tickerBloomberg": tickerBloomberg
            };

            console.log(data);

            var id = document.getElementsByName("idInstrumento")[0].value;
            var url = "/demo-0.0.1-SNAPSHOT/update/" + id + "/";

            var xhr = new XMLHttpRequest();
            xhr.open("PUT", url, true);
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.send(JSON.stringify(data));

            xhr.onreadystatechange = function() {

                if (xhr.readyState == 4 && xhr.status == 200) {
                    var json = JSON.parse(xhr.responseText);
                    console.log(json);
                    if (json.status === "OK") {
                        alert("Instrumento actualizado correctamente");
                        window.location.href = "../";
                    } else {
                        alert("Error al actualizar el instrumento");
                    }


                }
            }
        }


            </script>
        </body>

        </html>