﻿function ConsultarNombre() {

    let identificacion = $("#Identificacion").val();
    $("#Nombre").val("");

    if (identificacion.length >= 9) {

        $.ajax({
            type: 'GET',
            url: 'https://apis.gometa.org/cedulas/' + identificacion,
            dataType: 'json',
            success: function (data) {
                if (data.resultcount > 0) {
                    $("#Nombre").val(data.nombre);
                }
            }
        });

    }
}

$(function () {
    $("#FormPerfil").validate({
        rules: {
            Identificacion: {
                required: true
            },
            Nombre: {
                required: true
            },
            CorreoElectronico: {
                required: true
            },
            NombrePerfil: {
                required: true
            },
        },
        messages: {
            Identificacion: {
                required: "* Requerido"
            },
            Nombre: {
                required: "* Requerido"
            },
            CorreoElectronico: {
                required: "* Requerido"
            },
            NombrePerfil: {
                required: "* Requerido"
            }
        }
    });
});