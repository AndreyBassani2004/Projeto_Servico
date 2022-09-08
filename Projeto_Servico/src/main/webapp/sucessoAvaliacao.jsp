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
	href="<%=request.getContextPath()%>/css/cadastroSuc.css">
	 <link rel="icon" type="image/png" href="<%= request.getContextPath() %>/Img/logo_superior.png"/>
	
</head>
<body>
 	<%@include file="/Componentes/header.jsp"%>
 	<div id="text">
 	<h1>Avaliação efetuado com sucesso!</h1>
 	<br><br>
 	<h3>Voltar ao inicio</h3>
 	<br><br>
 	<a href="<%=request.getContextPath()%>/index.jsp"><button type="button" class="btn btn-success waves-effect waves-light">Inicio</button></a>
 	</div>
 	
 	<%@include file="/Componentes/rodape.jsp"%>
</body>
</html>