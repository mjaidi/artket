import swal from 'sweetalert2';

function bindSweetAlertButtonDelete() {
  const swalButton = document.querySelectorAll('.sweet-alert-d');
  swalButton.forEach((b) => {
    if (b) { // protect other pages
      b.addEventListener('click', (e) => {
        e.preventDefault();
        swal({
          title: 'Etes-vous sure?',
          text: "Vous ne pouvez pas revenir en arrière!",
          type: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Oui, je veux le supprimer'
        }).then((result) => {
          if (result.value) {
            document.getElementById(`delete-link-${b.dataset.id}`).click();
            swal(
              'Supprimé!',
              `L'objet à bien été supprimé.`,
              'success'
            )
          }
        });
      });
    }
  });
}

        
export { bindSweetAlertButtonDelete };

