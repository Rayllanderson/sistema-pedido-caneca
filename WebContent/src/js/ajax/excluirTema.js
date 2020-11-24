$('.alert').hide();

var id1 = null;
$('#exampleModalCenter').on('show.bs.modal', function(event) {
	var button = $(event.relatedTarget)
	id1= button.data('id') // Extract info from data-* attributes
});

$('#btn-delete').on('click', function() {
	console.log(id1)
	$.ajax({
		method: "GET",
		url: "temas?action=delete",
		data: { 'id': id1 },
		success: function() {
			$('#exampleModalCenter').modal('hide')
			alertBootstrap("Tema Excluída com Sucesso!", 'alert alert-success', "Sucesso")
			$.get("temas", function(responseXml) {        
				$("#start").html($(responseXml).find("data").html()); 
			});
		}, error: function(e) {
			$('#exampleModalCenter').modal('hide')
			alertBootstrap(e.responseText, 'alert alert-danger', "Ops..")
		}
	});

})