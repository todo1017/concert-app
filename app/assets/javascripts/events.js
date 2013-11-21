// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){
	$.mask.definitions['~']='[+-]';
  $('.input-phone').mask('(999) 999-9999')
  $('.timepicker').mask('99:99');
  $('.date-picker').mask('9999-99-99');
  
  $(".timepicker").timepicker({
    minuteStep: 1,
    showSeconds: false,
    showMeridian: false
  });

	if ($('.date-picker').length > 0)
  	$('.date-picker').datepicker({ format: 'yyyy-mm-dd' });

	jQuery.validator.addMethod("DateFormat", function(value, element) {
	    var date_regex = /^(0[1-9]|1[0-2])\/(0[1-9]|1\d|2\d|3[01])\/(19|20)\d{2}$/ ;
	    var values = value.split("/");
	    return this.optional(element) || (value.test(date_regex) && (new Date(values[2], values[0], values[1])));
	});
  var rules = {
  	rules: {
			"event[artist_id]": {
      	required: true
    	},
  		"event[performance_date]": {
  			DateFormat: "#event_performance_date"
  		}
  	}
  };
  var validationObj = $.extend (rules, Application.validationRules);
  $('#add-event form').validate(validationObj);
});