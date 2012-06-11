
$(document).ready(function(){
function cektkp_growtextarea(textarea){
	textarea.each(function(index){
		textarea = $(this);
		textarea.css({'overflow':'hidden','word-wrap':'break-word'});
		var pos = textarea.position();
		var growerid = 'textarea_grower_'+index;
		textarea.after('<div style="position:absolute;z-index:-1000;visibility:hidden;top:'+pos.top+';height:'+textarea.outerHeight()+'" id="'+growerid+'"></div>');
		var growerdiv = $('#'+growerid);
		growerdiv.css({'min-height':'20px','font-size':textarea.css('font-size'),'width':textarea.width(),'word-wrap':'break-word'});
		growerdiv.html($('<div/>').text(textarea.val()).html().replace(/\n/g, "<br />."));
		if(textarea.val() == ''){
			growerdiv.text('.');
		}

		textarea.height(growerdiv.height()+10);
		
		textarea.keyup(function(){
			growerdiv.html($('<div/>').text($(this).val()).html().replace(/\n/g, "<br />."));
			if($(this).val() == ''){
				growerdiv.text('.');
			}
			$(this).height(growerdiv.height()+10);
		});
	});
}
cektkp_growtextarea($('textarea.autogrow'));
});

