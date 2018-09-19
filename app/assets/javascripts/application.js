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
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets


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





//modal
 
  //テキストリンクをクリックしたら
 // $("#modal-open").click(function(){
 //      //body内の最後に<div id="modal-bg"></div>を挿入
 //     $("body").append('<div id="modal-bg"></div>');
 
 //    //画面中央を計算する関数を実行
 //    modalResize();
 
 //    //モーダルウィンドウを表示
 //        $("#modal-bg,#modal-main").fadeIn("slow");
 
 //    //画面のどこかをクリックしたらモーダルを閉じる
 //      $("#modal-bg,#modal-main").click(function(){
 //          $("#modal-main,#modal-bg").fadeOut("slow",function(){
 //         //挿入した<div id="modal-bg"></div>を削除
 //              $('#modal-bg').remove() ;
 //         });
 
 //        });
 
 //    //画面の左上からmodal-mainの横幅・高さを引き、その値を2で割ると画面中央の位置が計算できます
 //     $(window).resize(modalResize);
 //      function modalResize(){
 
 //            var w = $(window).width();
 //          var h = $(window).height();
 
 //            var cw = $("#modal-main").outerWidth();
 //           var ch = $("#modal-main").outerHeight();
 
 //        //取得した値をcssに追加する
 //            $("#modal-main").css({
 //                "left": ((w - cw)/2) + "px",
 //                "top": ((h - ch)/2) + "px"
 //          });
 //     }
 //   });
});








