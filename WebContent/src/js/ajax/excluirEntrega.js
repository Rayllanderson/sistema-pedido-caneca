$('.alert').hide();

var id1 = null;
$('#exampleModalCenter').on('show.bs.modal', function(event) {
	var button = $(event.relatedTarget)
	id1 = button.data('id')
});

$('#btn-delete').on('click', function() {
	console.log(id1)
	$.ajax({
		method: "GET",
		url: "entregas?action=delete",
		data: { 'id': id1 },
		success: function() {
			$('#exampleModalCenter').modal('hide')
			alertBootstrap("Entrega Excluída com Sucesso!", 'alert alert-success', "Sucesso")
			$.get("entregas", function(responseXml) {
				$("#start").html($(responseXml).find("data").html());
			});
		}, error: function(e) {
			$('#exampleModalCenter').modal('hide')
			alertBootstrap(e.responseText, 'alert alert-danger', "Ops..")
		}
	});

})