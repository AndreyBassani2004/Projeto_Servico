<%@page import="Model.ModelAvaliacao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PresTec</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/principal/css/valida1Style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>

	<%@include file="/principal/Componente/header2.jsp"%>

	<br/><br/><br/><br/><br/><br/>

	<div class="container">
		<h1 style="text-align: center;">Avaliações para validar</h1>
	</div>

	<br/><br/><br/>
	<div id="linha1"></div>

	<div class="container">
		<div id="tabela">
			<table class="table table-striped" id="tabelaResultado">
				<thead>
					<tr>
						<th scolpe="col">ID</th>
						<th scolpe="col">Cliente</th>
						<th scolpe="col">Titulo</th>
						<th scope="col">Estado</th>
						<th scope="col">Ver</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${modelAvaliacaos}" var="ma">
						<tr>
							<td><c:out value="${ma.id}"></c:out></td>
							<td><c:out value="${ma.nome_cliente}"></c:out></td>
							<td><c:out value="${ma.titulo}"></c:out></td>
							<td><c:out value="${ma.estado}"></c:out></td>
							<td><a
								href="<%=request.getContextPath()%>/ServletAvaliarAvaliacao?acao=carregarAvaliacao&id_anuncio=${ma.id}&id_user=<%= session.getAttribute("id")%>"><button
										class="btn btn-primary">Ver</button></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<nav aria-label="Page navigation example" style="">
			<ul class="pagination">
				<%
				int totalPagina = (int) request.getAttribute("totalPagina");

				for (int p = 0; p < totalPagina; p++) {
					String url = request.getContextPath() + "/ServletCarregarRequisicao?acao=carregarAvaliacoes&id_user="
					+ request.getSession().getAttribute("id") + "&paginar=" + (p * 5);
					out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"" + url + "\">" + (p + 1) + " </a></li>");
				}
				%>
			</ul>
		</nav>
	</div>




	<br/><br/><br/><br/><br/><br/>

	<%@include file="/Componentes/rodape.jsp"%>

</body>
</html>