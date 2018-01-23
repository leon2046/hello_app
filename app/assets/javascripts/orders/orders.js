$(document).ready(function() {
  $("#order_customer_id").on("change", function(evt) {
    $this = $(this);
    $("#order_note").val($this.find("option:selected").text() + customer_order_text);
  });
});
