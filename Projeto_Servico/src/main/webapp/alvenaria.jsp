<%@page import="Model.ModelAnuncio"%>
<%@page import="Model.ModelLogin"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/alvenaria.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
	<%@include file="/Componentes/header.jsp"%>

	<div id="titulo">
		<h1>
			<spam>${msg}</spam>
		</h1>
	</div>

	<div id="linha1"></div>

	<div class="listaBarra">
		<div class="listaBarra-c">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="card mb-3" style="max-width: 840px;">
							<div class="row g-0">


								<c:forEach items="${modelAnuncios}" var="an">
									<div class="col-md-4">
										<img src="#" class="img-fluid rounded-start"
											alt="Imagem Prestador">
									</div>
									<div class="col-md-8">
										<div class="card-body">
											<h5 class="card-title">
												<c:out value="${an.titulo}"></c:out>
											</h5>
											<p class="card-text">
												<c:out value="${an.descricao}"></c:out>
											</p>
											<p class="card-text">
												<small class="text-muted"><button type="button"
														class="btn btn-secondary">Conhecer</button></small>
											</p>
										</div>
									</div>
								</c:forEach>

							</div>
						</div>
					</div>
					<div class="col">
						<div class="card mb-3" style="max-width: 340px;">
							<div class="row g-0" >
							<form action="#" class="col-md-4" id="form_pesquisa">
								<h5>Pesquisar</h5><br/><br/>
								<div id="text_campo">
								<label>Cidade:</label><input type="text" placeholder="Digite o nome da cidade.">
								</div>
								<br/><br/>
								<button type="button" class="btn btn-primary">Pesquisar</button>
							</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="linha1"></div>

	<%@include file="/Componentes/rodape.jsp"%>
</body>
</html>