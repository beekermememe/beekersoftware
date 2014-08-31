$( function()
  {
    $(".delete_article").click(function() {
      alert("You clicked me " + extract_id_from_slug(this.id));
    });
  }
);

function extract_id_from_slug(slug){
  var id = slug.split("_")[1];
  return id;
};