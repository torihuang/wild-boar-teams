$(document).ready(function() {

  $('.student-master-list').on('click', '.add-student-button', function(e) {
    e.preventDefault();
    console.log("HERE")
    var $this = $(this);
    // var splitURL = $this.attr('href').split('/');
    // var teamId = splitURL[1];
    // var studentId = splitURL[3];
    console.log($this.attr('href'))
    $.ajax({
      type: "PUT",
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      url: "/students/2/teams/10"
    })
    .done(function(response) {
      console.log(response);
      var name = $this.parent().parent().parent().find('#student-name').text();
      $this.parent().parent().parent().replaceWith(response);
      alert(name + " was added to your team!");
    })
  });

})
