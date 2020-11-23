<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>


<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=0.9">

<title>Clientes</title>

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

<style type="text/css">

	.card{
		 border-radius: 0.5em !important;
	}

	body {
	background-color: #e6e9f0;
	}
	
	table{
	 background-color: #fff;}
	

html, body{
    height: 100%;
							
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
                     <a class="nav-link active" href="clientes"><i class="fas fa-user fa-md"></i> Clientes </a>
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

                <a class="navbar-brand" href="#">
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
                                <a class="nav-link active" href="clientes"><i class="fas fa-user fa-md"></i> Clientes </a>
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
                                    <a href="#" class="btn btn-light" id="btn-novo-cliente" data-toggle="modal" data-title="Cadastrar" data-target="#edit-modal"> <i class="fas fa-user-plus"></i> &nbsp;Novo Cliente</a>
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

                                <div class="card-header border-0">
                                    <h3 class="mb-0">Clientes</h3>
                                </div>

 <data id="start">
                            <!--  INICIO TABELA  -->
                            <div class="table-responsive">
                                <table class="table" id="table"
                                 data-toggle="table" 
                                 data-show-toggle="true"
                                 data-search="true"
                                 data-pagination="true"
                                 data-show-columns="true"
                                 data-toolbar="#toolbar"
                                 data-search-accent-neutralise="true"
                                 data-search-align="left"
                                 data-pagination="true"
                                 data-pagination-h-align="left"
  								 data-pagination-detail-h-align="right"
                                 style=" border: 0;
								 box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);">

                                    <thead class="thead-light">
                                        <tr class="text-primary">
                                            <th scope="col" class="text-center" data-sortable="true" >Nome</th>
                                            <th scope="col" data-sortable="true" >Telefone</th>
                                            <th scope="col" data-visible="false" >Editar</th>
                                            <th scope="col" data-visible="false" >Excluir</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <c:forEach items="${clientes}" var="cliente">
                                            <tr>
                                                <td data-label="Nome">
                                                <input type="text" value="${cliente.id}" class="cliente-id" style="display: none;">
												<a id="btn-select" class="btn" href="javascript:void(0)" onclick="selectCliente(${cliente.id});"
												style="width: 100%; color: dodgerblue; border-radius: 1rem;">${cliente.nome}</a>
												</td>
                                                <td data-label="Telefone">${cliente.telefone}</td>

                                                <td data-label="Editar"><button
												class="btn btn-outline-info"
												data-toggle="modal" data-target="#edit-modal" 
												data-title="Editar"
												data-id="${cliente.id}" 
												data-nome="${cliente.nome}"
												data-telefone="${cliente.telefone}" style="
												box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);">
												
						 	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pen-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  <path fill-rule="evenodd" d="M13.498.795l.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001z"/>
							</svg>
							</button> </td>

                                                <td data-label="Excluir">
                                                <button class="btn btn-outline-danger" 
                                                 data-toggle="modal" data-target="#exampleModalCenter"
                                                 data-id="${cliente.id}">
						
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
        
        
	<!-- Modal confirmar remover cliente -->
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
       	Você tem certeza que deseja remover este cliente?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-danger" id="btn-delete-cliente">Excluir</button>
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
                                            <label for="recipient-name" class="control-label">Nome:</label>
                                            <input name="nome" type="text" class="form-control" id="nome" required maxlength="255" />
                                        </div>
                                        <div class="form-group">
                                            <label for="message-text" class="control-label">Telefone:</label>
                                            <input name="telefone" type="text" class="form-control" id="telefone" style="width: 50%" inputmode="numeric" maxlength="12" pattern="\([0-9]{2}\)[\s][0-9]{4}-[0-9]{4,5}">
                                        </div>
                                        <input name="id" class="form-control" id="id-edit" style="display: none">
                                        <button type="button" id="btn-edit-cliente" class="btn btn-success">&nbsp; Salvar &nbsp;</button>
                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
        
 </div> 



<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>

<!-- Popper.JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
<!-- Jquery custom scrollbar -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

<script src="src/js/alert.js"></script>
<script src="src/js/util/mask.min.js"></script>
<script src="src/js/ajax/edit.save.cliente.js"></script>
<script src="src/js/ajax/excluirCliente.js"></script>
<script src="src/js/ajax/selecionarClienteAjax.js"></script>
<script src="src/js/util/clientes.custom.table.js"></script>
<script src="src/js/util/sidebar.js"></script>
<script src="src/js/util/telefone.mask.js"></script>

<script type="text/javascript">
$('.alert').hide();
</script>

</body>

</html>