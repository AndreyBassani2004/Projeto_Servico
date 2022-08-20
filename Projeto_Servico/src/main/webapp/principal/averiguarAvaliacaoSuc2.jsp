<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PresTec</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/principal/css/cadastroSuc.css">
</head>
<body>
		<%@include file="/principal/Componente/header2.jsp"%> 
 	<div id="text">
 	<h1>Operação Realizado com sucesso!</h1>
 	<br><br>
 	<h3></h3>
 	<br><br>
 	<a href="<%=request.getContextPath()%>\ServletCarregarRequisicao?acao=carregarAvaliacoes&id_user=<%= session.getAttribute("id")%>&paginar=0"><button type="button" class="btn btn-success waves-effect waves-light">Voltar</button></a>
 	</div>
 	
 	<%@include file="/Componentes/rodape.jsp"%>
</body>
</html>