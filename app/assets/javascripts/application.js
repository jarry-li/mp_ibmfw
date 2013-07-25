// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.tabs
//= require jquery.ui.slider
//= require jquery.ui.datepicker
//= require turbolinks
// require twitter/bootstrap
//= require rails.validations
//= require ckeditor/init
//= require_tree .

// window.ClientSideValidations.callbacks.form.pass = function(form, eventData) {
//   $("input.form-submit").attr('disabled', true);
//   $("img#loading").removeClass("hide");
// }

$(function() {

  $('.form-reset').click( function() {
    $(this).closest('form')[0].reset();
    return false;
  });

  $('#answer_answer_type').change(function() {
    // var answer_type = $(this).val();
    if ( $(this).val() == 1 ) {
      $('#answer_content').closest('.control-group').show();
      $('#answer_material_id').closest('.control-group').hide();
    } else {
      $('#answer_content').closest('.control-group').hide();
      $('#answer_material_id').closest('.control-group').show();
    }
  });

  $('.button-add').click(function(event){
    $('.mask').show();
    $('.popup').show();
    event.preventDefault();
    $('#new_wx_mp_user').resetClientSideValidations();
  });

  $('.icon_close').click(function(event){
    $('.mask').hide();
    $('.popup').hide();
    event.preventDefault();
  });

  $('.delete').click( function() {
    $delete_obj = $(this);

    $.ajax({
      type: "DELETE",
      dataType: 'json',
      url: $delete_obj.data('url'),
      success: function(data) {
        if ( data && data.error ) {
          alert('删除失败');
          // js_flash_notice(data.error);
        } else {
          $delete_obj.closest('li').slideUp( function() {
            $delete_obj.closest('li').remove();
          });
        }
      },
      error: function() {
        // js_flash_notice('删除失败');
        alert('删除失败');
      }
    });

    return false;
  });

  $('.root-menu').click(function(){
    var subMenus = $(this).parent().next('ul'),
      arrow = $(this).find('.icon-root-menu'),
      isShowed = $(this).parent().next('ul:visible');
    if (isShowed.length == 1) {
      subMenus.hide();
      arrow.removeClass('icon_expand_arrow').addClass('icon_collapse_arrow');
    } else {
      subMenus.show();
      arrow.removeClass('icon_collapse_arrow').addClass('icon_expand_arrow');
    };
  });
});
