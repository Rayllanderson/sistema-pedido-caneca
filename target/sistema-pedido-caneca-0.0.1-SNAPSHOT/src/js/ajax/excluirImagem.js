

function deleteImage(id){
	$.ajax({
		method: "GET",
		url: "file?action=delete",
		data: { id: id },
		success: function() {
			$('#exampleModalCenter').modal('hide')
			alertBootstrap("Imagem Excluída", 'alert alert-success')
			$.get("file", function(responseXml) {        
				$("#start").html($(responseXml).find("data").html()); 
			});
		}, error: function() {
			$('#exampleModalCenter').modal('hide')
			alertBootstrap("Ocorreu um erro ao deletar", 'alert alert-danger', "Ops..")
		}
	});
}

var id = null;
$('#exampleModalCenter').on('show.bs.modal', function(event) {
	var button = $(event.relatedTarget) // Button that triggered the modal
	id = button.data('id') // Extract info from data-* attributes
})

$('#btn-delete').on('click', function(){
	deleteImage(id)
})