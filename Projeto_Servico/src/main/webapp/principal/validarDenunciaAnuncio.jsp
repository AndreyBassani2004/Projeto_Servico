<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/principal/css/valida1Style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>

	<%@include file="/principal/Componente/header2.jsp"%>

	<div id="linha1"></div>

	<div class="container">
		<h1 style="text-align: center;">Avaliar denuncias de anuncios</h1>
	</div>

	<div id="linha1"></div>

	<div class="container">
		<div id="tabela">
			<table class="table table-striped" id="tabelaResultado">
				<thead>
					<tr>
						<th scolpe="col">ID</th>
						<th scolpe="col">Cliente</th>
						<th scope="col">Prestador de servi�o</th>
						<th scope="col">Estado</th>
						<th scope="col">Ver</th>
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
	</div>
	
	<div id="linha1"></div>

	<%@include file="/Componentes/rodape.jsp"%>

</body>
</html>