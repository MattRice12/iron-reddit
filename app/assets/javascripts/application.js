// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize
//= require_tree .

$(document).ready(function () {
  $('.upvote').on('click', function () {
    var find_vote_count = $(this).closest('.like-hate').find('.vote_count');
    var total_votes = +find_vote_count.text();
    var print_upvotes = (total_votes + 1);
    find_vote_count.html(print_upvotes);
  });

  $('.downvote').on('click', function () {
    var find_vote_count = $(this).closest('.like-hate').find('.vote_count');
    var total_votes = +find_vote_count.text();
    var print_upvotes = (total_votes - 1);
    find_vote_count.html(print_upvotes);
  });
});
