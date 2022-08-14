<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PresTec</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/cadastroSuc.css">
</head>
<body>
 	<%@include file="/Componentes/header.jsp"%>
 	<div id="text">
 	<h1>Cadastro efetuado com sucesso!</h1>
 	<br><br>
 	<h3>Entre em sua nova conta</h3>
 	<br><br>
 	<a href="<%= request.getContextPath() %>/ServletPrestadores?acao=login"><button type="button" class="btn btn-success waves-effect waves-light">Entrar</button></a>
 	</div>
 	
 	<%@include file="/Componentes/rodape.jsp"%>
</body>
</html>