
function sendMessage(telefone, mensagem){
	telefone = telefone.replace("(", "").replace(")", "").replace("-", "").replace(" ", "");
	location.href = "https://wa.me/55" + telefone + "?text=" + mensagem.replace(" ", "%20");
}
var telefone = null;
var nome = null;
var mensagem = null;
$('#messageModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  telefone = button.data('telefone') 
	  nome = button.data('nome');
	  nome = nome.substring(0, 1).toUpperCase().concat(nome.substring(1));
	  
	  var modal = $(this)
	  modal.find('.modal-title').text('Nova mensagem para @' + nome)
	  modal.find('#telefoneMensagem').val(telefone);
	  modal.find('#message-text').text('Olá, ' + nome + ', ');
	  
	  
	})
	
	$('#sendMsg').on('click', function(){
		mensagem = $('#message-text').val();
		sendMessage(telefone, mensagem);
	})