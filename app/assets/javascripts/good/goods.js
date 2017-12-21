$(document).ready(function(){
  console.log("goods");

  $('#rakuten_query').click(function(){

    var keyword = $('#good_jan_cd').val() || $('#good_name_jp').val();
    $.get('/rakuten/query', {
      'keyword': keyword
    }, function(data) {
      console.log(data);
      $('#good_name_jp').val(data[0].itemName);
      $('#good_price_jpy').val(data[0].itemPrice);
      $('#good_image_path').val(data[0].imageUrl);

    });

    return false;
  })
})
