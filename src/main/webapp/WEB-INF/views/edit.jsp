<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <style>
           
                body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            margin-top: 30px;
        }

        form {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            background-color: #f5f5f5;
        }

        .element {
            margin-bottom: 15px;
        }

        .element label {
            display: block;
            margin-bottom: 5px;
        }

        .element input {
            width: 100%;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .element input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            cursor: pointer;
        }

        .element input[type="submit"]:hover {
            background-color: #45a049;
        }

        #dialog.close {
                  opacity: 0;
                }
            </style>
        </head>

        <body>
            <c:forEach items="${list}" var="item">
                <h1>Editar Instrumento </h1>
                <div id="dialog" class="close">
                    <jsp:include page="message.jsp" />
                  </div>
                <form>

                    <div class="content">
                        <div class="element">
                            <label for="">Id</label>
                            <input name="idInstrumento" value="${item.id}"disabled>
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
                var dialog = document.getElementById("dialog");
                function openDialog() {
                  dialog.classList.remove("close");
                }

                function closeDialog() {
                  dialog.classList.add("close");
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

                    xhr.onreadystatechange = function () {

                        if (xhr.readyState == 4 && xhr.status == 200) {
                            var json = JSON.parse(xhr.responseText);
                            console.log(json);
                            if (json.status === "OK") {
                            openDialog()
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