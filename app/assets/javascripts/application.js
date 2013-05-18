// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

function vote_annotation(link, caller) {
  console.log(link);
  $.ajax({
    url: link,
    type: 'PUT',
    success: function(res) {
      console.log(res);
      console.log($(caller).parent().children(".lead").text());
      $(caller).parent().children(".lead").text(res.rating);
      $(caller).parent().children(".lead").removeClass("text-success text-error")
      $(caller).parent().children(".lead").addClass(res.rating >= 0 ? "text-success" : "text-error");
    },
  });
};

function vote_source(link, caller) {
  console.log(link);
  $.ajax({
    url: link,
    type: 'PUT',
    success: function(res) {
      console.log(res);
      console.log($(caller).parent().children(".lead").text());
      $(caller).parent().children(".lead").text(res.rating);
      $(caller).parent().children(".lead").removeClass("text-success text-error")
      $(caller).parent().children(".lead").addClass(res.rating >= 0 ? "text-success" : "text-error");
    },
  });
};
