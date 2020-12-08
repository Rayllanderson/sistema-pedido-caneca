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



<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="src/css/main.css">



<link rel="stylesheet" href="src/css//nucleo.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">

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
	
	.icon {
    width: 3rem;
    height: 3rem;
}
	
	.icon-shape {
    display: inline-flex;
    padding: 12px;
    text-align: center;
    border-radius: 50%;
    align-items: center;
    justify-content: center;
}
	
		
		.bg-gradient-light {
    background: linear-gradient(87deg, #adb5bd 0, #adaebd 100%) !important;
}

.bg-gradient-dark {
    background: linear-gradient(87deg, #212529 0, #212229 100%) !important;
}

.bg-gradient-default {
    background: linear-gradient(87deg, #172b4d 0, #1a174d 100%) !important;
}

.bg-gradient-white {
    background: linear-gradient(87deg, #fff 0, white 100%) !important;
}

.bg-gradient-neutral {
    background: linear-gradient(87deg, #fff 0, white 100%) !important;
}

.bg-gradient-darker {
    background: linear-gradient(87deg, black 0, black 100%) !important;
}

.bg-gradient-blue {
    background: linear-gradient(87deg, #5e72e4 0, #825ee4 100%) !important;
}

.bg-gradient-indigo {
    background: linear-gradient(87deg, #5603ad 0, #9d03ad 100%) !important;
}

.bg-gradient-purple {
    background: linear-gradient(87deg, #8965e0 0, #bc65e0 100%) !important;
}

.bg-gradient-pink {
    background: linear-gradient(87deg, #f3a4b5 0, #f3b4a4 100%) !important;
}

.bg-gradient-red {
    background: linear-gradient(87deg, #f5365c 0, #f56036 100%) !important;
}

.bg-gradient-orange {
    background: linear-gradient(87deg, #fb6340 0, #fbb140 100%) !important;
}

.bg-gradient-yellow {
    background: linear-gradient(87deg, #ffd600 0, #beff00 100%) !important;
}

.bg-gradient-green {
    background: linear-gradient(87deg, #2dce89 0, #2dcecc 100%) !important;
}

.bg-gradient-teal {
    background: linear-gradient(87deg, #11cdef 0, #1171ef 100%) !important;
}

.bg-gradient-cyan {
    background: linear-gradient(87deg, #2bffc6 0, #2be0ff 100%) !important;
}

.bg-gradient-white {
    background: linear-gradient(87deg, #fff 0, white 100%) !important;
}

.bg-gradient-gray {
    background: linear-gradient(87deg, #8898aa 0, #888aaa 100%) !important;
}

.bg-gradient-gray-dark {
    background: linear-gradient(87deg, #32325d 0, #44325d 100%) !important;
}		

.text-white {
    color: #fff !important;
}		

.shadow {
    box-shadow: 0 0 2rem 0 rgba(136, 152, 170, .15) !important;
}

.rounded-circle,
.avatar.rounded-circle img {
    border-radius: 50% !important;
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
        <nav id="sidebar" class="bg-white">
    <div class="sidebar-header">
                <h3>Lar do presente perfeito</h3>
            </div>

            <ul class="list-unstyled components">
                <p>SideBar</p>
                <li>
                     <a href="#" > <i class="fas fa-home fa-sm"></i> Home</a>
				</li>
				
                <li>
                     <a href="#clienteSubmenu" class="dropdown-toggle"  data-toggle="collapse"><i class="fas fa-user fa-md"></i> Clientes </a>
                      <ul class="collapse list-unstyled" id="clienteSubmenu">
                        <li>
                            <a href="clientes?action=all">Todos</a>
                        </li>
                        <li>
                            <a href="clientes">Pedidos Realizados</a>
                        </li>
                        <li>
                            <a href="clientes?action=without-order">Pedidos não realizados</a>
                        </li>
                    </ul>
                </li>
                
                
                <li>
                   <a href="#canecaSubmenu" class="dropdown-toggle"  data-toggle="collapse"><i class="fas fa-mug-hot fa-sm"></i> Canecas </a>
                   <ul class="collapse list-unstyled" id="canecaSubmenu">
                        <li>
                            <a href="canecas?action=all">Todas</a>
                        </li>
                        <li>
                            <a href="canecas?action=today">Entregas para hoje</a>
                        </li>
                    </ul>
                </li>
                
                <li>
                   <a href="temas"><i class="fas fa-palette"></i> Temas </a>
                </li>     
                 <li>
                   <a href="account"><i class="fas fa-user-cog"></i> Conta </a>
                </li>  
                <li class="nav-item">
			                   <a href="entregas" class="nav-link"><i class="fas fa-truck"></i> Entregas </a>
              	</li>                  
                
            </ul>

        </nav>




        <div id="content">
            <!-- Main content -->


            <nav class="navbar navbar-dark bg-primary" id="navbar2" style="color:white">

                <a class="navbar-brand" href="#"> <i class="fas fa-coffee"></i></a>
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
            </nav>




                  <!-- Header -->
        <div class="header bg-primary" style="padding-bottom: 11.5em!important">
            <div class="container-fluid">
                <div class="header-body">
                    <div class="row align-items-center py-4">
                        <div class="col-lg-6 col-7">
                            <button type="button" id="sidebarCollapse" class="btn btn-neutral">
                                <i class="fas fa-align-left"></i>
                             </button>
                        </div>

                    </div>
                    <!-- Card stats -->
                    <div class="col" style="margin-top: 5em">
                    <div class="card-deck">
                        <div class="col-xl-4 col-md-6">
                            <div class="card card-stats">
                                <!-- Card body -->
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <h5 class="card-title text-uppercase text-muted mb-0">Clientes</h5>
                                            <span class="h2 font-weight-bold mb-0"> <a class="btn text-primary" href="clientes?action=all" style="width: 115%"> Todos </a></span>
                                            <hr style="width: 120%">
                                            <span class="h2 font-weight-bold mb-0"> <a class="btn text-primary" href="clientes" style="width: 115%"> Pedidos realizados </a></span>
                                            <hr style="width: 120%">
                                            <span class="h2 font-weight-bold mb-0"> <a class="btn text-primary" href="clientes?action=without-order" style="width: 115%"> Pedidos não realizados </a></span>
                                        </div>
                                        <div class="col-auto">
                                            <div class="icon icon-shape bg-gradient-red text-white rounded-circle shadow">
                                              <i class="fas fa-users"></i>
                                            </div>
                                        </div>
                                    </div>
                                     <p class="mt-3 mb-0 text-sm">
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6">
                            <div class="card card-stats">
                                <!-- Card body -->
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <h5 class="card-title text-uppercase text-muted mb-0">Canecas</h5>
                                            <span class="h2 font-weight-bold mb-0">  <a class="btn text-primary" href="canecas?action=all" style="width: 115%">Todas </a></span>
                                            <hr style="width: 120%">
                                            <span class="h2 font-weight-bold mb-0">  <a class="btn text-primary" href="canecas?action=today" style="width: 115%">Entregar Hoje </a></span>
                                             <hr style="width: 120%">
                                            <span class="h2 font-weight-bold mb-0"> &nbsp; </span>
                                        </div>
                                        <div class="col-auto">
                                            <div class="icon icon-shape bg-gradient-orange text-white rounded-circle shadow">
                                               <i class="fas fa-coffee"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <p class="mt-3 mb-0 text-sm">
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6">
                            <div class="card card-stats">
                                <!-- Card body -->
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <h5 class="card-title text-uppercase text-muted mb-0">Ferramentas</h5>
                                            <span class="h2 font-weight-bold mb-0"> <a class="btn text-primary" href="account" style="width: 115%"> Conta </a></span>
                                            <hr style="width: 120%">
                                            <span class="h2 font-weight-bold mb-0"> <a class="btn text-primary" href="temas" style="width: 115%"> Temas </a></span>
                                            <hr style="width: 120%">
                                            <span class="h2 font-weight-bold mb-0"> <a class="btn text-primary" href="entregas" style="width: 115%"> Entregas </a></span>
                                        </div>
                                        <div class="col-auto">
                                            <div class="icon icon-shape bg-gradient-green text-white rounded-circle shadow">
                                               <i class="fas fa-cogs"></i>
                                            </div>
                                        </div>
                                        <p class="mt-3 mb-0 text-sm">
                                    </div>
                                </div>
                        </div>
                    </div>
                    </div>
                </div>
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
<script src="src/js/util/sidebar.js"></script>

<script type="text/javascript">
$('.alert').hide();
</script>

</body>

</html>