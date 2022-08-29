<%@page import="Model.ModelDenunciaAnuncio"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PresTec</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>\principal\css\ProvidenciaDenStyle.css">
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
				<h1>Denuncias aprovadas</h1>
				<h2><i>Providencia a ser tomada</i></h2>
			</div>
		</div>
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
						<th scope="col">Motivo</th>
						<th scope="col">Estado</th>
						<th scope="col">Ver</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${modelDenunciaAnuncios}" var="md">
						<tr>
							<td><c:out value="${md.id}"></c:out></td>
							<td><c:out value="${md.nome_cliente}"></c:out></td>
							<td><c:out value="${md.motivo}"></c:out></td>
							<td><c:out value="${md.situacao}"></c:out></td>
							<td><a href="#"><button class="btn btn-primary">Ver</button></a></td>
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
					String url = request.getContextPath() + "/ServletCarregarRequisicao?acao=carregarDenunciasAprovada&id_user="
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