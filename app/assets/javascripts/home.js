$(function()
{
	$.mask.definitions['~']='[+-]';
  $('.input-phone').mask('(999) 999-9999')
  $('.timepicker').mask('99:99');
  
  // $(".timepicker").timepicker({
  //   minuteStep: 1,
  //   showSeconds: false,
  //   showMeridian: false
  // });

  $('.date-picker').datepicker({ format: 'yyyy-mm-dd' });

  $('.tooltip').on("click", function(){
  	console.log("hey");
  	$(this).tooltip('show');
  });

  $('.tooltip').on("mouseout", function(){
  	$(this).tooltip('hide');
  });

  $("form").validate();
})