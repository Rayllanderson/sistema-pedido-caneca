

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