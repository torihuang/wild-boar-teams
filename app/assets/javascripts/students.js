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
})
