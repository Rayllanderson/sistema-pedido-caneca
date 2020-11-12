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
	#img{
		 transition: transform .2s}
	
	#img:hover{
		 transform: scale(1.05);
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

<div class="container mt-5">

        
 <data id="start">
                            <!--  INICIO TABELA  -->
                            <div class="table-responsive" id="tabela-produtos">
                                <table class="table" id="tabela" style="
                                 border: 0;
								  border-radius: 1rem;
								  box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);" >

                                    <thead>
                                        <tr class="text-primary">
                                            <th scope="col" class="text-center">Nome</th>
                                            <th scope="col">Tema</th>
                                            <th scope="col">Quantidade</th>
                                         	<th scope="col">Etapa</th>
                                            <th scope="col">Editar</th>
                                            <th scope="col">Excluir</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <c:forEach items="${canecas}" var="caneca">
                                            <tr>
                                                <td data-label="Nome">
													<a class="btn btn-light" href="canecas?action=select&id=${caneca.id}"
													style="width: 100%; color: dodgerblue; border-radius: 1rem;">Caneca</a>
												</td>
												<td data-label="Tema">${caneca.tema}</td>
                                                <td data-label="Quantidade">${caneca.quantidade}</td>
                                                <td data-label="Etapa">${caneca.etapa}</td>

                                                <td data-label="Editar"><button class="btn btn-outline-info" data-toggle="modal" data-target="#exampleModal" data-title="Editar">

                                                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pen-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
													 <path fill-rule="evenodd" d="M13.498.795l.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001z"/>
													</svg>
                                                    </button>
                                                </td>


                                                <td data-label="Excluir"><button class="btn btn-outline-danger" 
                                                data-toggle="modal" data-target="#exampleModalCenter" 
					 							>
						
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


	<!-- Modal confirmar remover caneca -->
<div class="modal" id="edit-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
    	<p class="p-2 mt-1">Redirecionando...</p>
       	<button id="btn-edit" style="display: none"></button>
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
function getCellValues() {
    var refTab = document.getElementById("tabela")
    var totalRowCount = refTab.rows.length;
    for (var i = 0; i < totalRowCount; i++){
    	refTab[i].innerText = (i + 1);
    }
 }
 
getCellValues();

</script>
</body>

</html>