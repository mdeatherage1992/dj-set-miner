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

$(function(){
  $("#new_comment").on("submit", function(e){
    url = this.action
    console.log(url)

    data = {
      'authenticity_token': $("input[name='authenticity_token']").val(),
      'comment': {
        'body':$("#comment_body").val()
      }
    };
    $.ajax({
      type: "POST",
      url: url,
      data: data,
      success: function(response){
        $("#comment_body").val("");
        var $ol = $("div.comments ol")
        $ol.append(response);
      }
    });
    e.preventDefault();
  })
});

$(function(){
  bindClick()
})

function bindClick() {
  $('.js-prev').on('click', function(e){
    const id = $(this).data('id')

    fetch(`/api/posts/${id - 1}`)
    .then(res => res.json() )
    .then(post=> console.log(post))
    .catch(err => console.log(err))
  });
  $('.js-next').on('click', function(e){
    const id = $(this).data('id')
    fetch(`/api/posts/${id + 1}`)
    .then(res => res.json() )
    .then(post=> {
      const newPost = new Post(post.id, post.title,post.body,post.comments)
      console.log(newPost)
    })
    .catch(err => console.log(post))
  });
}

function Post(id,title,body,comments) {
  this.id = id
  this.title = title
  this.body = body
  this.comments = comments
}
// $(document).ready(function(){
//   $('#new_comment').on("submit", function(e){
//     $.ajax({
//       type: ($("input[name='_method']").val() || this.method),
//       url: this.action,
//       data: $(this).serialize(),
//       success: function(response) {
//         $("#comment_body").val("");
//         var $ol = $("div.comment ol")
//         $ol.append(response);
//       }
//     });
//       e.preventDefault();
//   })
// });
