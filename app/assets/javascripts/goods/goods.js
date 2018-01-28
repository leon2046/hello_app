$(document).ready(function() {
  $('#name_jp_rakuten_query, #jan_cd_rakuten_query').click(function() {
    var $table = $(".bs-example-modal-sm .table");
    $table.empty().append($('<tr><td>Loading...</td></tr>'));

    var $modal = $(".bs-example-modal-sm");
    $modal.modal('show');

    var keyword = $('#good_jan_cd').val() || $('#good_name_jp').val();
    $.get('/rakuten/query', {
      'keyword': keyword
    }, function(data) {
      if (!data.length) {
        $table.empty();
        $table.append($('<tr><td>Not Found.</td></tr>'));
        return;
      }

      $table.empty();
      data.forEach(function(rec) {
        $('<tr>').append($('<th scope="row"></th>').text('JPY ' + rec.itemPrice))
                .append($('<td>').text(rec.itemName))
                .appendTo($table).data('rowData', rec)
                .on('click', function() {
                    var rowData = $(this).data('rowData');
                    $('#good_name_jp').val(rowData.itemName);
                    $('#good_price_jpy').val(rowData.itemPrice);
                    var profit_rate = 1 + (parseInt($('#good_profit_rate').val()) / 100 || 0.1);
                    var selling_price_cny = Math.floor(parseFloat(rowData.itemPrice) * current_rate * profit_rate);
                    $('#good_selling_price_cny').val(selling_price_cny);
                    $('#good_image_path').val(rowData.imageUrl);
                    $modal.modal('hide');
                });
      });
    });

    return false;
  });

  $(".glyphicon-remove-circle").parent("span").on("click", function(evt) {
    $("#search_keyword").focus().val("");
    return false;
  });

  $("#good_price_jpy, #good_profit_rate").on("change", function(evt) {
    var $rate = $("#good_profit_rate");
    var $price_jpy = $("#good_price_jpy")
    var profit_rate = parseFloat($rate.val()) || 10;
    var price_jpy = parseInt($price_jpy.val()) || 0;
    var price_cny = price_jpy * current_rate * (1 + profit_rate / 100);
    $("#good_selling_price_cny").val(Math.floor(price_cny));

    $rate.val(profit_rate);
    $price_jpy.val(price_jpy);
  });

  $("#good_selling_price_cny").on("change", function(evt) {
    var price_cny = parseFloat($(this).val());
    var price_jpy = parseInt($("#good_price_jpy").val());
    var profit_rate = ((price_cny / current_rate / price_jpy) - 1) * 100;
    $("#good_profit_rate").val(Math.floor(profit_rate) || 10);
  });
});
