// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery


function displayPrice() {
  console.log('hello')
  const selectedWeight = document.querySelector("#selected_weight");
  let sel_weight_val = selectedWeight.value;
  console.log(sel_weight_val);
  const selectedQuantity = document.querySelector("#selected_quantity");
  let sel_quantity_val = selectedQuantity.value;
  console.log(sel_quantity_val);

  const totalPrice = document.querySelector("#display_price");



  if (sel_weight_val == '1000') {

    //convert to float number with . and not with ,
      const maxWeightPrice = parseFloat(document.getElementById("hidden_price_max").textContent.replace(",","."));

      totalPrice.innerHTML = `${maxWeightPrice * sel_quantity_val }€`;
    } else {
      const minWeightPrice = parseFloat(document.getElementById("hidden_price_min").textContent.replace(",","."));

      totalPrice.innerHTML = `${minWeightPrice * sel_quantity_val}€`;
    }

}

displayPrice();



