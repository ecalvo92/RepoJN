$(function () {

    var table = new DataTable('#tabla', {
        language: {
            url: 'https://cdn.datatables.net/plug-ins/2.3.4/i18n/es-ES.json',
        },
    });

    var modal = document.getElementById('staticBackdrop');

    modal.addEventListener('show.bs.modal', function (event) {
      var trigger = event.relatedTarget;

      var id = trigger.getAttribute('data-id');
      var name = trigger.getAttribute('data-name');
      var status = trigger.getAttribute('data-status');

      document.getElementById('ConsecutivoProducto').value = id;

      // Mensaje dinámico
      var msg = (status === "True")
        ? "¿Está seguro que desea INACTIVAR el producto: "
        : "¿Está seguro que desea ACTIVAR el producto: ";

      document.getElementById('modal-message').textContent = msg + name + "?";
    });

});