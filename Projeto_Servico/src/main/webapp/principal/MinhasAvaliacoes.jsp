<%@page import="Model.ModelAnuncio"%>
<%@page import="Model.ModelLogin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PresTec</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/MinhasAvaliacoesStyle.css">
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
			<div class="col">
				<h2>Minha Avaliac�es</h2>
				<br />
				<h3>Selecione o anuncio:</h3>
			</div>
		</div>
	</div>

	<br />
	<br />
	<br />
	<br />
	<br />
	<br />

	<div class="container">
	<div id="tabela">
		<table class="table table-striped" id="tabelaResultado">
			<thead>
				<tr>
					<th scolpe="col">ID</th>
					<th scolpe="col">Titulo</th>
					<th scope="col">Servi�o</th>
					<th scope="col">Nota M�dia</th>
					<th scope="col">Ver Avalia��es</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach items="${modelAnuncios}" var="ma">
					<tr>
						<td><c:out value="${ma.id}"></c:out></td>
						<td><c:out value="${ma.titulo}"></c:out></td>
						<td><c:out value="${ma.servico}"></c:out></td>
						<td><c:out value="${ma.situacao}"></c:out></td>
						<td><a href="#"><button type="button" class="btn btn-primary">Ver Avalia��es</button></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

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