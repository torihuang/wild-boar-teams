$(document).ready(function() {

  $('.add-student-button').on('click', function(e) {
    e.preventDefault();   
    var $this = $(this);
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

  $('.unaddable').on('click', function() {
    var $this = $(this);
    var $reasons = $this.closest(".table-center").siblings(".ineligibility");
    $reasons.toggle();
  });
})
