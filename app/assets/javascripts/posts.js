$(document).ready(function(){
  $("a.load_comments").on("click", function(e){
    $.ajax({
      method: "GET",
      url: this.href
    }).done(function(response){

      $("div.comments").html(response)

    })
    e.preventDefault();
  })
})


$(document).ready(function(){
  $('#new_comment').on("submit", function(e){
    $.ajax({
      type: ($("input[name='_method']").val() || this.method),
      url: this.action,
      data: $(this).serialize(),
      success: function(response) {
        $("#comment_body").val("");
        var $ol = $("div.comment ol")
        $ol.append(response);
      }
    });
      e.preventDefault();
  })
});
