<%@page import="Model.ModelAnuncio"%>
<%@page import="Model.ModelLogin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
				<h2>Minha Avaliacões</h2>
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
					<th scope="col">Serviço</th>
					<th scope="col">Nota Média</th>
					<th scope="col">Ver Avaliações</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach items="${modelAnuncios}" var="ma">
					<tr>
						<td><c:out value="${ma.id}"></c:out></td>
						<td><c:out value="${ma.titulo}"></c:out></td>
						<td><c:out value="${ma.servico}"></c:out></td>
						<td><c:out value="${ma.situacao}"></c:out></td>
						<td><a href="<%=request.getContextPath()%>\ServletCarregarRequisicao?acao=carregarVisualizacaoAnuncio&id_user=<%= session.getAttribute("id")%>&paginar=0&id_anuncio=${ma.id}"><button type="button" class="btn btn-primary">Ver Avaliações</button></a></td>
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

	<div style="width: 100%;">
	<%@include file="/Componentes/rodape.jsp"%>
	</div>
</body>
</html>