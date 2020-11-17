<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>


<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Pedidos</title>

<link rel="stylesheet" href="src/css/alert.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Material Design Bootstrap -->
<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet"> -->

<style type="text/css">

	.card{
		 border-radius: 1em !important;
	}
	
 /*	.n-c{
		background-color: #28a745  !important;
	}
	
	 .f-p{
		background-color: #007bff  !important;
	}
	*/
	
	* {
  box-sizing: border-box;
}

.coluna {
  float: left;
  width: 33.33%;
  padding: 5px;
}

/* Clearfix (clear floats) */
.linha::after {
  content: "";
  clear: both;
  display: table;
}


</style>

</head>
<body>

<!-- ALERT -->
			<div class="fixed-top">
				<div class="alert alert-success" id="success-alert">
				   <button type="button" class="close" onclick="$('.alert').hide();">x</button>
				   <h4 id="titulo"></h4> <p id="alertMsg"></p>
				</div>
			</div>
<div class="container mt-5" >

<form >
<h1 class="font-weight-light text-center text-lg-left mt-4 mb-0">Caneca</h1>
<hr class="mt-2 mb-5">
  <div class="form-row">
    <div class="col-md-4 mb-4 mr-4">
     <label for="validationCustom04">Tema</label>
				      <select class="custom-select" id="temas" name="tema-id" required>
				        <option selected disabled value="">Selecione o tema</option>
				       	<c:forEach items="${temas}" var="tema">
							<option id="tema-id"  value="${tema.id}"> 
								${tema.nome}
							</option>
				    	 </c:forEach>
				      </select>
				     <div class="invalid-feedback">
				        Por favor, selecione uma opção
				      </div>
    </div>
    
    <div class="col-md-4 mb-4 mr-4">
      <label for="validationDefault04">Etapa</label>
      <select class="custom-select" id="etapa" required>
        <option value="1">PEDIDO_REALIZADO</option>
        <option value="2">ESCOLHA</option>
        <option value="3">ALTERACAO</option>
        <option value="4">MODELO_ESCOLHIDO</option>
        <option value="5">PRODUCAO</option>
        <option value="6">PRONTO_ENTREGA</option>
        <option value="7">FINALIZADO</option>
      </select>
    </div>
    
     <div class="col-md-1 mb-4">
	     <label for="numberExample">Quantidade</label>
		<input type="number" id="qtd" class="form-control" style="width: 80px; text-align: center" min="1" max="9999" value="${caneca.quantidade}" name="quantidade" required>
    </div>
    
   </div>
   
  <div class="form-row">
    <div class="col-md-4 mb-3">
    <label for="exampleFormControlTextarea1">Descrição</label>
    <textarea class="form-control" id="text-area" rows="3"></textarea>
   </div>
   </div>

<h1 class="font-weight-light text-center text-lg-left mt-4 mb-0">Arquivos</h1>

  <hr class="mt-2 mb-5">

  <div class="row text-center text-lg-left">

	<c:forEach items="${arquivos}" var="arquivo">
    <div class="col-lg-3 col-md-4 col-6">
      <a href="aaa?id=${arquivo.id}" class="d-block mb-4 h-100">
            <img class="img-fluid img-thumbnail" src="${arquivo.base64Html}">
          </a>
    </div>
    </c:forEach>
    </div>


  <button class="btn btn-primary" type="submit">Submit form</button>
</form>
		
		
</div>
     


	<!-- Modal confirmar remover caneca -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-danger" id="exampleModalLongTitle">Atenção <i class="fas fa-exclamation-triangle"></i></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	Você tem certeza que deseja remover esta caneca?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-danger" id="btn-delete">Excluir</button>
      </div>
    </div>
  </div>
</div>




<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
<script src="src/js/alert.js"></script>
<script type="text/javascript">
$('.alert').hide();
</script>
<script type="text/javascript">
$('#text-area').val("${caneca.descricao}")
var tema = "${caneca.tema.id}"
var etapa= "${caneca.etapa}"
$('#temas').val(tema);
setEtapa(etapa)

function setEtapa(etapa){
	var n = null;
	switch (etapa){
		case 'PEDIDO_REALIZADO':
			n = 1;
			break;
		case 'ESCOLHA':
			n = 2;
			break;
		case 'ALTERACAO':
			n = 3;
			break;
		case 'MODELO_ESCOLHIDO':
			n = 4;
			break;
		case 'PRODUCAO':
			n = 5;
			break;
		case 'PRONTO_ENTREGA':
			n = 6;
			break;
		case 'FINALIZADO':
			n = 7;
			break;
	}
	$('#etapa').val(n);
}


</script>
</body>

</html>