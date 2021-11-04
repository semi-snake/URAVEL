$(function () {
  $('.faq-content-answer').hide();

  $(".faq-content-question").click(
	function () {
	  //$(".faq-content-question").css("background-color","#ffedd2");
	  $(this).next().toggle(300);

  	}

  );

});

