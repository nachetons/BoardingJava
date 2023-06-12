<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>

<style>
    .dialog-overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        z-index: 100;
        display: flex;
        align-items: center;
        justify-content: center;
        opacity: 1; /* Inicialmente oculto */
        pointer-events: none; /* No permite interactuar con los elementos debajo */
        transition: opacity 0.3s ease; /* Transición suave */
    }

    .dialog-content {
        background-color: #ffffff;
        padding: 20px;
        text-align: center;
    }

    .title {
        color: #4CAF50;
        margin: 0;
    }

    .description {
        font-size: 18px;
    }

    .btn {
        text-decoration: none;
        color: #008CBA;
    }

    .btn:hover {
        text-decoration: underline;
    }
    a{
        z-index: 1000;
        position: relative;
    }
</style>

<div class="dialog-overlay">
    <div class="dialog-content">
        <h1 class="title">Success</h1>
        <p class="description">Instrumento editado con éxito</p>
        <a href="../" class="btn">Volver al listado</a>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
    var link = document.querySelector(".btn");
    link.addEventListener("click", function(event) {
        event.preventDefault(); // Evitar el comportamiento predeterminado del enlace
        window.location.href = link.getAttribute("href"); // Redireccionar al enlace href
    });
});
</script>





