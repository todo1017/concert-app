$(function()
{
  $('.tooltip').on("click", function(){
  	$(this).tooltip('show');
  });

  $('.tooltip').on("mouseout", function(){
  	$(this).tooltip('hide');
  });

})