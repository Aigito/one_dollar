// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "chartkick/chart.js";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

// Import Sweet Alert
import { initSweetalert } from '../plugins/init_sweetalert';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();

  initSweetalert('#unarchive-goal-sweet-alert', {
    title: "Unarchive Goal?",
    text: "Are you sure you want to unarchive this goal?",
    icon: "warning"
  }, (value) => {
    if (value) {
      const link = document.querySelector('#unarchive-goal');
      link.click();
    }
  });

  initSweetalert('#archive-goal-sweet-alert', {
    title: "Archive Goal?",
    text: "Are you sure you want to archive this goal?",
    icon: "warning"
  }, (value) => {
    if (value) {
      const link = document.querySelector('#archive-goal');
      link.click();
    }
  });

});
