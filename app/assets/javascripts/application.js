//= require jquery
//= require rails-ujs
//= require activestorage
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .

$(function () {
  $('#file').on('change', function (e) {
    // for one image
    var file = e.target.files[0];
    var $preview = $("#img_field");

    var fileReader = new FileReader();
    fileReader.onload = function () {
      // Data URIを取得
      var dataUri = this.result;
      $("#uploaded_img").empty();
      $preview.empty();
      $preview.append($('<img>').attr({
        "src": dataUri,
        "width": "100%",
        "class": "preview",
      }));
    };

    // read file via Data URI
    fileReader.readAsDataURL(file);
  });
});

$(function() {
  $("#profile").on("change", function(e) {
    // for one image
    var file = e.target.files[0];
    var $preview = $("#avatar_field");

    var fileReader = new FileReader();
    fileReader.onload = function() {
      // Data URIを取得
      var dataUri = this.result;
      $("#imgProfile").empty();
      $preview.empty();
      $preview.append(
        $("<img>").attr({
          src: dataUri,
          class: "preview-avatar image_box"
        })
      );
    };
    $("#btnChangePicture").removeClass("d-none");
    // read file via Data URI
    fileReader.readAsDataURL(file);
  });
});