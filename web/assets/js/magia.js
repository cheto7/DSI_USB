// JavaScript Document
$(document).ready(function() {
	$('a.window').click(function() {
		
                //Getting the variable's value from a link 
		var Box = $(this).attr('href');

		//Fade in the Popup
		$(Box).fadeIn(300);
		
		//Set the center alignment padding + border see css style
		var popMargTop = ($(Box).height() + 24) / 2; 
		var popMargLeft = ($(Box).width() + 24) / 2; 
		
		$(Box).css({ 
			'margin-top' : -popMargTop,
			'margin-left' : -popMargLeft
		});
		
		// Add the mask to body
		$('body').append('<div id="mask"></div>');
		$('#mask').fadeIn(300);
		
		return false;
	});
	
	// When clicking on the button close or the mask layer the popup closed
	$('a.close, #mask').live('click', function() { 
	  $('#mask , .popup').fadeOut(300 , function() {
		$('#mask').remove();  
	}); 
	return false;
	});
});