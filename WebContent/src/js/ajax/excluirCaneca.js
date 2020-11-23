$('.alert').hide();
var clienteId = null;
var id1 = null;
$('#exampleModalCenter').on('show.bs.modal', function(event) {
	var button = $(event.relatedTarget)
	id1= button.data('canecaId') // Extract info from data-* attributes
	clienteId = button.data('clienteId')
	
});

$('#btn-delete').on('click', function() {
	const queryString = window.location.search;
	$.ajax({
		method: "GET",
		url: "canecas?action=delete",
		data: { 'canecaId': id1 },
		success: function() {
			$('#exampleModalCenter').modal('hide')
			alertBootstrap("Caneca Excluída com Sucesso!", 'alert alert-success', "Sucesso")
			$.get("canecas" + queryString, function(responseXml) {        
				$("#start").html($(responseXml).find("data").html()); 
			});
		}, error: function() {
			$('#exampleModalCenter').modal('hide')
			alertBootstrap("Ocorreu um erro ao deletar", 'alert alert-danger', "Ops..")
		}
	});

})