$(document).ready(function() {
  $('#name_jp_rakuten_query, #jan_cd_rakuten_query').click(function() {
    var $table = $(".bs-example-modal-sm .table");
    $table.empty();
    $table.append($('<tr><td>Loading...</td></tr>'));
    $(".bs-example-modal-sm").modal('show');

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
        $('<tr>').append(
            $('<th scope="row"></th>').text('¥' + rec.itemPrice)).append($('<td>')
            .text(rec.itemName)).appendTo($table).data('rowData', rec)
          .on('click', function() {
            var rowData = $(this).data('rowData');
            $('#good_name_jp').val(rowData.itemName);
            $('#good_price_jpy').val(rowData.itemPrice);
            $('#good_image_path').val(rowData.imageUrl);
            $(".bs-example-modal-sm").modal('hide');
          });
      });

    });

    return false;
  })
})
