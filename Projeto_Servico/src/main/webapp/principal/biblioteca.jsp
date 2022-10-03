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
				<h1>Biblioteca do sistema</h1>
			</div>
			<br /> <br /> <br />
			<div class="row">
				<h5>Administradores</h5>
				<hr style="background-color: #F3F3F3; padding: 0.05em; width: 100%;">
			</div>
			<div class="row">
				<a href="<%=request.getContextPath()%>\principal\cadastroUser.jsp">Cadastra
					usuário Administrador</a><br />
			</div>
			<div class="row">
				<a
					href="<%=request.getContextPath()%>\ServletGerenciarConta?acao=carregarUsuariosAdms&id_user=<%=session.getAttribute("id")%>&paginar=0">Usuários
					Adminstradores</a>
			</div>
			<br /> <br /> <br /> <br />
			<div class="row">
				<h5>Gerenciar Banimentos</h5>
				<hr style="background-color: #F3F3F3; padding: 0.05em; width: 100%;">
			</div>
			<div class="row">
				<a href="<%=request.getContextPath()%>/ServletGerenciarSistema?acao=carregarAnunciosBanido&id_user=<%=session.getAttribute("id")%>&paginar=0">Gerenciar Anuncios Banido</a><br />
			</div>
			<div class="row">
				<a href="<%=request.getContextPath()%>/ServletGerenciarSistema?acao=carregarPerfilPrestsBanido&id_user=<%=session.getAttribute("id")%>&paginar=0">Gerenciar Perfil de prestadores Banido</a><br />
			</div>
			<!--  
			<br /> <br /> <br /> <br />
			<div class="row">
				<h5>Mensagens</h5>
				<hr style="background-color: #F3F3F3; padding: 0.05em; width: 100%;">
			</div>
			<div class="row">
				<a href="#">Gerenciar Mensagens De Alerta Enviado</a><br />
			</div>-->
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