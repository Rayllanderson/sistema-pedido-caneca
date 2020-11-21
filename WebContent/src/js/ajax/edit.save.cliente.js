$('.alert').hide();

var idCliente = null;
var nome = null;
var telefone = null;
var title = null;
$('#edit-modal').on('show.bs.modal', function(event) {
	$('#alertE').hide();
	var button = $(event.relatedTarget) // Button that triggered the modal
	 title = button.data('title')
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
	let acao = title
	acao = acao == "Editar" ? 'Editado' : 'Cadastrado'
	idCliente = $('#id-edit').val();
	nome = $('#nome').val();
	telefone = $('#telefone').val();
	if (!nome) {
		alertError("Campo nome não pode ser vazio", 'alert alert-danger');
	} else {
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
				$.get("clientes", function(responseXml) {
					$("#start").html($(responseXml).find("data").html());
				});
				$('#table').DataTable();
				alertBootstrap("Cliente " + acao , 'alert alert-success', "Sucesso")
			}, error: function() {
				$('#edit-modal').modal('hide')
				alertBootstrap("Ocorreu um erro", 'alert alert-danger', "Ops..")
			}
		});
	}
})
