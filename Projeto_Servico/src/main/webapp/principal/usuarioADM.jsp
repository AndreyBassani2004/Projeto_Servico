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
					<th scolpe="col">Titulo</th>
					<th scope="col">Serviço</th>
					<th scope="col">Situação</th>
					<th scope="col">Ver Avaliações</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach items="#" var="ma">
					<tr>
						<td><c:out value="#"></c:out></td>
						<td><c:out value="#"></c:out></td>
						<td><c:out value="#"></c:out></td>
						<td><c:out value="#"></c:out></td>
						
						
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
	</div>

</body>
</html>