$(document).ready(function() {
  newAnswerListener();
  newAnswerSubmitListener();
  // newQuestionListener();
  // newQuetionSubmitListener();

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

    $("#new-answer").remove();

    request.done(function(response) {
      console.log(response);
      $(".corresponding-answers").prepend(response);
      
    });
  });
};

// var newQuestionListener = function(){
//   $(".body").on("submit", "#new-question",function(event){
//     event.preventDefault();
//     var $this = $("#new-question");
//     var url = $this.attr("action");
//     var method = $this.attr("method");
// debugger
//     var request = $.ajax({
//       url: url,
//       method: method
//     });
//     request.done(function(response){
//       console.log(response);
      
//     });
//   });

// };




  // newQuetionSubmitListener();
