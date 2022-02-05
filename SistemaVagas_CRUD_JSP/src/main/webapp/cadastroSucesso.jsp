<%@ page language="java" contentType="text/html; charset=UTF-8"
	 pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="resolucao.Banco" %>
<%@ page import="resolucao.Vaga" %>

<%
	DecimalFormat df = new DecimalFormat("#,##0.00");
	Vaga vaga = new Vaga();
	
	//exibidos
	String desc = request.getParameter("descricao");
	String ro = request.getParameter("requisitosObrigatorios");
	String rd = request.getParameter("requisitosDesejaveis");
	Float rem = Float.parseFloat(request.getParameter("remuneracao"));
	String ben = request.getParameter("beneficios");
	String lt = request.getParameter("localTrabalho");
	
	//completando a classe
	vaga.setDescricao(request.getParameter("descricao"));
	vaga.setRequisitosObrigatorios(request.getParameter("requisitosObrigatorios"));
	vaga.setRequisitosDesejaveis(request.getParameter("requisitosDesejaveis"));
	/* Não estou conseguindo transformar de String para float "An exception occurred processing [/cadastraVaga.jsp] at line [120]"
	float re = Float.parseFloat(request.getParameter("remuneracao"));
	vaga.remuneracao = re; */

	/*ele só funciona com formato String */
	vaga.setRemuneracao(rem);
	vaga.setBeneficios(request.getParameter("beneficios"));
	vaga.setLocalTrabalho(request.getParameter("localTrabalho"));
	
	//perdurar no bd
	Banco bd = new Banco();
	bd.inserir(vaga);
	
	%>
	
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">

</head>

<body>

	<!--Header from the project-->
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="index.jsp">Sistema de Controle de
				Vagas de Emprego</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item "><a class="nav-link"
						href="cadastraVaga.jsp">Cadastrar</a></li>
					
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
					<li class="nav-item"><a class="nav-link" href="#"> <img
							class="text-white" src="img/login.png" alt="Login" width="20">
							Login
					</a></li>
				</ul>
			</div>
		</nav>
	</header>
	<!--Header from the project-->

	
	
	
	
	<section>
	<div class="container">
		<div class="row mt-4">
			<div class="col-md text-center">
				<%
				if (vaga.vazio() != true) {
				%>

				<h2 class="text-left">Registro cadastrado com sucesso!</h2>
				<hr>

				<table class="table table-borderless table-sm">
					<tbody>

						<tr>
							<td class="text-center">Descrição</td>
							<td class="text-primary text-center">
								<%
								out.print(desc);
								%>
							</td>
						</tr>
						<tr>
							<td class="text-center">Requisitos Obrigatórios</td>
							<td class="text-primary text-center">
								<%
								out.print(ro);
								%>
							</td>
						</tr>
						<tr >
							<td class="text-center">Requisitos Desejáveis</td>
							<td class="text-primary text-center">
								<%
								out.print(rd);
								%>
							</td>
						</tr>
						<tr>
							<td class="text-center ">Remuneração</td>
							<td class="text-primary text-center">
								<%
								out.print("R$ " + df.format(rem));
								%>
							</td>
						</tr>
						<tr>
							<td class="text-center">Benefícios</td>
							<td class="text-primary text-center">
								<%
								out.print(ben);
								%>
							</td>
						</tr>
						<tr>
							<td class="text-center">Local de Trabalho</td>
							<td class="text-primary text-center">
								<%
								out.print(lt);
								%>
							</td>
						</tr>


					</tbody>
					
				</table>
				<a class="btn btn-lg bg-success text-white" href="cadastraVaga.jsp">Voltar</a>
				<br>
				<br>
				<span class="text-success font-weight-bold mt-4">Vaga incluida com
					sucesso!</span>
				<%
				}
						%>
				<script>
			        var timer = setTimeout(function() {
			            window.location='listar.jsp'
			        }, 3000);
				</script>
				<% bd.inserir(vaga); %>
			</div>
		</div>
		</div>

		



	</section>