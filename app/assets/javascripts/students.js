$(document).ready(function() {
  $('.student-list').on('click', '.add-student-button', function(e) {
    e.preventDefault();
    console.log("HERE")
    var $this = $(this);
    var splitURL = $this.attr('href').split('/');
    var teamId = splitURL[1];
    var studentId = splitURL[3];
    console.log(splitURL)
    $.ajax({
      method: "PUT",
      url: "/teams/" + teamId + "/students/" + studentId
    })
    .done(function(response) {
      var name = $this.parent().parent().parent().find('#student-name').text();
      $this.parent().parent().parent().replaceWith(response);
      alert(name + " was added to your team!");
    })
  })
  $('.student-list').on('click', '.unaddable', function() {
    var $this = $(this);
    var student_link = $this.closest("table").siblings("h2").children("a").attr("href")
    var student_id = student_link.split('/')[2]
    var teacher_link = $this.closest("section").closest("#main-container").children().children("nav").children("a:first-child").attr("href")
    var teacher_id = teacher_link.split('/')[2]
  })
})
