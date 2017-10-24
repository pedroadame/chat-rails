$(document).ready(function(){
  $('.navbar-burger').on('click', function() {
    $(this).toggleClass('is-active');
    $('.navbar-menu').toggleClass('is-active');
  });

  $('.modal-background, .modal-close').on('click', function(){
    $('.modal').removeClass('is-active');
  });

  $('.launchs-modal').on('click', function(){
    var modal = $(this).data('launchs-modal');
    $('.'+modal).addClass('is-active');
  });
});
