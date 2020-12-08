<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="src/js/fa.js"></script>

<title>Bem vindo</title>

<style type="text/css">

html,
body{
 height: 100%;
}
	
	
	body{
		background-color: #f8f9fa;
	}
	
	
	
	#cover {
	  background: #222 url(https://jooinn.com/images/stars-at-night-20.jpg) center center no-repeat;
	    background-size: cover;
	    height: 100%;
	    text-align: center;
	    display: flex;
	    align-items: center;
	    position: relative;
	    color: white;
	}

#cover-caption {
    width: 100%;
    position: relative;
    z-index: 1;
}
form:before {
    content: '';
    height: 100%;
    left: 0;
    position: absolute;
    top: 0;
    width: 100%;
    background-color: rgba(0,0,0,0.3);
    z-index: -1;
    border-radius: 10px;
}
	
</style>
</head>
<body>

	<section id="cover">
    <div id="cover-caption">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-sm-5">
                    <h1 class="display-3">Welcome!</h1>
 				<div class="info-form">
 				 <form action="login" id="form" class="form justify-content-center">
					<div class="form-group">
					    <label for="username">Login</label>
					    <input type="text" class="form-control" id="username" name="username" placeholder="Username">
					  </div>
					  <div class="form-group">
					    <label for="exampleInputPassword1">Password</label>
					    <input type="password" class="form-control" id="password" name="password" placeholder="Password">
					  </div>
					  <div class="form-group form-check">
					  </div>
					  <button type="submit" class="btn btn-primary">Login</button>
				</form>
               </div>
                <br>

                    <div class="mt-2" role="button">&nbsp;</div>
                </div>
            </div>
        </div>
    </div>
</section>
	
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
<script src="src/js/ajax/login.js"></script>

</body>


</html>