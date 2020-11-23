<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>


<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=0.9">

<title>Home</title>

<link rel="stylesheet" href="src/css/alert.css">


<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="src/css/main.css">

<style type="text/css">

	.card{
		 border-radius: 0.5em !important;
	}

	body {
	background-color: #e6e9f0;
	}
	

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
                     <a class="nav-link active" href="#"> <i class="fas fa-home fa-sm"></i> Home</a>
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
 <g></g></svg></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                      <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" href="#"> <i class="fas fa-home fa-sm"></i> Home</a>
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
                <div class="container mt-5" >
                    <div class="row row-cols-1 row-cols-md-1">
                        <div class="col">
                        	<div class="card-deck">
                            	<div class="card" >
                            	<img src="https://image.flaticon.com/icons/png/512/33/33308.png" class="card-img-top p-4" >
                            		<div class="card-body">
   										 <h4 class="card-title text-center">Clientes</h4>
                            		</div>
                            		 <ul class="list-group list-group-flush">
    									<li class="list-group-item"> <a class="btn text-primary" href="clientes?action=all" style="width: 100%"> Todos </a></li>
    									<li class="list-group-item"> <a class="btn text-primary" href="clientes" style="width: 100%"> Pedidos realizados </a></li>
    									<li class="list-group-item"> <a class="btn text-primary" href="clientes?action=without-order" style="width: 100%"> Pedidos não realizados </a></li>
    								</ul>
                            	</div> <!-- fim card -->
                            	
                            	<div class="card" >
                            	<img src="https://image.flaticon.com/icons/svg/3260/3260686.svg" class="card-img-top p-4" >
                            		<div class="card-body">
   										 <h4 class="card-title text-center">Canecas</h4>
                            		</div>
                            		 <ul class="list-group list-group-flush">
    									<li class="list-group-item"> <a class="btn text-primary" href="canecas?action=all" style="width: 100%">Todas </a></li>
    									<li class="list-group-item"> <a class="btn text-primary" href="canecas?action=today" style="width: 100%">Canecas Para Hoje </a></li>
    									<li class="list-group-item"> <a class="btn text-primary" style="width: 100%">Canecas sem pedido </a></li>
    								</ul>
                            	</div> <!-- fim card -->
                            	
                            	<div class="card" >
                            	<img src="https://www.flaticon.com/svg/static/icons/svg/96/96586.svg" class="card-img-top p-4" >
                            		<div class="card-body">
   										 <h4 class="card-title text-center">Temas</h4>
                            		</div>
                            		 <ul class="list-group list-group-flush">
    									<li class="list-group-item"> <a class="btn text-primary" style="width: 100%">Listar Temas </a></li>
    									<li class="list-group-item"> <a class="btn text-primary" style="width: 100%"> Cadastrar tema</a></li>
    									<li class="list-group-item"> <a class="btn text-primary" style="width: 100%"> Excluir Tema</a></li>
    								</ul>
                            	</div> <!-- fim card -->	
                            	
                            	<div class="card" >
                            	<img src="https://www.flaticon.com/svg/static/icons/svg/64/64722.svg" class="card-img-top p-4" >
                            		<div class="card-body">
   										 <h4 class="card-title text-center">Configurações</h4>
                            		</div>
                            		 <ul class="list-group list-group-flush">
    									<li class="list-group-item"> <a class="btn text-primary" style="width: 100%">Configurações da conta</a></li>
    									<li class="list-group-item"> <a class="btn text-primary" style="width: 100%"> Cadastrar novo login</a></li>
    									<li class="list-group-item"> <a class="btn text-primary" style="width: 100%"> Informações Gerais </a></li>
    								</ul>
                            	</div> <!-- fim card -->															
						</div> <!--  row -->
		  			 </div> <!-- fim col -->
				</div> <!-- fim row -->


                </div> <!-- fim container -->
        </div>
        </div>
        
        </div>
        

	<div class="mt-4 mb-4"></div>

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