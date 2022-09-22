<%@page import="Model.ModelAnuncio"%>
<%@page import="Model.ModelLogin"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>PresTec</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/principal/css/meus_anuncios.css">
	 <link rel="icon" type="image/png" href="<%= request.getContextPath() %>/Img/logo_superior.png"/>
	
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

						<c:if test="${ma.situacao == 'BANIDO'}">
							<td style="color:red;">INDISPONIVEL</td>
							<td style="color:red;">INDISPONIVEL</td>
						</c:if>

						<c:if test="${ma.situacao == 'ATIVO' || ma.situacao == 'PAUSADO'}">
							<td><a
								href="<%=request.getContextPath()%>\ServletCarregaAnuncio?acao=carregarAnuncio&id_anuncio=${ma.id}&id=<%= session.getAttribute("id")%>">
									<button type="button" class="btn btn-primary">Ver/Editar</button>
							</a></td>
							<td><a
								href="<%=request.getContextPath()%>\ServletCarregaAnuncio?acao=deletarajax&id=${ma.id}&id_user=<%= session.getAttribute("id")%>"><button
										type="button" class="btn btn-danger">Excluir</button></a></td>
						</c:if>
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