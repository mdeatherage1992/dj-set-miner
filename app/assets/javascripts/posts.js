$(document).ready(function(){
  $("a.load_comments").on("click", function(e){
    $.ajax({
      method: "GET",
      url: this.href
    }).done(function(response){

      $("div.comments").html(response)

    });
    e.preventDefault();
  })
})
