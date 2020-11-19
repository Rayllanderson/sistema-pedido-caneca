<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>


<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=0.95">

<title>Pedidos</title>

<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Droid+Sans:400,700" rel="stylesheet">
<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet" href="src/css/alert.css">
<link rel="stylesheet" href="src/css/dropzone.min.css">
<link rel="stylesheet" href="src/css/caneca.css">
<link rel="stylesheet" href="src/css/thumbnail-gallery.css">
<script src="src/js/caneca-util.js"></script>
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
<div class="card p-2">
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">

			
			<h1 class="font-weight-light text-center text-lg-left mt-4 mb-0">Caneca</h1>
			<input type="text" style="display: none" id="id" name="id" value="${caneca.id}">
			<hr class="mt-2 mb-5">

    <div class="row">
  			  <div class="col-md-5 mb-3">
	            <label for="validationCustom04">Tema</label>
				<select class="custom-select" id="temas" name="tema-id" required disabled>
				<option selected value="">Selecione o tema</option>
				<c:forEach items="${temas}" var="tema">
					<option id="tema-id"  value="${tema.id}"> 
						${tema.nome}
					</option>
				</c:forEach>
				</select>
              </div>
    
      <div class="col-md-5 mb-3">
      <label for="validationDefault04">Etapa</label>
      <select class="custom-select" id="etapa" required name="etapa-id">
        <option value="1">PEDIDO_REALIZADO</option>
        <option value="2">ESCOLHA</option>
        <option value="3">ALTERACAO</option>
        <option value="4">MODELO_ESCOLHIDO</option>
        <option value="5">PRODUCAO</option>
        <option value="6">PRONTO_ENTREGA</option>
        <option value="7">FINALIZADO</option>
      </select>
      
      <div class="mt-1 d-flex">
	      <a class="justify-content-start" id="preview">Etapa anterior</a>
	      <a class="ml-auto" id="next">Próxima Etapa</a>
       </div>
    </div>
    
     <div class="col-md-1 mb-4">
	     <label for="numberExample">Quantidade</label>
		<input type="number" id="qtd" class="form-control" style="width: 80px; text-align: center" min="1" max="9999" value="${caneca.quantidade}" name="quantidade" required disabled>
    </div>
   </div><!-- fim row -->
   
   
  <div class="mb-3 p-1">
     <label class="control-label">Descrição</label>
    <textarea class="form-control input-group" id="text-area" rows="3" name="descricao" disabled></textarea>
  </div>

   <!--  ----------------- botoes --------------- -->
   <div class="mt-3 form-group">
   		<button class="btn btn-primary btn-md mr-1" id="edit" type="button">Editar</button>
   		<button class="btn btn-success btn-md" id="save">Salvar</button>
   </div>





<data id="start">
<div class="testee"></div>
<hr class="mt-5 mb-2">
<h1 class="font-weight-light text-center text-lg-left mt-0 mb-1">Arquivos ${size}</h1>
<div class="row">
<div class="row text-center text-lg-left">
	<div class="tz-gallery">
		<div class="row">
 <c:forEach items="${arquivos}" var="arquivo">
	  <div id="col-size" class="col-sm-6 col-md-4">
	       <div class="thumbnail">
	          <img src="${arquivo.miniatura}" class="img-fluid">
				 <div class="caption">
	                 <h3 class="mb-3">${arquivo.nome}</h3>
	                  <span class="mb-3">${arquivo.fileSize}</span>
	                  <div class="d-flex justify-content-end">
	                     <div class="icon" title="Download">
	                         <a href="file?action=download&id=${arquivo.id}">
	                             <i class="fas fa-download fa-lg"></i>
	                         </a>
	                       </div>
	                       <div class="icon ml-2">
	                          <a href="javascript:void(0)" onclick="deleteImage('${arquivo.id}')" class="text-danger" title="Excluir">
	                              <i class="fas fa-times-circle fa-lg"></i>
	                          </a>
							</div>
	                   </div>
	             </div>
	        </div>
       </div>
  </c:forEach>
         <script type="text/javascript">
       	var size = '${size}'
       	changeClassGalery(size)
       </script>
    			</div>
		</div>
    </div> <!-- fim galery -->
    </div>
</data>

   
<form action="file?action=upload" method="post" class="dropzone" id="upload">
	  <div class="fallback">
	  <div class="dz-message needsclick">
	    <button type="button" class="dz-button">Drop files here or click to upload.</button><br>
	  </div>
	    <input name="file" type="file" multiple />
	  </div>
	  </form>
  <div class="mt-5 mb-3"></div>
  
</div> <!-- fim col --> 
</div> <!-- fim row --> 
</div>
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





<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>
<script src="src/js/dropzone.min.js"></script>
<script src="src/js/alert.js"></script>
<script src="src/js/ajax/excluirImagem.js"></script>
<script src="src/js/ajax/loadMiniature.js"></script>
<script src="src/js/edit-caneca.js"></script>
<script src="src/js/ajax/updateCaneca.js"></script>


<script type="text/javascript">
$('#text-area').val("${caneca.descricao}")
var tema = "${caneca.tema.id}"
var etapa = "${caneca.etapa}"
$('#temas').val(tema);
setEtapa(etapa)	
checkSelectValue();
</script>
</body>
</html>