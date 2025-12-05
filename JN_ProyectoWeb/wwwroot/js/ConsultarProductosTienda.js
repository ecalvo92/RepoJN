$(function () {

  var modal = document.getElementById('ratingModal');

  modal.addEventListener('show.bs.modal', function (event) {
    var trigger = event.relatedTarget;
    var id = trigger.getAttribute('data-id');
    document.getElementById('ConsecutivoProducto').value = id;
  });

  const stars = Array.from(document.querySelectorAll('#stars .star'));
  const ratingValue = document.getElementById('ratingValue');
  const ratingText = document.getElementById('ratingText');
  let current = 0; // calificación actual
  function render(n, hover = false) {
    stars.forEach((s, i) => {
      const idx = i + 1;
      s.classList.remove('selected', 'hovered');
      if (hover) {
        if (idx <= n) s.classList.add('hovered');
      } else {
        if (idx <= n) s.classList.add('selected');
      }
    });
    ratingValue.value = n > 0 ? String(n) : '';
  }

  // click -> fija calificación
  stars.forEach((s, i) => {
    const val = i + 1;
    s.addEventListener('click', () => {
      current = val;
      render(current, false);
    });

    // hover preview
    s.addEventListener('mouseenter', () => render(val, true));
    s.addEventListener('mouseleave', () => render(current, false));

    // accesible con teclado: Enter/Espacio fijan, ArrowLeft/Right navegan
    s.addEventListener('keydown', (e) => {
      if (e.key === 'Enter' || e.key === ' ') {
        e.preventDefault();
        current = val;
        render(current, false);
      } else if (e.key === 'ArrowRight') {
        e.preventDefault();
        const next = Math.min(3, i + 2);
        stars[next - 1].focus();
      } else if (e.key === 'ArrowLeft') {
        e.preventDefault();
        const prev = Math.max(1, i);
        stars[prev - 1].focus();
      }
    });
  });

  // cuando sales del contenedor, volver al estado actual
  const starsContainer = document.getElementById('stars');
  starsContainer.addEventListener('mouseleave', () => render(current, false));

  // procesar
  document.getElementById('sendRating').addEventListener('click', () => {

    if (!ratingValue.value) {
      ratingText.textContent = 'Por favor seleccione 1, 2 o 3 estrellas';
      ratingText.classList.add('text-danger');
      setTimeout(() => {
        ratingText.classList.remove('text-danger');
        render(current, false);
      }, 1200);
      return;
    }

    //Mandar la información al controlador
    let resenna = document.getElementById('txtResenna');
    let consecutivoProducto = document.getElementById('ConsecutivoProducto')

    $.ajax({
      url: "/Producto/Calificar",
      type: "POST",
      data: {
        ratingValue: ratingValue.value,
        resenna: resenna.value,
        consecutivoProducto: consecutivoProducto.value
      },
      success: function (r) {
        // cerrar modal
        const modalEl = document.getElementById('ratingModal');
        const bsModal = bootstrap.Modal.getInstance(modalEl) || new bootstrap.Modal(modalEl);
        bsModal.hide();
      }
    });

  });

  // limpiar al abrir (si prefieres mantener la selección, quita este listener)
  const ratingModalEl = document.getElementById('ratingModal');
  ratingModalEl.addEventListener('show.bs.modal', () => {
    current = 0;
    render(0, false);
    document.getElementById('txtResenna').value = "";
  });


});