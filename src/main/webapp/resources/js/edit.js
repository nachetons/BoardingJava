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