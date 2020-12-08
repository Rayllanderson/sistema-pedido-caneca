$('.alert').hide();

var idCaneca = null;
var idTema = null;
var idEtapa = null;
var title = null;
var clienteId = null
var switchStatus = false;

$('#edit-modal').on('show.bs.modal', function(event) {
	$('#alertE').hide();
	var button = $(event.relatedTarget) // Button that triggered the modal
	title = button.data('title')
	let id = button.data('id') // Extract info from data-* attributes
	let tema = button.data('tema')
	let etapa = button.data('etapa')
	let qtd = button.data('qtd')
	let desc = button.data('desc')
	clienteId = button.data('cliente-id')

	// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	var modal = $(this)
	modal.find('.modal-title').text(title)
	modal.find('#id-edit').val(id)
	modal.find('#temas').val(tema)
	etapa == undefined || '' ? $('#etapa').val(1) : setEtapa(etapa);
	modal.find('#qtd').val(qtd == undefined || '' ? 1 : qtd)
	modal.find('#text-area').val(desc)
})

$('#nova-caneca').on('click', function() {
	disableDisabled();
	$("#customSwitch1").prop("checked", true).change();
})

$('#edit-caneca').on('click', function() {
	ableDisabled();
	$("#customSwitch1").prop("checked", false).change();
})



$("#customSwitch1").on('change', function() {
	if ($(this).is(':checked')) {
		switchStatus = $(this).is(':checked');
		disableDisabled(); //desativando edição
		$('#text-switch').text('Desabilitar Edição')
	}
	else {
		switchStatus = $(this).is(':checked');
		ableDisabled(); //bloqueando edição
		$('#text-switch').text('Habilitar Edição')
	}
});


$('#btn-edit-caneca').on('click', function() {
	
	const queryString = window.location.search;
	var acao = title;
	acao = acao == "Editar" ? 'Editada' : 'Cadastrada'
	var id = $('#id-edit').val();
	var temaId = $('#temas').val();
	var etapaId = $('#etapa').val();
	var qtd = $('#qtd').val();
	var descricao = $('#text-area').val();
	if ($("#temas").val() == null || $("#temas").val() == undefined || $("#temas").val() == '') {
		$('#temas').focus();
	} else {
		$.ajax({
			method: "POST",
			url: "caneca-save",
			data: {
				'idCaneca': id,
				'tema-id': temaId,
				'etapa-id': etapaId,
				'quantidade': qtd,
				'descricao': descricao,
				'clientId' : clienteId
			},
			success: function() {
				alertBootstrap("Caneca " + acao, 'alert alert-success', "Sucesso")
				$('#edit-modal').modal('hide')
				$.get("canecas" + queryString, function(responseXml) {
					$("#start").html($(responseXml).find("data").html());
				});
			}, error: function() {
				alertBootstrap("Ocorreu um erro", 'alert alert-danger', "Ops..")
			}
		});
	}
})