<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/loginStyle.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
	<%@include file="/Componentes/header.jsp"%>

	<div id="linha1"></div>

	<div id="titulo">
		<h1>Seja bem vindo!</h1>
	</div>

	<div id="linha1"></div>

	<div id="formulario">
		<form action="ServletLogin" method="post"
			id="cadastroCliente">
			<input type="hidden" value = "<%= request.getParameter("url") %>" name = "url">
			<table id="tabelafrom1">
				<tr>
					<td>
						<div id="textcampo">
							<p>
								<b>Usuário:</b>
							</p>
							<input type="text" class="form-control"
								placeholder="Digite seu login" name="login" id="login">
						</div>
					</td>
				</tr>
				<tr>
					<td><div id="textcampo">
							<p>
								<b>Senha:</b>
							</p>
							<input type="password" class="form-control"
								placeholder="Digite sua senha" name="senha" id="senha">
						</div></td>
				</tr>
			</table>
			<div id="linha1"></div>
			<div id="spam">
				<spam>${msg}</spam>
			</div>
			<div id="button">

				<button type="submit"
					class="btn btn-success waves-effect waves-light">Acessar</button>
			</div>
		</form>
	</div>

	<div id="linha2"></div>


	<%@include file="/Componentes/rodape.jsp"%>


</body>
</html>