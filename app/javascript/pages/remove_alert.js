import swal from 'sweetalert2';

function bindSweetAlertButtonRemove() {
  const swalButton = document.querySelectorAll('.sweet-alert-rm');
  console.log(swalButton);
  swalButton.forEach((b) => {
    if (b) { // protect other pages
      b.addEventListener('click', (e) => {
        e.preventDefault();
        swal({
          title: 'Etes-vous sure?',
          type: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: `Oui, je veux la retirer de l'exposition`
        }).then((result) => {
          if (result.value) {
            document.getElementById(`delete-link-${b.dataset.id}`).click();
            swal(
              'Retiré!',
              'Votre oeuvre a été retiré.',
              'success'
            )
          }
        });
      });
    }
  });
}

        
export { bindSweetAlertButtonRemove };

