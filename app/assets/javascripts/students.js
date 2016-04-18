$(document).ready(function() {
  $('#student-master-list').on('click', '.add-student-button', function(e) {
    e.preventDefault();
    var $this = $(this);
    // var url = $this.attr();
    var splitURL = $this.attr('href').split('/');
    var teamId = splitURL[2];
    var studentId = splitURL[4];
    console.log(splitURL)
    $.ajax({
      method: "PUT",
      url: "/teams/" + teamId + "/students/" + studentId
    })
    .done(function(response) {

    })
  })
})
