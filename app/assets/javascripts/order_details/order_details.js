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
            $menu.removeClass("open");
            return false;
          })
        );
      });
    })
  });
})
