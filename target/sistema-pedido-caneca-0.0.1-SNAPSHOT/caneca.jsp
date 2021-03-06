<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>


<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=0.95">

<title>Caneca</title>

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
 <nav id="sidebar" class="bg-white">
    <div class="sidebar-header">
                <h3>Lar do presente perfeito</h3>
            </div>

            <ul class="list-unstyled components">
                <p>SideBar</p>
                            <li class="nav-item">
                                <a class="nav-link" href="home.jsp"> <i class="fas fa-home fa-sm"></i> Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="clientes"><i class="fas fa-user fa-md"></i> Clientes </a>
                            </li>
                            <li class="nav-item active">
                               <a class="nav-link" href="canecas"><i class="fas fa-mug-hot fa-sm"></i> Canecas </a>
                            </li>
                
                <li>
                   <a href="temas"><i class="fas fa-palette"></i> Temas </a>
                </li>                
                
            </ul>

        </nav>


        <div id="content">
            <!-- Main content -->




            <div class="main-content" id="panel">

                <nav class="navbar navbar-top navbar-expand navbar-dark border-bottom bg-primary" style="color:white;">
                    <div class="container-fluid">
                        <div class="navbar-brand">
                            <button type="button" id="sidebarCollapse" class="btn btn-neutral">
                                <i class="fas fa-align-left"></i>
                             </button>
                        </div>
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
                             <li class="nav-item">
			                   <a href="temas" class="nav-link"><i class="fas fa-palette"></i> Temas </a>
			                </li>    
			                
			                 <li class="nav-item">
			                   <a href="account" class="nav-link"><i class="fas fa-user-cog"></i> Conta </a>
              				</li>
              				<li class="nav-item">
			                   <a href="entregas" class="nav-link"><i class="fas fa-truck"></i> Entregas </a>
              				</li>  
                        </ul>
                    </div>
                    </div>
                </nav>


                <!-- Header -->
                <div class="header bg-primary pb-6">
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
	                         <a href="file?action=download&id=${arquivo.id}" id="btn-download">
	                             <i class="fas fa-download fa-lg"></i>
	                         </a>
	                       </div>
	                       <div class="icon ml-2">
	                          <a href="javascript:void(0)" class="text-danger"
	                           data-toggle="modal" data-target="#exampleModalCenter" data-id="${arquivo.id}" 
	                           title="Excluir">
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
                        	</div>
                        </div>
                    </footer>
                </div>
            </div>
        </div>
</div>


	<!-- Modal confirmar remover arquivo -->
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
       	Você tem certeza que deseja remover este arquivo?
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
<script src="src/js/ajax/download-file.js"></script>
<script src="src/js/ajax/updateCaneca.js"></script>
<script src="src/js/util/sendMenssage.js"></script>
<script src="src/js/util/sidebar.js"></script>


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