$('.alert').hide();


$('#save').on('click', function() {
	
	var id = $('#id').val();
	var temaId = $('#temas').val();
	var etapaId = $('#etapa').val();
	var qtd = $('#qtd').val();
	var descricao = $('#text-area').val();
	
	$.ajax({
		method: "POST",
		url: "save",
		data: { id: id,
			'tema-id': temaId,
			'etapa-id' : etapaId,
			'quantidade' : qtd,
			'descricao' : descricao},
		success: function() {
			alertBootstrap("Caneca Ediata com sucesso!", 'alert alert-success', "Sucesso")
		}, error: function() {
			alertBootstrap("Ocorreu um erro", 'alert alert-danger', "Ops..")
		}
	});
})