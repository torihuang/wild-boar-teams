$(document).ready(function() {

  if(window.location.pathname == '/') {
    $('header').toggle();
    $('body').addClass('welcome');
  }

  $('#login-button').on('click', function(e) {
    e.preventDefault();
    $this = $(this);
    $.ajax({
      method: 'GET',
      url: '/session/new'
    })
    .done(function(response) {
      if ($this.parent().find('#login-form').length > 0) {
        $('#login-form').remove();
      } else {
        $this.after(response);
      }
    })
  })

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
      alert(name + " was added to your team!");
    })
  });

  $('.student-list').on('click', '.unaddable', function() {
    var $this = $(this);
    var student_link = $this.closest("table").siblings("h2").children("a").attr("href")
    var student_id = student_link.split('/')[2]
    var teacher_link = $this.closest("section").closest("#main-container").children().children("nav").children("a:first-child").attr("href")
    var teacher_id = teacher_link.split('/')[2]
  });
})
