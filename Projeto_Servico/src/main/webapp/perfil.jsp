<%@page import="Model.ModelAnuncio"%>
<%@page import="Model.ModelLogin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/perfilStyle.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/Componentes/header.jsp"%>

	<div id="linha1"></div>

	<div class="container">
		<div class="row">
			<div class="col" style="min-height: 500px; min-width: 500px;">
				<h2>
					<spam>${modelAnuncio.nome_prestador}</spam>
				</h2>
				<br /> <br /> <img alt="Prestador"
					src="<%=request.getContextPath()%>/Img/user.jpg" width="460px"
					height="340p">
				<p>
					<spam>${modelAnuncio.descricao}</spam>
				</p>
			</div>

			<div class="col" style="min-width: 360px; min-height: 600px;">
				<div class="card mb-3">
					<div class="row g-0">
						<div class="col-md-8">
							<br /> <br />
							<h5>
								<b>Nota de avaliação:</b>
							</h5>
							<br />
							<h6>Nota</h6>
							<br /> <br />
						</div>

						<div class="col-md-8">
							<h5>
								<b>Local:</b>
							</h5>
							<br />
							<h5>
								Estado:
								<spam>${modelAnuncio.estado}</spam>
							</h5>
							<br />
							<h5>
								Cidades:
								<spam>${modelAnuncio.regiao}</spam>
							</h5>
							<br /> <br />
						</div>

						<div class="col-md-8">
							<h5>
								<b>Contato:</b>
							</h5>
							<br /> <br />
							<h5>
								Email:
								<spam>${modelAnuncio.email_contato}</spam>
							</h5>
							<br />
							<h5>
								Telefone:
								<spam> ${modelAnuncio.telefone_prestador} </spam>
							</h5>
							<br />

						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<h5>Avaliação</h5>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<select class="form-control" name="uf" id="uf" style="width: 250px;"
					required="required">
					<option value="">Selecione</option>
					<option value="Recente">Mais recente</option>
					<option value="Antigos">Mais Antigos</option>
				</select>
			</div>
			<div class="col"></div>
			<div class="col">
				<a href="<%=request.getContextPath()%>/avaliar.jsp"><button type="button" class="btn btn-success">Avaliar</button></a>
				<button type="button" class="btn btn-danger">Denunciar</button>
			</div>
			<br /> <br /> <br />
		</div>
		<div class="row">
			<div class="card " style="width: 1200px; height: 800px;">
				<div class="card-body">
					<h5 class="card-title">
						Cliente: <span>Nome</span> Nota: <span>nota</span>
					</h5>
					<br>
					<p class="card-text">
						Titulo:
						<spam>titulo</spam>
					</p>
					<p class="card-text">
						Descrição:
						<spam>descricao</spam>
					</p>
				</div>
			</div>
		</div>
		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<%
				//	

				//int totalPagina = (int) request.getAttribute("totalPagina");

				//	for (int p = 0; p < totalPagina; p++){
				//String url = request.getContextPath()+ "/ServletPrestadores?acao=paginar2&pagina=" + (p * 5) + "&categoria=eletricista";
				//	out.print("<li class=\"page-item\"><a class=\"page-link\" href=\""+url+"\">"+(p + 1)+" </a></li>");									}
				%>


			</ul>
		</nav>
	</div>
		<div id="linha1"></div>
	
	<%@include file="/Componentes/rodape.jsp"%>

</body>
</html>