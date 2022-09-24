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
	href="<%=request.getContextPath()%>/principal/css/usuarioADMStyle.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	 <link rel="icon" type="image/png" href="<%= request.getContextPath() %>/Img/logo_superior.png"/>
	
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
			<div class="col" style="align-items: center; text-align: center;">
				<h1>Gerenciar conta Administradores</h1>
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
					<th scolpe="col">Nome</th>
					<th scope="col">Email</th>
					<th scope="col">Estado</th>
					<th scope="col">Ver Conta</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach items="#" var="ma">
					<tr>
						<td><c:out value="#"></c:out></td>
						<td><c:out value="#"></c:out></td>
						<td><c:out value="#"></c:out></td>
						<td><c:out value="#"></c:out></td>
						<td><c:out value="#"></c:out></td>			
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
	<nav aria-label="Page navigation example" >
			<li class="pagination"><a class="page-link" href="#">1</a></li>
			<ul class="pagination">
				<%
				//int totalPagina = (int) request.getAttribute("totalPagina");

				//for (int p = 0; p < totalPagina; p++) {
				//	String url = request.getContextPath() + "/ServletCarregarRequisicao?acao=carregarDenuncias&id_user="
				//	+ request.getSession().getAttribute("id") + "&paginar=" + (p * 5);
				//	out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"" + url + "\">" + (p + 1) + " </a></li>");
				//}
				%>
			</ul>
		</nav>
	</div>
	
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