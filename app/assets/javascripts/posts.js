$(document).ready(function() {
  $("a.load_comments").on("click", function(e){
    $.ajax({
      method: "GET",
      url: this.href
    }).done(function(response){

      $("div.comments").html(response).load("comments")

    })
    e.preventDefault();
  })
})

$(function(){
  $("a.hide_comments").on("click", function(e){
    e.preventDefault();
    $(".comments").html('')
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
        console.log(data)
        const newComment = new Comment(data['comment'])
        console.log(newComment)
        $ol.append(newComment.commentPost())
        // $ol.append($ol.children[0])
        //ol.append.child
        // $ol.append(response);
      }
    });
      e.preventDefault();
  })
});

class Comment {
  constructor(data) {
  this.id = data.id
  this.body = data.body
  this.post_id = data.post_id
  }
}


Comment.prototype.commentPost = function () {
  let html = ''
  html = `
  ${this.body}



  `
  return html
}


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
    fetch(`/api/posts/${id - 1}`)
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
      const newPost = new Post(post.id, post.user, post.title,post.description,post.url,post.video, post.genres, post.comments)
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
  <a href="${this.id}" id=><Back to Posts!</a>
  <h1> ${this.title} </h1>
  <h3> Author: ${this.user.email} </h3>
  <h7> Description: ${this.description} </h7>
  <iframe width="100%" height="300" scrolling="no" frameborder="no" allow="autoplay" src="${this.url}"> </iframe>





  `
  return html
}

Post.prototype.indexerPost = function () {
  let html = ''
  html = `
  <iframe width="100%" height="300" scrolling="no" frameborder="no" allow="autoplay" src="${this.url}"> </iframe>



  `
  return html
}

$(function(){
  binder()
})

function binder() {
  $('.view-videos').on('click', function() {
    $.get('/api/posts', function(data) {
      data.forEach(function(post){
        const indexPost =  new Post(post.id, post.user, post.title,post.description,post.url,post.video, post.genres, post.comments)
        $('#video-dom').append(indexPost.indexerPost())
      })
    })
  })
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
