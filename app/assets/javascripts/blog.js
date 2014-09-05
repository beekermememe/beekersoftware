var ready;

set_blog_select_event = function(){
  var articles = $("li.blog-title")
  articles.each(attach_blog_select);
};

var attach_blog_select;

attach_blog_select = function (idx,article){
  article.onclick = function(){
    var id = extract_id_from_slug(article.id);
    $.ajax({
      type: "GET",
      url: '/article/' + id
    }).done(function(response){
      console.log(response);
      $("#blog-title").html(response.title);
      $("#blog-author").html("by " + response.author);
      $("#blog-content").html(response.content);
    }).fail(function( jqXHR, textStatus ) {
      console.log( "Request failed: " + textStatus );
    });
  };
};

$(document).on('ready page:load',set_blog_select_event);