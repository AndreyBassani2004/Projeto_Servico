<%@page import="Model.ModelLogin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PresTec</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/principal/css/carregarDenAnuStyle.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/Img/logo_superior.png" />
</head>
<body>

	<%@include file="/principal/Componente/header2.jsp"%>

	<br />
	<br />
	<br />
	<br />
	<br />
	<br />

	<c:if test="${isAdmin}">

		<div class="container">
			<div class="row" style="align-items: center; text-align: center;">
				<div class="col">
					<h1>Administrador Dados</h1>
				</div>
			</div>
			<div class="row" style="align-items: center; text-align: center;">
				<div class="col">
					<span style="color: green;">${msg}</span>
				</div>
			</div>
		</div>

		<br />
		<br />
		<br />
		<br />

		<div class="container">
			<div class="row">
				<h5>Dados administrador</h5>
				<hr style="background-color: #F3F3F3; padding: 0.05em; width: 100%;">
			</div>
			<br /> <br />
			<div class="row">
				<div class="col">
					<label>ID:</label> <input type="text" name="id" id="id"
						value="${modelLogin.id}" class="form-control" readonly="readonly">
					<br /> <br /> <label>Situação:</label><br /> <input type="text"
						name="situacao" value="${modelLogin.situacao_user}" id="situacao"
						class="form-control" readonly="readonly"> <br /> <br />
				</div>
				<div class="col">
					<label>Nome:</label><br /> <input type="text" name="nome"
						value="${modelLogin.nome}" id="nome" class="form-control"
						readonly="readonly"> <br /> <br /> <label>Email:</label>
					<input type="text" name="email" value="${modelLogin.login}"
						id="email" class="form-control" readonly="readonly"> <br />
					<br />
				</div>
				<br /> <br />

			</div>
			<div class="row">
				<hr style="background-color: #F3F3F3; padding: 0.05em; width: 100%;">
			</div>
			<div class="row">
				<div class="col"></div>
				<div class="col">
					<a
						href="<%=request.getContextPath()%>/ServletGerenciarConta?acao=AtivarConta&id_user=<%=session.getAttribute("id")%>&id=${modelLogin.id}"><button
							class="btn btn-success waves-effect waves-light">Ativar</button></a>
				</div>
				<div class="col"></div>
				<div class="col">
					<a
						href="<%=request.getContextPath()%>/ServletGerenciarConta?acao=DesativarConta&id_user=<%=session.getAttribute("id")%>&id=${modelLogin.id}"><button
							class="btn btn-danger waves-effect waves-light">Desativar</button></a>
				</div>
				<div class="col"></div>

			</div>
		</div>
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
	</c:if>

	<c:if test="${perfil == 'PRESTADOR' || perfil == 'ADMIN' && !isAdmin}">
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<div class="container"
			style="align-items: center; text-align: center;">
			<h1>Função indisponivel</h1>
			<br> <a
				href="<%=request.getContextPath()%>/principal/principal.jsp">Voltar
				ao Inicio</a>
		</div>
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
	</c:if>

	<%@include file="/Componentes/rodape.jsp"%>


</body>
</html>