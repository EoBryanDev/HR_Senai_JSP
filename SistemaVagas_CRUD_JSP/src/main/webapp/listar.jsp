<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
    
<%@ page import="resolucao.Vaga" %>
<%@ page import="resolucao.Banco" %>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vagas - Abertas</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

</head>

<body>

  <!--Header from the project-->
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="index.jsp">Sistema de Controle de Vagas de Emprego</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
              <ul class="navbar-nav">
                <li class="nav-item ">
                  <a class="nav-link" href="cadastraVaga.jsp">Cadastrar</a>
                </li>
                             
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-expanded="false">
                    Lista Vagas
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="listar.jsp?lista=1">Lista de vagas abertas</a>
                    <a class="dropdown-item" href="listar.jsp?lista=0">Lista de vagas encerradas</a>
                    <a class="dropdown-item" href="listar.jsp">Lista geral de vagas</a>
                  </div>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#"> <img class="text-white" src="img/login.png" alt="Login" width="20"> Login</a>
                </li>
				</ul>
            </div>
          </nav>
    </header>
   
	<section>
	 <br><br><br><br>
	 <div class="container">
        <div class="row">
            <div class="col-md-6">
                <table class="table">
                    <thead>
                      <tr>
                        <th scope="col">#Id</th>
                        <th scope="col">Descrição</th>
                        <th scope="col">Requisitos Obrigatorios</th>
                        <th scope="col">Requisitos Desejaveis</th>
                        <th scope="col">Remuneração</th>
                        <th scope="col">Beneficios</th>
                        <th scope="col">Local de Trabalho</th>
                        <th scope="col">Aberta</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                      </tr>
                    </thead>
                    <%
                    
                    Banco bd = new Banco();
                    
                    try{
						int lista = Integer.parseInt(request.getParameter("lista"));
	                    //fechada
	                    if(lista == 0){
	                    	out.println(bd.listar(0));
	                    	//aberta
	                    }else if(lista == 1){
	                    	out.println(bd.listar(1));
	                    	//todas
	                    }else{
	                    	out.println(bd.listar(2));
	                    }
                    }catch(Exception e){
                    	out.println(bd.listar(2));
                    }
					
						

					%>
                    </table>
            </div>
        </div>
    </div>
			            
	
	</section>
    









    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</body>

</html>