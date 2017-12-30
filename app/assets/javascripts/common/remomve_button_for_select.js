$(document).ready(function() {
  $(".glyphicon-remove-circle").parent("span").on("click", function(evt) {
    $(this).parent(".input-group").find("select").focus().val("");
    return false;
  });
})
