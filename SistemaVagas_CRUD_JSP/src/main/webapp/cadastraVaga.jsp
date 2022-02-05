<%@ page language="java" contentType="text/html; charset=UTF-8" import="resolucao.Vaga"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastrar Vaga</title>

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
    <!--Header from the project-->
    <%--instancing my object while I don't do database connection  --%>

    <% Vaga vaga = new Vaga();%>
    <section>
        <div class="container mt-5">
            <div class="row">
            	<div class="col-md-12">
	                <form action="cadastroSucesso.jsp" method="post">
	                    <h4>Sistema de Controle de Vagas de Emprego</h4>
	                    <p class="lead">
	                        Inclusão de Vagas
	                    </p>
	                    <div class="form-group row">
	                        <label for="staticDescricao" class="col-sm-2 col-form-label">Descrição</label>
	                        <div class="col-sm-10">
	                          <input name="descricao" type="text"  class="form-control" id="staticDescricao" required >
	                          <% if(vaga.vazio() != true){out.println(vaga.getDescricao());} %>
	                        </div>
	                    </div>
	
	                    <div class="form-group row">
	                        <label for="staticRequisitosObrigatorios" class="col-sm-3 col-form-label">Requisitos Obrigatórios</label>
	                        <div class="col-sm-9">
	                          <input name="requisitosObrigatorios" type="text"  class="form-control" id="staticRequisitosObrigatorios" required>
	                        </div>
	                    </div>
	
	                    <div class="form-group row">
	                        <label for="staticRequisitosDesejaveis" class="col-sm-3 col-form-label">Requisitos Desejáveis</label>
	                        <div class="col-sm-9">
	                          <input name="requisitosDesejaveis" type="text"  class="form-control" id="staticRequisitosDesejaveis" required>
	                        </div>
	                    </div>
	
	                    <div class="form-group row">
	                        <label for="staticRemunerecao" class="col-sm-8 col-form-label">Remunereção</label>
	                        <div class="col-sm-4">
	                         
	                          <input name="remuneracao" 
	                          	
	                          	type="number" step="0.01" 
	                           class="form-control" id="staticRemunerecao" required>
	                        </div>
	                    </div>
	
	                    <div class="form-group row">
	                        <label for="staticBeneficios" class="col-sm-2 col-form-label">Benefícios</label>
	                        <div class="col-sm-10">
	                          <input name="beneficios" type="text"  class="form-control" id="staticBeneficios" required>
	                        </div>
	                    </div>
	
	                    <div class="form-group row">
	                        <label for="staticLocalTrabalho" class="col-sm-3 col-form-label">Local de Trabalho</label>
	                        <div class="col-sm-9">
	                          <input name="localTrabalho" type="text"  class="form-control" id="staticLocalTrabalho" required >
	                        </div>
	                    </div>
	                          
	
	                    <button type="submit" class="btn btn-dark btn-block mt-4">Enviar</button>
						
						
	                  
	                  </form>
	               
					
                 </div>
            </div>
        </div>
        

      
    </section>













    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</body>

</html>