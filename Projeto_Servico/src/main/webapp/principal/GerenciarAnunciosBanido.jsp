<%@page import="Model.ModelAnuncio"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PresTec</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/principal/css/biblioteStyle.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/Img/logo_superior.png" />
</head>
<body>

	<%@include file="/principal/Componente/header2.jsp"%>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<c:if test="${isAdmin}">
		<div class="container">
			<div class="row"><h1>Gerenciar Anuncios Banidos</h1></div>
		</div>
		<br />
		<br />
		<br />
		<br />
		<div class="container">
		<div class="row">
			<table class="table table-striped" id="tabelaResultado">
			<thead>
				<tr>
					<th scolpe="col">ID</th>
					<th scolpe="col">ID do Prestador</th>
					<th scope="col">Email Contato</th>
					<th scope="col">Estado</th>
					<th scope="col">Ver Anuncio</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach items="${modelAnuncios}" var="ml">
					<tr>
						<td><c:out value="${ml.id}"></c:out></td>
						<td><c:out value="${ml.id_prestador2}"></c:out></td>
						<td><c:out value="${ml.email_contato}"></c:out></td>
						<td><c:out value="${ml.situacao}"></c:out></td>
						<td><a href="<%=request.getContextPath()%>/ServletGerenciarSistema?acao=carregarAnuncioBanido&id_user=<%=session.getAttribute("id")%>&id=${ml.id}&paginar=0"><button type="button" class="btn btn-primary">Gerenciar</button></a></td>		
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
	<nav aria-label="Page navigation example" >
			
			<ul class="pagination">
				<%	
				int totalPagina = (int) request.getAttribute("totalPagina");

				for (int p = 0; p < totalPagina; p++) {
					String url = request.getContextPath() + "/ServletGerenciarSistema?acao=carregarAnunciosBanido&id_user="
					+ request.getSession().getAttribute("id") + "&paginar=" + (p * 5);
					out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"" + url + "\">" + (p + 1) + " </a></li>");
				}
				%>
			</ul>
		</nav>
		</div>
		<br />
		<br />
		<br />
		<br />	
	</c:if>
	
	<c:if test="${perfil == 'PRESTADOR' || perfil == 'ADMIN' && !isAdmin}">
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<div class="container"
			style="align-items: center; text-align: center;">
			<h1>Função indisponivel</h1>
			<br> <a
				href="<%=request.getContextPath()%>/principal/principal.jsp">Voltar
				ao Inicio</a>
		</div>
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
	</c:if>
	
		<%@include file="/Componentes/rodape.jsp"%>
	
	
	
	
	

</body>
</html>