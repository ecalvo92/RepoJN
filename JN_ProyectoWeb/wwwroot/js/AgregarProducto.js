$(function () {
    $("#FormAgregarProducto").validate({
        rules: {
            Nombre: {
                required: true
            },
            Descripcion: {
                required: true
            },
            Precio: {
                required: true,
                number: true,
                min: 0.01
            },
            Imagen: {
                required: true,
                extension: "png",
                filesize: 2 * 1024 * 1024
            },
        },
        messages: {
            Nombre: {
                required: "* Requerido"
            },
            Descripcion: {
                required: "* Requerido"
            },
            Precio: {
                required: "* Requerido",
                number: "* Solo números",
                min: "* Debe ser un valor positivo"
            },
            Imagen: {
                required: "* Requerido",
                extension: "* Solo se permiten archivos PNG",
                filesize: "* El archivo no debe superar los 2 MB"
            }
        }
    });

    $.validator.addMethod("filesize", function (value, element, param) {
        if (element.files.length === 0) {
            return true;
        }
        return element.files[0].size <= param;
    }, "El archivo es demasiado grande");

    $.validator.addMethod("extension", function (value, element, param) {
        if (value === "") return true;
        var allowedExtensions = param.split('|');
        var extension = value.split('.').pop().toLowerCase();
        return allowedExtensions.includes(extension);
    }, "Extensión de archivo no permitida");

});