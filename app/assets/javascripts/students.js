$(document).ready(function() {
  $('#student-master-list').on('click', '.add-student-button', function(e) {
    e.preventDefault();
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
      console.log(response)
      // $this.parent().find('.team-name').text('Team ' + response)
      $this.parent().parent().parent().replaceWith(response);
    })
  })
})
