$('.alert').hide();


function alertError(msg, classe) {
	$("#alertE").show();
	document.getElementById('alertMsgE').innerHTML = msg;
	document.getElementById("alertE").className = classe;
	$("#alertE").fadeTo(2700, 500).slideUp(500, function() {
		$("#alertE").slideUp(500);
	});
}


function alertBootstrap(msg, classe, titulo, tempo) {
	$(".alert").show();
	const title = document.getElementById('titulo');

	if(titulo != undefined){	
		if(title != null){
		title.innerHTML = titulo
		}
	}else{
		title.innerHTML = ''
	}
	
	tempo = tempo == null || undefined ? 500 : tempo;
	document.getElementById('alertMsg').innerHTML = msg;
	document.getElementById("success-alert").className = classe;
	$(".alert").fadeTo(2500, tempo).slideUp(tempo, function() {
		$(".alert").slideUp(tempo);
	});
}

