<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>


<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=0.9">

<title>Canecas</title>

<link rel="stylesheet" href="src/css/alert.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="https://unpkg.com/bootstrap-table@1.18.0/dist/bootstrap-table.min.css" rel="stylesheet">
<link rel="stylesheet" href="src/css/main.css">

<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!--sort JavaScript -->
<script src="https://unpkg.com/bootstrap-table@1.18.0/dist/bootstrap-table.min.js"></script>

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
                               <a class="nav-link" href="#"><i class="fas fa-mug-hot fa-sm"></i> Canecas </a>
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

        </nav>



        <div id="content">
            <!-- Main content -->


            <nav class="navbar navbar-dark bg-primary" id="navbar2" style=" color:white">

                <a class="navbar-brand" href="clientes">
                    <i class="fas fa-coffee"></i></a>
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
                            <li class="nav-item active">
                               <a class="nav-link" href="#"><i class="fas fa-mug-hot fa-sm"></i> Canecas </a>
                            </li>
                             <li class="nav-item">
			                   <a href="temas" class="nav-link"><i class="fas fa-palette"></i> Temas </a>
			                </li>    
			                
			                  <li class="nav-item ">
			                   <a href="#" class="nav-link"><i class="fas fa-user-cog"></i> Conta </a>
              				</li> 
              				<li class="nav-item">
			                   <a href="entregas" class="nav-link"><i class="fas fa-truck"></i> Entregas </a>
              				</li> 
                        </ul>
                    </div>
            </nav>


            <div class="main-content" id="panel">

                <nav class="navbar navbar-top navbar-expand navbar-dark border-bottom bg-primary">
                    <div class="container-fluid">
                        <div class="navbar-brand">
                            <button type="button" id="sidebarCollapse" class="btn btn-neutral">
                                <i class="fas fa-align-left"></i>
                             </button>
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
                        <div class="col">
                            <div class="card">
                                <!-- Card header -->

                                <div class="card-header border-0 mb-3">
                                <div class="d-flex bd-highlight">
                                    <h3  class="p-2 flex-grow-1 bd-highlight" style="display: inline;">Todas as Canecas</h3>
                                    </div>
                                </div>

         <div id="toolbar mt-3" style="padding: 10px; margin-bottom: -8px">
             <select class="form-control custom-select mr-1" id="filter-etapa" style="width: 200px;">
             	<option value="0">Escolha um filtro</option>
				<option value="1">PEDIDO_REALIZADO</option>
				<option value="2">ESCOLHA</option>
				<option value="3">ALTERACAO</option>
				<option value="4">MODELO_ESCOLHIDO</option>
				<option value="5">PRODUCAO</option>
				<option value="6">PRONTO_ENTREGA</option>
				<option value="7">FINALIZADO</option>
			</select>
        </div>
 <data id="start">
                            <!--  INICIO TABELA  -->
                            <div class="table-responsive-sm" id="tabela-produtos">
                                <table class="table" id="table"
                                 data-toggle="table" 
                                 data-search="true"
                                 data-show-columns="true"
                                 data-toolbar="#toolbar"
                                 data-custom-sort="customSort"
                                 data-search-accent-neutralise="true"
                                 data-search-align="left"
                                 data-pagination="true"
                                 data-pagination-h-align="left"
  								 data-pagination-detail-h-align="right"
  								 data-filter-control="true"
  								 data-detail-view="true"
 								 data-detail-formatter="detailFormatter"
                                 
                                 style="
                                 padding: 0;
                                 border: 0;
								 box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);" >
  			
                                    <thead>
                                        <tr class="text-primary">
                                            <th scope="col" class="text-center">Selecione</th>
                                         	<th scope="col" data-sortable="true" data-field="etapa">Etapa</th>
                                            <th scope="col" >Editar</th>
                                            <th scope="col" >Excluir</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                       <c:forEach items="${canecas}" var="caneca" varStatus="loop">
                                            <tr>
	                                                <td data-label="Nome" data-cliente="${caneca.cliente.nome}">
														<a id="btn-select" class="btn" href="caneca?action=select&id=${caneca.id}"
														style="width: 100%; color: dodgerblue; border-radius: 1rem;">Caneca</a>
													</td>
												
                                                <td data-label="Etapa" data-etapaid="${caneca.etapa.getCode()}" data-etapa="${caneca.etapa}">${caneca.etapa}</td>

                                                <td data-label="Editar" ><button class="btn btn-outline-info" 
                                                data-toggle="modal" id="edit-caneca" data-target="#edit-modal"
                                                data-title="Editar"
                                                data-id="${caneca.id}" data-tema="${caneca.tema.id}"
                                                data-etapa="${caneca.etapa}" data-qtd="${caneca.quantidade}" 
                                                data-desc="${caneca.descricao}" data-cliente-id="${caneca.cliente.id}">
												
                                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pen-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
												<path fill-rule="evenodd" d="M13.498.795l.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001z"/>
												</svg>
                                                </button>
                                                </td>

                                                <td data-label="Excluir"><button class="btn btn-outline-danger" 
                                                data-toggle="modal" data-target="#exampleModalCenter" data-clienteId="${caneca.cliente.id}" data-caneca-id="${caneca.id}" 
					 							>
						
											<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-x-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
											  <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"/>
											</svg>
						
											</button> </td>
                                            </tr>
                                		</c:forEach>  
                                		
                                    </tbody>
                                </table>
                          
              </div> <!-- fim table responsive -->
               <script> $('#table').bootstrapTable();</script>
               <script src="src/js/util/canecas.custom.table.js"></script>
               <script>
				  function detailFormatter(index, row) {
				    var html = []
				      html.push('<p><b> Nome do Cliente: </b> ' + row._0_data.cliente + '</p>')
				    return html.join('')
				  }
				</script> 
          </data> 
		</div> <!-- fim card -->

   </div> <!-- fim col -->
</div> <!-- fim row -->


 
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



 <!-- Tela Modal EDITAR/SALVAR-->

                        <div class="modal fade" id="edit-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </div>
                                    
                                      <div class="alert alert-success" id="alertE">
				   				 <button type="button" class="close" onclick="$('#alertE').hide();">x</button>
				   					<h4 id="titulo"></h4> <p id="alertMsgE"></p>
				  				 </div>
				  				 
                                    <div class="modal-body">
                                    
                                        <div class="form-group">
                                            <label for="recipient-name" class="control-label">Tema</label>
                                            <select class="custom-select" id="temas" name="tema-id" required disabled>
												<option selected value="">Selecione o tema</option>
												<c:forEach items="${temas}" var="tema">
													<option id="tema-id" value="${tema.id}"> 
														${tema.nome}
													</option>
												</c:forEach>
											</select>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="message-text" class="control-label">Etapa</label>
                                             <select class="custom-select" id="etapa" required name="etapa-id">
										        <option value="1">PEDIDO_REALIZADO</option>
										        <option value="2">ESCOLHA</option>
										        <option value="3">ALTERACAO</option>
										        <option value="4">MODELO_ESCOLHIDO</option>
										        <option value="5">PRODUCAO</option>
										        <option value="6">PRONTO_ENTREGA</option>
										        <option value="7">FINALIZADO</option>
										      </select>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="message-text" class="control-label">Quantidade</label>
                                            <input type="number" id="qtd" class="form-control" style="width: 80px; text-align: center" min="1" max="9999" name="quantidade" required disabled>
                                        </div>
                                         <div class="form-group">
                                            <label for="message-text" class="control-label">Descrição</label>
                                            <textarea class="form-control input-group" id="text-area" rows="3" name="descricao" disabled></textarea>
                                        </div>
                                         <div class="mt-3 mb-3 ml-1">
			                                        <div class="custom-control custom-switch d-flex justify-content-between">
			                                        	 <input type="checkbox" class="custom-control-input" id="customSwitch1">
			  											 <label class="custom-control-label" for="customSwitch1" id="text-switch">Habilitar Edição</label>
			  										</div>
		  										</div>
                                        <input name="id" class="form-control" id="id-edit" style="display: none">
		                                        <button type="button" id="btn-edit-caneca" class="btn btn-success mr-1">&nbsp; Salvar &nbsp;</button>      
		                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
	  										</div>
  										</div>
                                    </div>
                                </div> <!-- fim modal -->



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



<!-- Popper.JS -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- Jquery custom scrollbar -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>


<script src="src/js/caneca-util.js"></script>
<script src="src/js/alert.js"></script>
<script src="src/js/ajax/edit.save.caneca.js"></script>
<script src="src/js/ajax/excluirCaneca.js"></script>
<script src="src/js/util/sendMenssage.js"></script>
<script src="src/js/util/sidebar.js"></script>

<script type="text/javascript">
$('.alert').hide();
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