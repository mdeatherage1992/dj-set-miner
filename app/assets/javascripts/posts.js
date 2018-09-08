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
      e.preventDefault();
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
        var $ol = $("div.comments ol")[0]
        //ol.append.child
        $ol.append(response);
      }
    });
  })
});
// work with class to make prototype methods
// function Comment() {
//   this.id = id
//   this.body = body
//   this.post_id = post_id
// }

$(function(){
  bindClick()
})

function bindClick() {
  $('.js-prev').on('click', function(e){
    $("#app-container").html('')
    const id = $(this).data('id')
    fetch(`/api/posts/next`)
    .then(res => res.json() )
    .then(post=> {
      const newPost = new Post(post.id, post.user, post.title,post.description,post.url, post.video, post.genres, post.comments)
      $("#app-container").append(newPost.formatPost())
    })
    .catch(err => console.log(err))
    history.pushState(null,null,`/posts/${id - 1}`)
  });
  $('.js-next').on('click', function(e){
    $("#app-container").html('')
    const id = $(this).data('id')
    fetch(`/api/posts/${id + 1}`)
    .then(res => res.json() )
    .then(post=> {
      const newPost = new Post(post.id, post.user, post.title,post.description,post.url, post.video, post.genres, post.comments)
      $("#app-container").append(newPost.formatPost())
    })
    .catch(err => console.log(err))
    history.pushState(null,null,`/posts/${id + 1}`)
  })
}

function Post(id,user,title,description,video, url, genres, comments) {
  this.id = id
  this.user = user
  this.title = title
  this.description = description
  this.video = video
  this.url = url
  this.genres = genres
  this.comments = comments
}

Post.prototype.formatPost = function () {
  let html = ''
html =   `
  <h1> ${this.title} </h1>
  <h3> Author: ${this.user.email} </h3>
  <h7> Description: ${this.description} </h7>
  <iframe width="100%" height="300" scrolling="no" frameborder="no" allow="autoplay" src="${this.url}"> </iframe>
  <div class="comments">
  <%= render "comments/comment" %>
  </div>

  <%= form_for(comment, :url => post_comments_path(${this})) do |f| %>
  <%= f.text_area :body %><br>
  <%= f.submit "Submit", data: { disable_with: false } %>
  <% end %>




  `
  return html
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
