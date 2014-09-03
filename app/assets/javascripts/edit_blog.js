var ready;

set_delete_event = function(){
  var articles = $("a.delete_article")
  articles.each(attach_delete);
};

var attach_delete;

attach_delete = function (idx,article){
  article.onclick = function(){
    var id = extract_id_from_slug(article.id);
    $.ajax({
      type: "DELETE",
      url: '/admin/delete/' + id
    }).done(function(response){
      $("#article_"+id).hide();
    }).fail(function( jqXHR, textStatus ) {
      console.log( "Request failed: " + textStatus );
    });
  };
};

set_edit_event = function(){
  var articles = $("a.edit_article")
  articles.each(attach_edit);
};

var attach_edit;

attach_edit = function (idx,article){
  article.onclick = function(){
    var id = extract_id_from_slug(article.id);
    window.location.replace("/admin/edit/"+id);
  };
};

function extract_id_from_slug(slug){
  var data = slug.split("_");
  return data[data.length - 1];
};

$(document).on('ready page:load',set_delete_event);
$(document).on('ready page:load',set_edit_event);

