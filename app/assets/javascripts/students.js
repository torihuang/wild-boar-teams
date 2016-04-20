$(document).ready(function() {

  if(window.location.pathname == '/') {
    $('header').toggle();
    $('body').addClass('welcome');
  }

  $('#login-button').on('click', function(e) {
    e.preventDefault();
    var $this = $(this);
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
    .fail(function(jqxhr, status, errorThrown) {
      console.log("")
      $('#login-form').remove();
      $this.after(jqxhr.responseText);
    })
  })

  $('#register-button').on('click', function(event){
    event.preventDefault();
    var $this = $(this);
    $.ajax({
      method: 'GET',
      url: '/users/new'
    })
    .done(function(responseBody){
      if ($this.parent().find('#registration-form').length > 0) {
        $('#registration-form').remove();
      } else {
        $this.after(responseBody);
      }
    })
    .fail(function(jqxhr, status, errorThrown) {
      $('#registration-form').remove();
      $this.after(jqxhr.responseText);
    })
  })

  $('#welcome-buttons').on('submit', '.register', function(event){
    event.preventDefault();
    var $this = $(this);
    var $regForm = $this.find('.reg-form');
    $.ajax({
      method: 'POST',
      url: '/users',
      data: $(this).children("#registration-form").children("form").serialize(),
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))}
    })
    .done(function(responseBody){
      if ($this.parent().find('#registration-form').length > 0) {
        $('#registration-form').remove();
      } else {
        $this.after(responseBody);
      }
    })
    .fail(function(jqxhr, status, errorThrown) {
      $('#registration-form').remove();
      console.log(jqxhr);
      console.log(status);
      console.log(errorThrown);
      $this.after(jqxhr.responseText);
    })
  })

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
      var name = $this.parent().parent().parent().parent().parent().parent().find('#student-name').text();
      var $parent = $this.parent().parent().parent().parent().parent().parent();
      console.log("HERE")
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
