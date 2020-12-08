

function selectCliente(id){
	$.ajax({
		method: "POST", //infelizmente por post, por get ta enchendo o saco,
		url: "canecas",
		data: { 'clientId' : id },
		success: function() {
			location.href="canecas"
		}, error: function() {
			console.log('error')
		}
	});
}

