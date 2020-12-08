$("#form").submit(function(e) {

    e.preventDefault(); // avoid to execute the actual submit of the form.

    var form = $(this);
    
    $.ajax({
		method: "POST",
		url: "login",
		data: form.serialize(),
		success: function() {
			window.location.replace("home.jsp")
		}, error: function() {
			alert('Usuário ou senha inválidos')
		}
	});
    
});