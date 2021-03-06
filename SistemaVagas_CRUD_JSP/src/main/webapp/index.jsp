<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>

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
    <section>
    <div class="row"><img alt="" src="img/vagas.png" width="100%"></div>
      <div class="container mt-5">
      
      
      		
      	
      	
        <div class="row">
          <div class="col-md">
            <h1 class="display-2 text-center">Sistema de Cadastramento</h1>
            <p class="lead text-center">
                Oferecendo solu????es, oferecendo oportunidades!
            </p>
            <div class="row">
              <div class="col-md-6 text-right">
                <button class="btn btn-primary">Ver Vagas</button>
              </div>
              <div class="col-md-6 text-left">
                <button class="btn btn-success">Cadastrar-se</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>













    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</body>

</html>