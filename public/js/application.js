$(document).ready(function() {
  newAnswerListener();
  newAnswerSubmitListener();
  newVoteSubmitListener();
});

var newAnswerListener = function() {
  $("#new-answer-link").on("click", function(event) {
    event.preventDefault();

    var url = $(this).attr("href");

    var request = $.ajax({
      url: url,
      method: "get"
    });

    request.done(function(response) {
      $("#new-answer-link").closest("article").append(response);
    });
  });
};

var newAnswerSubmitListener = function() {
  $(".container").on("submit", "#new-answer", function(event) {
    event.preventDefault();

    var url = $("#new-answer").attr("action");
    var method = $("#new-answer").attr("method");
    var data = $(this).serialize();

    var request = $.ajax({
      url: url,
      method: method,
      data: data
    });

    request.done(function(response) {
      $(".corresponding-answers").prepend(response);
      $("#new-answer").remove();
    });
  });
};

var newVoteSubmitListener = function() {
  $(".vote-bar").on("submit", "form", function(event) {
    event.preventDefault();

    var voteBar = $(this).closest(".vote-bar")
    var voteLocation = voteBar.closest("article")

    var url = $(this).attr("action");
    var method = $(this).attr("method");
    var data = $(this).serialize();

    var request = $.ajax({
      url: url,
      method: method,
      data: data
    });

    request.done(function(response) {
      voteBar.remove();
      voteLocation.prepend("<div class='vote-bar'>" + response + "</div>");
    });
  });
};















