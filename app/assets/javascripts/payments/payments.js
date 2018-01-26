$(document).ready(function() {
  $("#search_order_id").on("change", function(evt) {
    $("#search_customer_id").val("");
  });

  $("#search_customer_id").on("change", function(evt) {
    $("#search_order_id").val("");
  });
})
