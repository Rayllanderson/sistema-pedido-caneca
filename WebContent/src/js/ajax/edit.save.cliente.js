
var idCliente = null;
var nome = null;
var telefone = null;

$('#edit-modal').on('show.bs.modal', function(event) {
	var button = $(event.relatedTarget) // Button that triggered the modal
	var title = button.data('title')
	let id = button.data('id') // Extract info from data-* attributes
	let nomeModal = button.data('nome')
	let telefoneModal = button.data('telefone')
	// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	var modal = $(this)
	modal.find('.modal-title').text(title)
	modal.find('#id-edit').val(id)
	modal.find('#nome').val(nomeModal)
	modal.find('#telefone').val(telefoneModal)
})




$('#btn-edit-cliente').on('click', function() {
	idCliente = $('#id-edit').val();
	nome = $('#nome').val();
	telefone = $('#telefone').val();


	$.ajax({
		method: "POST",
		url: "clientes?action=save",
		data: {
			'id': idCliente,
			'nome': nome,
			'telefone': telefone
		},
		success: function() {
			$('#edit-modal').modal('hide')
			alertBootstrap("Cliente Editado com Sucesso!", 'alert alert-success', "Sucesso")
			$.get("clientes", function(responseXml) {
				$("#start").html($(responseXml).find("data").html());
			});
		}, error: function() {
			$('#edit-modal').modal('hide')
			alertBootstrap("Ocorreu um erro ao deletar", 'alert alert-danger', "Ops..")
		}
	});

})