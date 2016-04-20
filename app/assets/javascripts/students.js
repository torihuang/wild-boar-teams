$(document).ready(function() {

  $('.add-student-button').on('click', function(e) {
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
      url: $this.attr('href')
    })
    .done(function(response) {
      console.log(response);
      var name = $this.parent().parent().parent().find('#student-name').text();
      $parent = $this.parent().parent().parent()
      console.log($parent)
      $parent.replaceWith(response);
      // if ($parent.find('.add-student-button'))
      alert(name + " was added to your team!");
    })
  });

})
