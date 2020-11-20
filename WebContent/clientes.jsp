<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>


<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Clientes</title>

<link rel="stylesheet" href="src/css/alert.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style type="text/css">

	.card{
		 border-radius: 1em !important;
	}

	body {

	background-color: #e6e9f0;
	}
	
	table{
	 background-color: #f8f9fa;}
	
	#navbar {
	box-shadow: 0.5rem 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
}

#seccond-navbar {
	height: 5%; 
	box-shadow: 0.5rem 0.5rem 1rem 0 rgba(0, 0, 0, 0.08);
}

</style>

</head>
<body>
			        <header>
                                <nav class="navbar navbar-expand navbar-dark bg-primary" id="navbar">
                                    <a class="navbar-brand" href="home.jsp"><i class="fas fa-arrow-left fa-md"></i></a>

                                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample02" aria-controls="navbarsExample02" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

                                    <div class="collapse navbar-collapse" id="navbarsExample02">
                                        <ul class="navbar-nav mr-auto">
                                            <li class="nav-item">
                                                <a class="nav-link" href="home.jsp"> <i class="fas fa-home fa-sm"></i> Home</a>
                                            </li>
                                            <li class="nav-item active">
                                                <a class="nav-link" href="#"><i class="fas fa-user fa-md"></i> Clientes </a>
                                            </li>
                                            <li class="nav-item ">
                                                <a class="nav-link" href="canecas"><i class="fas fa-mug-hot fa-sm"></i> Canecas </a>
                                            </li>
                                        </ul>
                                    </div>
                           
                                        <button type="button" class="btn btn-outline-light" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <!-- botao user -->
										    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
										 	 <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"/>
											  <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
										 	 <path fill-rule="evenodd" d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"/>
											</svg>
								  </button>


                                    <div class="dropdown-menu dropdown-menu-right" style="border-radius: 1em;">
                                        <a class="dropdown-item" href="my-account?action=view"> <i class="fas fa-user-circle"></i> Minha Conta </a>
                                        <a class="dropdown-item" href="estatisticas"> <i class="fas fa-chart-pie"></i> Estatísticas</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="logout"><i class="fas fa-sign-out-alt"></i>Logout</a>
                                    </div>
                                </nav>


                            </header>

                            <!-- 2navbar -->

                            <div class="navbar navbar-expand navbar-dark justify-content-end" id="seccond-navbar">
                                <ul class="nav justify-content-end">


                                    <li class="nav-item">
                                        <div class="container" style="height: 50px;">

                                            <button type="submit" id="btn-novo-cliente" data-toggle="modal" data-title="Cadastrar" class="btn btn-success" data-target="#edit-modal"> <i class="fas fa-user-plus"></i> Novo Cliente </button>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            
                            
<!-- ALERT -->
			<div class="fixed-top">
				<div class="alert alert-success" id="success-alert">
				   <button type="button" class="close" onclick="$('.alert').hide();">x</button>
				   <h4 id="titulo"></h4> <p id="alertMsg"></p>
				</div>
			</div>
			
<div class="container mt-5">

        
 <data id="start">
                            <!--  INICIO TABELA  -->
                            <div class="table-responsive">
                                <table class="table" id="tabela" style="
                                 border: 0;
								  border-radius: 1rem;
								  box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);" >

                                    <thead>
                                        <tr class="text-primary">
                                            <th scope="col" class="text-center">Nome</th>
                                            <th scope="col">Telefone</th>
                                            <th scope="col">Editar</th>
                                            <th scope="col">Excluir</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <c:forEach items="${clientes}" var="cliente">
                                            <tr>
                                                <td data-label="Nome">
													<a class="btn btn-light" href="canecas?action=select&clientId=${cliente.id}"
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
                                                </td>

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
                            </div>
          </data> 

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
                        

<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>

<script src="src/js/alert.js"></script>
<script src="src/js/util/mask.min.js"></script>
<script src="src/js/ajax/edit.save.cliente.js"></script>
<script src="src/js/ajax/excluirCliente.js"></script>

<script type="text/javascript">
$('.alert').hide();
</script>


 <script type="text/javascript">
            var behavior = function (val) {
                   return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
                },
              options = {
                            onKeyPress: function (val, e, field, options) {
                                field.mask(behavior.apply({}, arguments), options);
                            }
                        };

                        $('#telefone').mask(behavior, options);
</script>

</body>

</html>