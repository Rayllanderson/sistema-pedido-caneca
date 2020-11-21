
var id1 = null;
$('#exampleModalCenter').on('show.bs.modal', function(event) {
	var button = $(event.relatedTarget)
	var id = button.data('id') // Extract info from data-* attributes
	id1 = id;
});

$('#btn-delete-cliente').on('click', function() {
	$.ajax({
		method: "GET",
		url: "clientes?action=delete",
		data: { 'id': id1 },
		success: function() {
			$('#exampleModalCenter').modal('hide')
			alertBootstrap("Cliente Excluído", 'alert alert-success', "Sucesso")
			$.get("clientes", function(responseXml) {
				$("#start").html($(responseXml).find("data").html());
			});
			$('#table').DataTable();

		}, error: function() {
			$('#exampleModalCenter').modal('hide')
			alertBootstrap("Ocorreu um erro ao deletar", 'alert alert-danger', "Ops..")
		}
	});

})

