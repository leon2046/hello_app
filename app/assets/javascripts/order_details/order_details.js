$(document).ready(function() {
  $('#goodsQueryButton').click(function() {
    var $menu = $("#goodIdDropdownMenu");
    var $ul = $menu.find("ul.dropdown-menu");
    var keyword = $('#order_detail_good_name_jp').val();

    $.get('/goods/query', {
      'keyword': keyword
    }, function(data) {
      if (!data.length) {
        // $ul.empty().append($('<li>').text("No Matched Goods."));
        return;
      }

      $menu.addClass("open");
      $ul.find("li").remove();
      data.forEach(function(rec) {
        $ul.append(
          $('<li>').append($("<u>").text(rec.name_jp))
          .data("rowData", rec)
          .on("click", function(event) {
            var rowData = $(this).data("rowData")
            $("#order_detail_good_name_jp").val(rowData.name_jp);
            $("#order_detail_good_id").val(rowData.id);
            $("#order_detail_purchase_price").val(rowData.price_jpy);
            $("#order_detail_selling_price").val(rowData.selling_price_cny);
            $menu.removeClass("open");
            return false;
          })
        );
      });
    })
  });

  $("#order_detail_quantity, #order_detail_selling_price").on("change", function () {
    var quantity = parseInt($("#order_detail_quantity").val());
    var price = parseInt($("#order_detail_selling_price").val());
    var amount = price * quantity;
    $("#order_detail_total_amount").val(amount || "");
  });

})
