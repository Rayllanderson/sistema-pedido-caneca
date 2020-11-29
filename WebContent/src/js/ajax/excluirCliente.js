
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
		}, error: function() {
			$('#exampleModalCenter').modal('hide')
			alertBootstrap("Ocorreu um erro ao deletar", 'alert alert-danger', "Ops..")
		}
	});

})


var queryString = window.location.search;
if (queryString == "?action=without-order"){
	$('#deleteAll').show();
}else{
	$('#deleteAll').hide();
}

$('#btn-delete-all-cliente').on('click', function() {
	$.ajax({
		method: "GET",
		url: "clientes?action=delete-all",
		success: function() {
			$('#exampleModalCenter2').modal('hide')
			alertBootstrap("Todos os clientes foram excluídos", 'alert alert-success', "Sucesso", 1000)
			$.get("clientes" + queryString, function(responseXml) {
				$("#start").html($(responseXml).find("data").html());
			});
		}, error: function() {
			$('#exampleModalCenter2').modal('hide')
			alertBootstrap("Ocorreu um erro ao deletar", 'alert alert-danger', "Ops..")
		}
	});

})

