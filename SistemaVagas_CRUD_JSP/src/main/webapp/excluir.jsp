<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
    

<%@ page import="resolucao.Banco" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Excluir Vaga</title>
	</head>
	<body>
		<%
		int id = 0;
		try{
			id = Integer.parseInt(request.getParameter("id"));
			Banco bd = new Banco();
			bd.excluir(id);
		}catch(Exception e){
			
		}
		response.sendRedirect("listar.jsp");
		%>
	</body>
</html>