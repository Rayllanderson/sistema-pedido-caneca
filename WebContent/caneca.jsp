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
<link rel="stylesheet" href="src/css/main.css">
</head>
<body>

<!-- ALERT -->
			<div class="fixed-top">
				<div class="alert alert-success" id="success-alert">
				   <button type="button" class="close" onclick="$('.alert').hide();">x</button>
				   <h4 id="titulo"></h4> <p id="alertMsg"></p>
				</div>
			</div>
			
<div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>Bootstrap Sidebar</h3>
            </div>

            <ul class="list-unstyled components">
                <p>SideBar</p>
                <li>
                     <a class="nav-link" href="home.jsp"> <i class="fas fa-home fa-sm"></i> Home</a>
                </li>

                <li>
                     <a class="nav-link" href="clientes"><i class="fas fa-user fa-md"></i> Clientes </a>
                </li>
                <li>
                   <a class="nav-link" href="canecas"><i class="fas fa-mug-hot fa-sm"></i> Canecas </a>
                </li>
            </ul>

            <ul class="list-unstyled CTAs">
                <li>
                    <a href="https://bootstrapious.com/tutorial/files/sidebar.zip" class="download">Download source</a>
                </li>
            </ul>
        </nav>




        <div id="content">
            <!-- Main content -->


            <nav class="navbar navbar-dark" id="navbar2" style="  background-color: #34495e; color:white">

                <a class="navbar-brand" href="canecas">
                     <?xml version="1.0" encoding="iso-8859-1"?>
                        <!-- Generator: Adobe Illustrator 18.1.1, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
                        <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                             viewBox="0 0 482.754 482.754" style="enable-background:new 0 0 482.754 482.754;" xml:space="preserve" width="36px" height="36px" >
                        <g>
                            <g>
                                <g>
                                    <path d="M416.941,216.222H338.24v-36.324v-1.768H47.651v1.768v242.157v12.108h0.702c6.441,53.953,57.875,48.431,120.376,48.431
                                        h48.431c62.525,0,113.959,5.521,120.376-48.431h0.702v-12.108V347.64h78.701c10.05,0,18.162-7.87,18.162-17.629v-96.185
                                        C435.102,224.092,426.99,216.222,416.941,216.222z M410.887,310.203c0,7.313-6.756,13.222-15.135,13.222H338.24v-82.987h57.512
                                        c8.379,0,15.135,5.909,15.135,13.222V310.203z" style="fill: white;"/>
                                </g>
                                <g>
                                    <path d="M155.266,153.915l-7.555-9.468c8.136-6.514,27.993-26.686,22.327-41.554c-2.373-6.296-6.345-10.485-10.534-14.917
                                        c-5.158-5.449-10.994-11.599-13.851-21.939C138.46,40.004,167.713,4.02,171.055,0l9.299,7.749
                                        c-7.991,9.589-27.703,38.14-23.029,55.066c2.034,7.434,6.175,11.769,10.97,16.83c4.601,4.843,9.807,10.364,13.076,18.937
                                        C191.299,124.759,156.743,152.728,155.266,153.915z" style="fill: white;"/>
                                </g>
                                <g>
                                    <path d="M215.49,141.807l-7.555-9.468c4.746-3.802,17.605-16.66,14.263-25.402c-1.453-3.85-3.85-6.393-6.611-9.299
                                        c-3.584-3.802-7.676-8.112-9.71-15.474c-5.061-18.38,15.038-43.104,17.338-45.865l9.299,7.749
                                        c-7.144,8.572-17.508,25.62-14.965,34.871c1.235,4.456,3.705,7.047,6.829,10.364c3.196,3.39,6.829,7.216,9.154,13.319
                                        C240.554,121.103,218.081,139.749,215.49,141.807z" style="fill: white;"/>
                                </g>
                            </g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g></g><g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
                        <g>
                        </g>
<g>
</g>
<g>
 </g>
 <g></g></svg></a> </span>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                      <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" href="home.jsp"> <i class="fas fa-home fa-sm"></i> Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="clientes"><i class="fas fa-user fa-md"></i> Clientes </a>
                            </li>
                            <li class="nav-item">
                               <a class="nav-link" href="canecas"><i class="fas fa-mug-hot fa-sm"></i> Canecas </a>
                            </li>
                        </ul>
                    </div>
            </nav>


            <div class="main-content" id="panel">

                <nav class="navbar navbar-top navbar-expand navbar-dark border-bottom" style="background-color: #34495e;">
                    <div class="container-fluid">
                        <div class="navbar-brand">
                            <button type="button" id="sidebarCollapse" class="btn btn-neutral">
                                <i class="fas fa-align-left"></i>
                             </button>
                        </div>
                    </div>
                </nav>


                <!-- Header -->
                <div class="header pb-6" style="background-color:  #34495e;">
                    <div class="container-fluid">
                        <div class="header-body">
                            <div class="row align-items-center py-4">
                                <div class="col-lg-6 col-7">

                                </div>
                                <div class="col-lg-6 col-5 text-right">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>




                <!-- Page content -->
                <div class="container mt--6">
                    <div class="row d-flex justify-content-center">
                        <div class="col-md-9">
                            <div class="card">
                                <!-- Card header -->

                                <div class="card-header border-0 mb-3">
                                <div class="d-flex bd-highlight">
                                    <h3  class="p-2 flex-grow-1 bd-highlight" style="display: inline;">${cliente.nome}</h3>
                                    <h4 style="display: inline;"class="p-2 bd-highlight"><a href="javascript:void(0)" 
                                    data-toggle="modal"
                                    data-target="#messageModal" 
                                    data-telefone="${cliente.telefone}"
                                    data-nome="${cliente.nome}"><i class="fas fa-phone"></i>  ${cliente.telefone }</a></h4>
                                    </div>
                                </div>

<!-- AQ É COMO SE FOSSE A TABLE -->
	
	<div class="row">
		<div class="col-md-12">

			
			<h3 class="font-weight-light text-center text-lg-left mt-4 mb-0">Caneca</h3>
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




<script src="src/js/caneca-util.js"></script>
<data id="start">
<div class="testee"></div>
<hr class="mt-5 mb-2">
<h3 class="font-weight-light text-center text-lg-left mt-0 mb-1">Arquivos ${size}</h3>
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
</div> <!-- fim card -->



 
                    <!-- Footer -->
                    <footer class="footer pt-0">
                        <div class="row align-items-center justify-content-lg-between">
                            <div class="col-lg-6">
                                <div class="copyright text-center  text-lg-left  text-muted">
                                    &copy; 2020 <a href="https://www.creative-tim.com" class="font-weight-bold ml-1" target="_blank">Creative Tim</a>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <ul class="nav nav-footer justify-content-center justify-content-lg-end">
                                    <li class="nav-item">
                                        <a href="https://www.creative-tim.com" class="nav-link" target="_blank">Creative Tim</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="https://www.creative-tim.com/presentation" class="nav-link" target="_blank">About Us</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="http://blog.creative-tim.com" class="nav-link" target="_blank">Blog</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md" class="nav-link" target="_blank">MIT License</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </footer>
                </div>
            </div>
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



<div class="modal fade" id="messageModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Nova mensagem</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Destinatário:</label>
            <input type="text" class="form-control" id="telefoneMensagem">
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">Mensagem:</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="sendMsg">Enviar messagem</button>
      </div>
    </div>
  </div>
</div> <!-- fim modal mensagem -->


<!-- Bootstrap POPPER -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- Jquery custom scrollbar -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>



<script src="src/js/dropzone.min.js"></script>
<script src="src/js/alert.js"></script>
<script src="src/js/ajax/excluirImagem.js"></script>
<script src="src/js/ajax/loadMiniature.js"></script>
<script src="src/js/ajax/updateCaneca.js"></script>
<script src="src/js/sendMenssage.js"></script>

<script type="text/javascript">
$('#text-area').val("${caneca.descricao}")
var tema = "${caneca.tema.id}"
var etapa = "${caneca.etapa}"
$('#temas').val(tema);
setEtapa(etapa)	
checkSelectValue();
</script>
<script type="text/javascript">
$(document).ready(function() {
    $("#sidebar").mCustomScrollbar({
        theme: "minimal"
    });

    $('#sidebarCollapse').on('click', function() {
        $('#sidebar, #content').toggleClass('active');
        $('.collapse.in').toggleClass('in');
        $('a[aria-expanded=true]').attr('aria-expanded', 'false');
    });
});
</script>
</body>
</html>