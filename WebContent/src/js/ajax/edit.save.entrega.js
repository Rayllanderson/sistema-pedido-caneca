

$('#saveEntrega').on('click', function() {
	const id = $('#entregaId').val();
	const name = $('#entregaName').val();
	if (!name) {
		alertBootstrap("Campo nome não pode ser vazio", 'alert alert-danger');
	} else {
		$.ajax({
			method: "POST",
			url: "entregas",
			data: {
				'id': id,
				'nome': name
			},
			success: function() {
				alertBootstrap("Done", 'alert alert-success', "Sucesso")
				$.get("entregas", function(responseXml) {
					$("#start").html($(responseXml).find("data").html());
					clearValues();
				});
			}, error: function() {
				alertBootstrap("Ocorreu um erro", 'alert alert-danger', "Ops..", 2000)
			}
		});
	}
})


$('#clearValues').on('click', function(){
	clearValues();
})


function clearValues() {
	$('#infos').css('display', 'none')
	$('#entregaName').val('');
	$('#entregaId').val('');
}
