var auth = sessionStorage.getItem("auth");
var autenticar = document.getElementById("autenticar");
var dialog = document.getElementById("dialog");

if (auth === "true") {
  autenticar.innerHTML =
    "<p>El usuario está autenticado y tiene el rol admin.</p>";
  function openDialog(id) {
    dialog.classList.remove("close");
    getPriceById(id);
    console.log(id);
  }

  function closeDialog() {
    dialog.classList.add("close");
  }
} else {
  autenticar.innerHTML =
    "<p>El usuario no está autenticado o no tiene el rol admin.</p>";
}

function submitForm(event) {
  event.preventDefault(); // Evitar que se envíe el formulario de forma predeterminada

  var user = document.getElementsByName("checkUser")[0].value;

  var xhr = new XMLHttpRequest();
  xhr.open(
    "GET",
    "/demo-0.0.1-SNAPSHOT/auth?checkUser=" + encodeURIComponent(user),
    true
  );
  xhr.onreadystatechange = function () {
    if (
      xhr.readyState === XMLHttpRequest.DONE &&
      xhr.status === 200
    ) {
      var auth = JSON.parse(xhr.responseText).auth;
      sessionStorage.setItem("auth", auth.toString());
      window.location.reload();
    }
  };
  xhr.send();
}


function getPriceById(id) {
  var xhr = new XMLHttpRequest();
  xhr.open(
    "GET",
    "/demo-0.0.1-SNAPSHOT/getPrices/" + id + "/",
    true
  );
  xhr.onreadystatechange = function () {
    if (
      xhr.readyState === XMLHttpRequest.DONE &&
      xhr.status === 200
    ) {
      var price = JSON.parse(xhr.responseText);
      sessionStorage.setItem("precios", JSON.stringify(price));
      pintarPrecios();

    }
  };
  xhr.send();



}


function pintarPrecios() {
  var precios = sessionStorage.getItem("precios");
  var preciosArray = JSON.parse(precios);

  var table = document.createElement("table");
  table.classList.add("price-table");

  var thead = document.createElement("thead");
  var headerRow = document.createElement("tr");
  var headers = ["ID", "Precio", "Última Actualización"];

  headers.forEach(function (headerText) {
    var th = document.createElement("th");
    th.textContent = headerText;
    headerRow.appendChild(th);
  });

  thead.appendChild(headerRow);
  table.appendChild(thead);

  var tbody = document.createElement("tbody");

  preciosArray.forEach(function (precio) {
    var row = document.createElement("tr");

    var idCell = document.createElement("td");
    idCell.textContent = precio.id;
    row.appendChild(idCell);

    var precioCell = document.createElement("td");
    precioCell.textContent = precio.precio;
    row.appendChild(precioCell);

    var lastUpdateCell = document.createElement("td");
    lastUpdateCell.textContent = precio.lastUpdate;
    row.appendChild(lastUpdateCell);

    tbody.appendChild(row);
  });

  table.appendChild(tbody);

  var preciosContainer = document.getElementById("precios");
  preciosContainer.innerHTML = "";
  preciosContainer.appendChild(table);
}

document.addEventListener("DOMContentLoaded", function () {
  // Obtener el valor de auth del sessionStorage
  var auth = sessionStorage.getItem("auth");
  var filas = document.querySelectorAll(".instrumento");

  // Obtener todos los botones de la página
  var buttons = document.getElementsByTagName("button");
  var links = document.getElementsByTagName("a");

  // Verificar el valor de auth y habilitar o deshabilitar los botones en consecuencia
  for (var i = 0; i < buttons.length; i++) {
    if (auth === "true") {
      buttons[i].removeAttribute("disabled");
    } else {
      buttons[i].setAttribute("disabled", "disabled");
    }
  }

  // Verificar el valor de auth y habilitar o deshabilitar los enlaces en consecuencia
  for (var i = 0; i < links.length; i++) {
    if (auth === "true") {
      links[i].classList.remove("disabled-link");
    } else {
      links[i].classList.add("disabled-link");
    }
  }
});
