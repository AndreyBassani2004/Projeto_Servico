<%@page import="Model.ModelDenunciaAvaliacao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PresTec</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/principal/css/valida1Style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	 <link rel="icon" type="image/png" href="<%= request.getContextPath() %>/Img/logo_superior.png"/>
	
</head>
<body>

	<%@include file="/principal/Componente/header2.jsp"%>

	<br/><br/><br/><br/><br/><br/><br/><br/>

	<div class="container">
		<h1 style="text-align: center;">Avaliar Denuncia avaliações</h1>
		<span>${msg}</span>
	</div>
	
		<br/><br/><br/>
	<div id="linha1"></div>

	<div class="container">
		<div id="tabela">
			<table class="table table-striped" id="tabelaResultado">
				<thead>
					<tr>
						<th scolpe="col">ID</th>
						<th scolpe="col">Motivo</th>
						<th scope="col">Descrição</th>
						<th scope="col">Estado</th>
						<th scope="col">Ver</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${modelDenunciaAvaliacaos}" var="na">
						<tr>
							<td><c:out value="${na.id}"></c:out></td>
							<td><c:out value="${na.motivo}"></c:out></td>
							<td><c:out value="${na.descricao}"></c:out></td>
							<td><c:out value="${na.estado_denuncia}"></c:out></td>
							<td><a href="<%=request.getContextPath()%>/ServletCarregarRequisicao?acao=AvaliarDenunciaAvaliacao&id_anuncio=${na.id}&id_user=<%= session.getAttribute("id")%>&paginar=0"><button class="btn btn-primary">Ver</button></a></td>
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
					String url = request.getContextPath() + "/ServletCarregarRequisicao?acao=carregarDenunciaAvaliacoes&id_user="
					+ request.getSession().getAttribute("id") + "&paginar=" + (p * 5);
					out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"" + url + "\">" + (p + 1) + " </a></li>");
				}
				%>
			</ul>
		</nav>
		
	</div>
	
	<br/><br/><br/><br/><br/><br/><br/><br/>

	<%@include file="/Componentes/rodape.jsp"%>

</body>
</html>