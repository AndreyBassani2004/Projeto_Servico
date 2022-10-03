<%@page import="Model.ModelLogin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PresTec</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/principal/css/biblioteStyle.css">
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
			<div class="row">
				<h2>Perfil Banido</h2>
				<hr style="background-color: #F3F3F3; padding: 0.05em; width: 100%;">
			</div>
			<br /> <br />
			<div class="row">
				<div class="col">
					<label>ID do usuário:</label> <input type="text" name="id" id="id"
						class="form-control" value="${modelLogin.id}" readonly="readonly"> <br />
					<br /> <label>Email de usuário:</label> <input type="text"
						name="id" id="id" class="form-control" value="${modelLogin.login}"
						readonly="readonly"> <br /> <br />
				</div>
				<div class="col">
					<label>Nome do usuário:</label> <input type="text" name="id"
						id="id" class="form-control" value="${modelLogin.nome}" readonly="readonly">
					<br /> <br /> <label>Estado da conta:</label> <input type="text"
						name="id" id="id" class="form-control" value="${modelLogin.situacao_user}"
						readonly="readonly"> <br /> <br />
				</div>
			</div>
			<div class="row">
				<hr style="background-color: #F3F3F3; padding: 0.05em; width: 100%;">
			</div>

			<div class="row">
				<div class="col"></div>
				<div class="col">
					<span style="color: green;">${msg}</span>
				</div>
				<div class="col">
					<a href="<%=request.getContextPath()%>/ServletGerenciarSistema?acao=AtivarPerfil&id_user=<%=session.getAttribute("id")%>&id=${modelLogin.id}"><button type="submit" class="btn btn-success">Ativar</button></a>
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