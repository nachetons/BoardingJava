var auth = sessionStorage.getItem("auth");
var autenticar = document.getElementById("autenticar");
var dialog = document.getElementById("dialog");

dialog.addEventListener('transitionend', () => {
  if (dialog.classList.contains('close')) {
    setTimeout(() => {
      dialog.style.zIndex = '-1';
    }, 300);
  } else {
    dialog.style.zIndex = '1';
  }
});

if (auth === "true") {
  autenticar.innerHTML =
    "<p>El usuario está autenticado y tiene el rol admin.</p>";
  function openDialog(id, activo) {
    if (activo == 1) {
    dialog.classList.remove("close");
    getPriceById(id);
    }
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
  var headers = ["ID", "Precio", "Última Actualización",""];

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
    precioCell.classList.add("editable");
    precioCell.addEventListener("dblclick", enableEditing);
    row.appendChild(precioCell);

    var lastUpdateCell = document.createElement("td");
    lastUpdateCell.textContent = precio.lastUpdate;
    row.appendChild(lastUpdateCell);

    //button modificar
    var buttonCell = document.createElement("td");
    var button = document.createElement("button");
    button.textContent = "Modificar";
    button.classList.add("btn");
    button.classList.add("btn-primary");
    button.classList.add("btn-sm");
    button.classList.add("btn-block");
    button.setAttribute("disabled", "disabled");
    buttonCell.appendChild(button);
    row.appendChild(buttonCell);

    tbody.appendChild(row);
  });

  table.appendChild(tbody);

  var preciosContainer = document.getElementById("precios");
  preciosContainer.innerHTML = "";
  preciosContainer.appendChild(table);
}

function enableEditing(event) {
  var td = event.target;
  td.setAttribute("contenteditable", "true");
  td.classList.remove("disabled-link");
  td.setAttribute("data-original-value", td.textContent.trim());

  var button = td.parentNode.querySelector("button");
  button.removeAttribute("disabled");
}

function handlePriceChange(event) {
  var td = event.target;
  var button = td.parentNode.querySelector("button");
  var originalPrice = td.getAttribute("data-original-value");
  var editedPrice = td.textContent.trim();

  if (editedPrice !== originalPrice) {
    button.removeAttribute("disabled");
    button.addEventListener("click", function () {
      var id = td.parentNode.querySelector("td:first-child").textContent;
      updatePrice(id, editedPrice);
    });  } else {
    button.setAttribute("disabled", "disabled");
    button.removeEventListener("click", updatePrice);

  }
}

function updatePrice(id, price) {
  var url = "/demo-0.0.1-SNAPSHOT/update/precios/" + id;
  var data = {
    precio: price
  };

  var xhr = new XMLHttpRequest();
  xhr.open("PUT", url, true);
  xhr.setRequestHeader('Content-Type', 'application/json');
  xhr.send(JSON.stringify(data));

  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4 && xhr.status === 200) {
      var response = JSON.parse(xhr.responseText);
      if (response.status === "OK") {
        alert("Precio actualizado correctamente");
        // Aquí puedes realizar las acciones adicionales que desees después de actualizar el precio
      } else {
        alert("Error al actualizar el precio");
      }
    }
  };
}
document.addEventListener("DOMContentLoaded", function () {
  pintarPrecios();

  document.addEventListener("input", function (event) {
    if (event.target.classList.contains("editable")) {
      handlePriceChange(event);
    }
  });
});
document.addEventListener("DOMContentLoaded", function () {
  // Obtener el valor de auth del sessionStorage
  var auth = sessionStorage.getItem("auth");
  var filas = document.querySelectorAll(".cell");

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

  for (var i = 0; i < filas.length; i++) {
    if (auth === "true") {
      filas[i].classList.remove("disabled-link");
    } else {
      filas[i].classList.add("disabled-link");
    };
  
}
});
