$(function () {
    $("#FormSeguridad").validate({
        rules: {
            Contrasenna: {
                required: true,
                maxlength: 10
            },
            ContrasennaConfirmar: {
                required: true,
                equalTo: "#Contrasenna",
                maxlength: 10
            }
        },
        messages: {
            Contrasenna: {
                required: "* Requerido",
                maxlength: "* Máximo 10 caracteres"
            },
            ContrasennaConfirmar: {
                required: "* Requerido",
                equalTo: "* La confirmación no coincide",
                maxlength: "* Máximo 10 caracteres"
            }
        }
    });
});