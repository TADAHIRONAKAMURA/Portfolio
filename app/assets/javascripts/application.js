// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require activestorage
//= require_tree .
//= require bootstrap-sprockets

 // $(document).ready(function(){
 //      $('.a').slick({
 //        rtl: true
 //      });
 //    });


$(function() {
	$(document).on("ajax:success", ".follow", function(e) {
		var id = e.target.attributes[1].value;
		$('.'+id).html(e.detail[2]["response"]);
		$.ajax({
			url: '/count',
			type: 'get',
			async: true,
			beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))}
		})
		.done(function(f) {
			$('.my_follow').text(f);
		})
		.fail(function() {
		})
	})

	$(document).on("ajax:success", ".user_show", function(e) {
		$('.b').text(e.detail[0]);
		if ($('.user_show').hasClass('now')) {
			$('.user_show').removeClass('now').addClass('yet').text('フォローする');
		} else {
			$('.user_show').removeClass('yet').addClass('now').text('フォロー中');
		}
	})

	$('html').click(function(e) {
		if (!$(e.target).closest('.table_right, .this_follow, .this_follower').length) {
			$('.table_right').removeClass('active');
			$('.table_right').html('');
		}
	})

	$(document).on("ajax:success", ".forf", function(e) {
		$('.table_right').html(e.detail[2]["response"]);
		if ($('.table_right').html() != '') {
			$('.table_right').addClass('active');
		}
	})

	$(document).ready(function(){
	// $(document).one('turbolinks:load', function(){
	$('.slider-for').slick({
		slidesToShow: 1,
	    slidesToScroll: 1,
	    arrows: false,
	    fade: true,
	    asNavFor: '.slider-nav'
	  });

	  $('.slider-nav').slick({
	    slidesToShow: 3,
	    slidesToScroll: 1,
	    asNavFor: '.slider-for',
	    dots: true,
	    centerMode: true,
	    focusOnSelect: true
      });
   	});


    $(document).on("click", "#modal-open", function() {
      $('.modal-bg').css('display', 'block');
      $('.modal-main').fadeIn();
    })
    $('.check_btn').click(function(e) {
      $('.modal-bg').fadeOut();
      $('.modal-main').fadeOut();
    })

});








