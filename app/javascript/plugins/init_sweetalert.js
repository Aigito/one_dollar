// app/javascript/plugins/init_sweetalert.js

import swal from 'sweetalert';

const initSweetalert = (selector, options = {}, callback = () => { }) => {
  const swalButtons = document.querySelectorAll(selector);
  console.log(swalButtons)
  if (swalButtons) { // protect other pages
    swalButtons.forEach((swallButton) => {
      swallButton.addEventListener('click', () => {
        swal(options).then((value) => {
          if (value) {
            if (swallButton.classList.contains('archive-goal-sweet-alert')) {
              const goalId = swallButton.dataset.archiveButton
              const link = document.querySelector(`#archive-goal-${goalId}`);
              link.click();
            } else if (swallButton.classList.contains('unarchive-goal-sweet-alert')) {
              const goalId = swallButton.dataset.unarchiveButton
              const link = document.querySelector(`#unarchive-goal-${goalId}`);
              link.click();
            }
          }
        });
      })
    });
  }
};

export { initSweetalert };
