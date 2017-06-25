jQuery(document).ready(function($) {
	$('#illustration').hover( function(){
		$(this).addClass('expand');
	}, function(){
		$(this).removeClass('expand');
	} );
    
    $('a[href^="#"]').click(function(){
    //��������� �������� �������� href � ����������:
    var target = $(this).attr('href');
    $('html, body').animate({scrollTop: $(target).offset().top}, 800);
    return false;
    });
    
});