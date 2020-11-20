
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
		data: { id1: id1 },
		success: function() {
			$('#exampleModalCenter').modal('hide')
			alertBootstrap("Cliente Excluído com Sucesso!", 'alert alert-success', "Sucesso")
			$.get("clientes", function(responseXml) {        
				$("#start").html($(responseXml).find("data").html()); 
			});
		}, error: function() {
			$('#exampleModalCenter').modal('hide')
			alertBootstrap("Ocorreu um erro ao deletar", 'alert alert-danger', "Ops..")
		}
	});

})