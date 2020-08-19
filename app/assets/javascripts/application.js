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
  const selected_weight = document.querySelector("#selected_weight");
  sel_weight_val = selected_weight.value;
  console.log(sel_weight_val);
  const totalSelectedPrice = document.querySelector("#display_selected_price");


  if (sel_weight_val == '1000') {

    //convert to float number with . and not with ,
      const maxWeightPrice = parseFloat(document.getElementById("hidden_price_max").textContent.replace(",","."));

      totalSelectedPrice.innerHTML = `${maxWeightPrice} €`;
    } else {
      const minWeightPrice = parseFloat(document.getElementById("hidden_price_min").textContent.replace(",","."));
      totalSelectedPrice.innerHTML = `${minWeightPrice} €`;
    }

}

displayPrice();
