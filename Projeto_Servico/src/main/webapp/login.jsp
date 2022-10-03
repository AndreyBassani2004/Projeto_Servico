<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PresTec</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/loginStyle.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/Img/logo_superior.png" />
</head>
<body>

	<%@include file="/Componentes/header.jsp"%>

	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<div class="container">
		<div class="row">
			<div class="col"></div>
			<div class="col">
				<h1>Seja bem vindo!</h1>
			</div>
			<div class="col"></div>
		</div>
	</div>
	<br />
	<br />
	<br />
	<form action="<%=request.getContextPath()%>/ServletLogin" method="post"
		id="cadastroCliente">
		<div class="container">
			<div class="row">
				<div class="col">
					<label><b><i>Login:</i></b></label>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<input type="text" class="form-control"
						placeholder="Digite seu e-mail de login" name="login" id="login">
				</div>
			</div>
			<br /> <br />
			<div class="row">
				<div class="col">
					<label><b><i>Senha:</i></b></label>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<input type="password" class="form-control"
						placeholder="Digite sua senha" name="senha" id="senha">
				</div>
			</div>
			<br /> <br />
			<div class="row">

				<div class="col">
					<button type="submit"
						class="btn btn-success waves-effect waves-light">Acessar</button>
				</div>
			</div>
			<div class="row">
				<div class="col" style="color: red;">
					<spam>${msg}</spam>
				</div>
			</div>
		</div>

	</form>

	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />

	<%@include file="/Componentes/rodape.jsp"%>

</body>
</html>