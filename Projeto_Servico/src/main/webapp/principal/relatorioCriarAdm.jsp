<%@page import="Model.ModelLogin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PresTec</title>
<link
	href="<%=request.getContextPath()%>/principal/css/cadastroUserAdm.css"
	rel="stylesheet" type="text/css">
<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/Img/logo_superior.png" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>

	<%@include file="/principal/Componente/header2.jsp"%>

	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<div class="container">
		<div class="row">
			<h2>Dados nova conta</h2>
			<br />
		</div>
		<div class="row">
			<h6 style="color: green;">Nova conta criado com sucesso!</h6>
		</div>
		<hr style="background-color: #F3F3F3; padding: 0.05em; width: 100%;">
		<div class="row">
			<div class="col">
				<label>Nome:</label> <input type="text" class="form-control"
					name="nome" id="nome" value="${modelLogin.nome}"
					readonly="readonly"> <br />
				<br /> <label>Email de login:</label> <input type="text"
					class="form-control" name="nome" id="nome"
					value="${modelLogin.login}" readonly="readonly"> <br />
				<br />
			</div>
			<div class="col">
				<label>Telefone:</label> <input type="text" class="form-control"
					name="nome" id="nome" value="${modelLogin.telefone}"
					readonly="readonly"> <br />
				<br /> <label>Senha para login:</label> <input type="text"
					class="form-control" name="nome" id="nome"
					value="${modelLogin.senha}" readonly="readonly"> <br />
				
			</div>
		</div>
		
		<div class="row">
			<hr style="background-color: #F3F3F3; padding: 0.05em; width: 100%;">
		</div>
		<br />
		<div class="row">
			<a href="#"><button type="button"
											class="btn btn-primary">Emitir <i>PDF</i> de registro</button></a>
		</div>

	</div>
	
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	
		<%@include file="/Componentes/rodape.jsp"%>
	

</body>
</html>