// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){
	$(".img-poster, .img-picture").on("click", function(){
		$(this).next().click();
	});

	$('.file-poster, .file-picture').on('change', function(input){
    
    evt = input.target;
    if (evt.files && evt.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
          $(evt).prev().attr('src', e.target.result);
      };

      reader.readAsDataURL(evt.files[0]);
    }
  });

	rules = {
  	rules: {
			"artist[name]": {
      	required: true
    	},
  		"artist[email]": {
      	required: true
    	},
    	"artist[price]": {
      	required: true
    	}
  	}
  };
  var validationObj = $.extend (rules, Application.validationRules);
  $('#add-artist form').validate(validationObj);
})