$('.alert').hide();

var idCliente = null;
var username = null;
var pass = null;
var title = null;
$('#edit-modal').on('show.bs.modal', function(event) {
	$('#alertE').hide();
	var button = $(event.relatedTarget) // Button that triggered the modal
	 title = button.data('title')
	let id = button.data('id') // Extract info from data-* attributes
	let usernamee = button.data('username')
	let passw = button.data('pass')

	var modal = $(this)
	modal.find('.modal-title').text(title)
	modal.find('#id').val(id)
	modal.find('#username').val(usernamee)
	modal.find('#pass').val(passw)
})


$('#btn-save').on('click', function() {
	let acao = title
	acao = acao == "Editar" ? 'Editado' : 'Cadastrado'
	idCliente = $('#id').val();
	username = $('#username').val();
	pass = $('#pass').val();
	if (!username) {
		alertError("Campo nome não pode ser vazio", 'alert alert-danger');
	} else {
		$.ajax({
			method: "POST",
			url: "account?action=save",
			data: {
				'id': idCliente,
				'username': username,
				'password': pass
			},
			success: function() {
				$('#edit-modal').modal('hide')
				$.get("account", function(responseXml) {
					$("#start").html($(responseXml).find("data").html());
				});
				alertBootstrap("Admin " + acao , 'alert alert-success', "Sucesso")
			}, error: function() {
				$('#edit-modal').modal('hide')
				alertBootstrap("Ocorreu um erro", 'alert alert-danger', "Ops..")
			}
		});
	}
})


var id1 = null;
$('#exampleModalCenter').on('show.bs.modal', function(event) {
	var button = $(event.relatedTarget)
	id1 = button.data('id') // Extract info from data-* attributes
});
$('#btn-delete').on('click', function() {
	console.log(id1)
	$.ajax({
		method: "GET",
		url: "account?action=delete",
		data: { 'id': id1 },
		success: function() {
			$('#exampleModalCenter').modal('hide')
			alertBootstrap("Tema Excluída com Sucesso!", 'alert alert-success', "Sucesso")
			$.get("account", function(responseXml) {        
				$("#start").html($(responseXml).find("data").html()); 
			});
		}, error: function(e) {
			$('#exampleModalCenter').modal('hide')
			alertBootstrap(e.responseText, 'alert alert-danger', "Ops..")
		}
	});

})


$(document).ready(function() {
    $("#show_hide_password a").on('click', function(event) {
        event.preventDefault();
        if($('#show_hide_password input').attr("type") == "text"){
            $('#show_hide_password input').attr('type', 'password');
            $('#show_hide_password i').addClass( "fa-eye-slash" );
            $('#show_hide_password i').removeClass( "fa-eye" );
        }else if($('#show_hide_password input').attr("type") == "password"){
            $('#show_hide_password input').attr('type', 'text');
            $('#show_hide_password i').removeClass( "fa-eye-slash" );
            $('#show_hide_password i').addClass( "fa-eye" );
        }
    });
});
