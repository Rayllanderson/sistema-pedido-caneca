<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>


<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=0.9">

<title>Temas</title>

<link rel="stylesheet" href="src/css/alert.css">


<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- JQuery -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="src/css/main.css">

<link
	href="https://unpkg.com/bootstrap-table@1.18.0/dist/bootstrap-table.min.css"
	rel="stylesheet">
<script
	src="https://unpkg.com/bootstrap-table@1.18.0/dist/bootstrap-table.min.js"></script>

<style type="text/css">
.card {
	border-radius: 0.5em !important;
}

body {
	background-color: #e6e9f0;
}

html, body {
	height: 100%;
}

@keyframes inputMove {
    0% {
        transform: translateX(5px);
    }
    25% {
        transform: translateX(-5px);
    }
    50% {
        transform: translateX(5px);
    }
    75% {
        transform: translateX(-5px);
    }
    100% {
        transform: translateX(0px);
    }
}

.edit-animation{
 	animation-name: inputMove;
    animation-duration: .5s;
}

</style>

</head>
<body>

	<!-- ALERT -->
	<div class="fixed-top">
		<div class="alert alert-success" id="success-alert">
			<button type="button" class="close" onclick="$('.alert').hide();">x</button>
			<h4 id="titulo"></h4>
			<p id="alertMsg"></p>
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
						<li class="nav-item"><a class="nav-link" href="home.jsp">
								<i class="fas fa-home fa-sm"></i> Home
						</a></li>
						<li class="nav-item"><a class="nav-link" href="clientes"><i
								class="fas fa-user fa-md"></i> Clientes </a></li>
						<li class="nav-item"><a class="nav-link" href="canecas"><i
								class="fas fa-mug-hot fa-sm"></i> Canecas </a></li>
								
                 <li class="nav-item"><li>
                   <a href="#" class="nav-link"><i class="fas fa-palette"></i> Temas </a>
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


			<nav class="navbar navbar-dark bg-primary" id="navbar2" style="color: white">

				<a class="navbar-brand" href="home.jsp"> <i class="fas fa-coffee"></i> </a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarTogglerDemo02"
					aria-controls="navbarTogglerDemo02" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
					<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
						<li class="nav-item"><a class="nav-link" href="home.jsp">
								<i class="fas fa-home fa-sm"></i> Home
						</a></li>
						<li class="nav-item"><a class="nav-link" href="clientes"><i
								class="fas fa-user fa-md"></i> Clientes </a></li>
						<li class="nav-item"><a class="nav-link" href="canecas"><i
								class="fas fa-mug-hot fa-sm"></i> Canecas </a></li>
								                            
                        <li class="nav-item">
			                   <a href="#" class="nav-link"><i class="fas fa-palette"></i> Temas </a>
			            </li>    
			                
			            <li class="nav-item">
			                   <a href="account" class="nav-link"><i class="fas fa-user-cog"></i> Conta </a>
              			</li>
              			<li class="nav-item active">
			                   <a href="entregas" class="nav-link"><i class="fas fa-truck"></i> Entregas </a>
              			</li> 
					</ul>
				</div>
			</nav>


			<div class="main-content" id="panel">

				<nav
					class="navbar navbar-top navbar-expand navbar-dark border-bottom bg-primary" 
					>
					<div class="container-fluid">
						<div class="navbar-brand">
							<button type="button" id="sidebarCollapse"
								class="btn btn-neutral">
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
								<div class="col-lg-6 col-7"></div>
								<div class="col-lg-6 col-5 text-right"></div>
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
								<div class="col mt-1" >
									<div class="form-group" >
										<label for="themeName" class="col-form-label" >Adicionar Forma de Entrega: </label>
										 <input type="text" class="form-control" id="entregaName" placeholder="Nome">
										  <input type="text" class="form-control" id="entregaId" style="display: none">
										  <div id="infos" style="display: none">
											  <p id="textTema"  style="display: inline;"></p> 
											  <a style="display: inline; cursor: pointer" class="ml-3" id="clearValues"><i class="fas fa-times"></i></a>
										  </div>
									</div>
									<button type="button" id="saveEntrega" class="btn btn-primary mb-4">Savar
									</button>
								</div>
								<data id="start"> <!--  INICIO TABELA  -->
								<div class="table-responsive">
									<table id="themeTable" data-toggle="table"
										data-show-toggle="true" data-search="true"
										data-show-columns="true"
										data-toolbar="#toolbar" data-search-accent-neutralise="true"
										data-search-align="left" data-pagination="true"
										data-pagination-h-align="left"
										data-pagination-detail-h-align="right">
										<thead>
											<tr>
												<th data-field="name">Nome</th>
												<th scope="col" >Editar</th>
												<th scope="col" >Excluir</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${entregas}" var="entrega">
												<tr>
													<td>${entrega.nome}</td>

													<td data-label="Editar">
														<button class="editar btn btn-outline-info"
															data-id="${entrega.id}"
															data-nome="${entrega.nome}"
															style="box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);" onclick="editar(this)">
															<svg width="1em" height="1em" viewBox="0 0 16 16"
																class="bi bi-pen-fill" fill="currentColor"
																xmlns="http://www.w3.org/2000/svg">
							<path fill-rule="evenodd"
																	d="M13.498.795l.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001z" />
						</svg>
														</button>
													</td>

													<td data-label="Excluir">
														<button class="btn btn-outline-danger" data-toggle="modal"
															data-target="#exampleModalCenter" data-id="${entrega.id}">
															<svg width="1em" height="1em" viewBox="0 0 16 16"
																class="bi bi-x-circle-fill" fill="currentColor"
																xmlns="http://www.w3.org/2000/svg">
						<path fill-rule="evenodd"
																	d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z" />
					</svg>

														</button>
													</td>

												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<script> $('#themeTable').bootstrapTable();</script>
								<script>$('.fixed-table-toolbar').css('padding', '10px')</script>
								</data>
							</div>
						</div>
					</div>
				</div>
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
       	Você tem certeza que deseja remover esta forma de entrega?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-danger" id="btn-delete">Excluir</button>
      </div>
    </div>
  </div>
</div>



	<!-- Bootstrap tooltips -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>

	<!-- Popper.JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
		integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
		crossorigin="anonymous"></script>
	<!-- Jquery custom scrollbar -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

	<script src="src/js/alert.js"></script>
	<script src="src/js/ajax/edit.save.entrega.js"></script>
	<script src="src/js/util/sidebar.js"></script>
	<script src="src/js/ajax/excluirEntrega.js"></script>

	<script type="text/javascript">
		$('.alert').hide();
	</script>

<script>$('.fixed-table-toolbar').css('padding', '10px')</script>
	<script>
		
	function editar(element){
			$('#entregaName').removeClass('edit-animation')
			$('#entregaName').focus();
			$('#infos').css('display', 'block')
			
			var entregaId= $(element).attr("data-id");
			var entregaNome = $(element).attr("data-nome");
			$('#entregaName').val(entregaNome);
			$('#entregaName').addClass('edit-animation')
			$('#entregaName').attr("auto-focus", true);
			$('#entregaId').val(entregaId);
			$('#textTema').html('Editando: ' + entregaNome )
		}
	
	</script>
</body>

</html>