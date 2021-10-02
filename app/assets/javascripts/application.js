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
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require cocoon

$(document).on('turbolinks:load', function(){
  // ハンバーガーメニューのクリックイベント
  $('.toggle_btn').on('click', function() {
    if ($('header').hasClass('open')) {
      $('header').removeClass('open');
    } else {
      $('header').addClass('open');
    }
  });

  // #maskのエリアをクリックした時にメニューを閉じる
  $('#mask').on('click', function() {
    $('header').removeClass('open');
  });

  // リンクをクリックした時にメニューを閉じる
  $('nav a').on('click', function() {
    $('header').removeClass('open');
  });
});

//ドロップダウンの設定を関数でまとめる
$(document).on('turbolinks:load', function mediaQueriesWin(){
  var width = $(window).width();
  if(width <= 768) {//横幅が768px以下の場合
    $(".has-child>a").off('click'); //has-childクラスがついたaタグのonイベントを複数登録を避ける為offにして一旦初期状態へ
    $(".has-child>a").on('click', function() {//has-childクラスがついたaタグをクリックしたら
      var parentElem =  $(this).parent();// aタグから見た親要素の<li>を取得し
      $(parentElem).toggleClass('active');//矢印方向を変えるためのクラス名を付与して
      $(parentElem).children('ul').stop().slideToggle(500);//liの子要素のスライドを開閉させる※数字が大きくなるほどゆっくり開く
      return false;//リンクの無効化
    });
  }else{//横幅が768px以上の場合
    $(".has-child>a").off('click');//has-childクラスがついたaタグのonイベントをoff(無効)にし
    $(".has-child>a").removeClass('active');//activeクラスを削除
    $('.has-child').children('ul').css("display","");//スライドトグルで動作したdisplayも無効化にする
  }
});

// slickの設定
$(document).on('turbolinks:load', function() {
   $('.slider').slick({
  autoplay: true,
  dots: false,
  arrows: false,
  infinite: true,
  speed: 500,
  fade: true,
  cssEase: 'linear'
  });
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

// 画像を登録する際の記述
$(document).on('turbolinks:load', function() {

  $('#trip_images').on('change',function(e){
    var files = e.target.files;
    var d = (new $.Deferred()).resolve();
    $.each(files,function(i,file){
      d = d.then(function() {
          return Uploader.upload(file)})
        .then(function(data){
          return previewImage(file, data.image_id);
      });
    });
    $('#trip_images').val('');
  });

  $('.images-field').on('click','.btn-edit', function(e){
    e.preventDefault();
    $(this).parent().find('.edit-image-file-input').trigger("click");
  });

  $('.images-field').on('change','.edit-image-file-input', function(e){
    var file = e.target.files[0];
    var image_box = $(this).parent();
    Uploader.upload(file).done(function(data){
      replaceImage(file, data.image_id, image_box);
    });
  });

  $('.images-field').on('click','.btn-delete', function(e){
    e.preventDefault();
    $(this).parent().remove();
  });

  var replaceImage = function(imageFile, image_id, element){
    var reader = new FileReader();
    var img = element.find('img');
    var input = element.find('.trip-images-input');
    var filename = element.find('p');
    reader.onload = function(e){
      input.attr({value: image_id});
      filename.html(imageFile.name);
      img.attr("src", e.target.result);
    };
    reader.readAsDataURL(imageFile);
  }

  var previewImage = function(imageFile, image_id){
    var reader = new FileReader();
    var img = new Image();
    var def =$.Deferred();
    reader.onload = function(e){
      var image_box = $('<div>',{class: 'image-box'});
      image_box.append(img);
      image_box.append($('<p>').html(imageFile.name));
      image_box.append($('<input>').attr({
            name: "trip[images][]",
            value: image_id,
            style: "display: none;",
            type: "hidden",
            class: "trip-images-input"}));
      image_box.append('<a href="" class= "btn-edit">Edit</a>');
      image_box.append($('<input>').attr({
            name: "edit-image[]",
            style: "display: none;",
            type: "file",
            class: "edit-image-file-input file-input"}));
      image_box.append('<a href="" class="btn-delete">Delete</a>');
      $('.images-field').append(image_box);
      img.src = e.target.result;
      def.resolve();
    };
    reader.readAsDataURL(imageFile);
    return def.promise();
  }

  var Uploader = {
    upload: function(imageFile){
      var def =$.Deferred();
      var formData = new FormData();
      formData.append('image', imageFile);
      $.ajax({
        type: "POST",
        url: '/trips/upload_image',
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false,
        success: def.resolve
      })
      return def.promise();
    }
  }
})

