

$('#saveTheme').on('click', function() {
	const id = $('#themeId').val();
	const name = $('#themeName').val();
	if (!name) {
		alertBootstrap("Campo nome não pode ser vazio", 'alert alert-danger');
	} else {
		$.ajax({
			method: "POST",
			url: "temas",
			data: {
				'id': id,
				'nome': name
			},
			success: function() {
				alertBootstrap("Done", 'alert alert-success', "Sucesso")
				$.get("temas", function(responseXml) {
					$("#start").html($(responseXml).find("data").html());
				});
			}, error: function() {
				alertBootstrap("Ocorreu um erro", 'alert alert-danger', "Ops..", 2000)
			}
		});
	}
})
