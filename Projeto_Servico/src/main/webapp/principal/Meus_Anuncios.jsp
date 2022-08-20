<%@page import="Model.ModelAnuncio"%>
<%@page import="Model.ModelLogin"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>PresTec</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/principal/css/meus_anuncios.css">
</head>
<body>
	<%@include file="/principal/Componente/header2.jsp"%>

	<div id="linha2"></div>
	<div id="titulo">
		<h1>Anuncios</h1>
		<h2>Edite o anuncio</h2>
		<br></br>
		<h5>
			<spam>${msg}</spam>
		</h5>
	</div>
	<div id="linha1"></div>
	<div id="tabela">
		<table class="table table-striped" id="tabelaResultado">
			<thead>
				<tr>
					<th scolpe="col">ID</th>
					<th scolpe="col">Titulo</th>
					<th scope="col">Serviço</th>
					<th scope="col">Situação</th>
					<th scope="col">Ver/Editar</th>
					<th scope="col">Excluir</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${modelAnuncios}" var="ma">
					<tr>
						<td><c:out value="${ma.id}"></c:out></td>
						<td><c:out value="${ma.titulo}"></c:out></td>
						<td><c:out value="${ma.servico}"></c:out></td>
						<td><c:out value="${ma.situacao}"></c:out></td>
						<td><a
							href="<%=request.getContextPath()%>\ServletCarregaAnuncio?acao=carregarAnuncio&id_anuncio=${ma.id}&id=<%= session.getAttribute("id")%>"><button
									type="button" class="btn btn-primary">Ver/Editar</button></a></td>
						<td><a
							href="<%=request.getContextPath()%>\ServletCarregaAnuncio?acao=deletarajax&id=${ma.id}&id_user=<%= session.getAttribute("id")%>"><button
									type="button" class="btn btn-danger">Excluir</button></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
	<div id="linha1"></div>

	<%@include file="/Componentes/rodape.jsp"%>

	<script type="text/javascript">
		
	</script>
</body>
</html>