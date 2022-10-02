<%@page import="Model.ModelAnuncio"%>
<%@page import="Model.ModelAvaliacao"%>
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
			<div class="row">
				<h5>Gerenciar Anuncio</h5>
				<hr style="background-color: #F3F3F3; padding: 0.05em; width: 100%;">

			</div>
			<div class="row">
				<div class="col">
					<br />
					<p>
						<span style="color: green;">${msg}</span>
					</p>
				</div>
				<div class="col"></div>
				<div class="col">
					<br /> <a
						href="<%=request.getContextPath()%>/ServletGerenciarSistema?acao=AtivarAnuncio&id_user=<%=session.getAttribute("id")%>&paginar=0&id=${modelAnuncio.id}"><button
							type="button" class="btn btn-success">Ativar</button></a>
				</div>

			</div>
			<br /> <br /> <br /> <br />
			<div class="row">
				<div class="col" style="min-height: 500px; min-width: 500px;">
					<h2>
						<spam>${modelAnuncio.nome_prestador}</spam>
					</h2>
					<br /> <br />
					<!--  
				<img alt="Prestador"
					src="<%=request.getContextPath()%>/Img/user.jpg" width="519px"
					height="459px">-->

					<c:if
						test="${modelAnuncio.foto != '' && modelAnuncio.foto != null}">
						<img alt="Imagen User" id="fotoembase64"
							src="${modelAnuncio.foto}" width="519px" height="459px">
					</c:if>
					<c:if
						test="${modelAnuncio.foto == '' || modelAnuncio.foto == null}">
						<img alt="Imagen User" id="fotoembase64"
							src="<%=request.getContextPath()%>/principal/img/semImg.png"
							width="519px" height="459px">
					</c:if>
					<br> <br>
					<h6>Descri��o:</h6>
					<p>
						<spam>${modelAnuncio.descricao}</spam>
					</p>
				</div>

				<div class="col" style="min-width: 360px; min-height: 600px;">
					<div class="card mb-3">
						<div class="row g-0">
							<div class="col-md-8" style="margin-left: 5em;">
								<br /> <br />
								<h5>
									<b>Nota m�dia de avalia��o:</b>
								</h5>
								<br />
								<h6>${modelAvaliacao.nota_media}</h6>
								<br /> <br />
							</div>

							<div class="col-md-8" style="margin-left: 5em;">
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

							<div class="col-md-8" style="margin-left: 5em;">
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
					<h5>Avalia��o</h5>
					<hr>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<!--  	<select class="form-control" name="uf" id="uf" style="width: 250px;"
					required="required">
					<option value="">Selecione</option>
					<option value="Recente">Mais recente</option>
					<option value="Antigos">Mais Antigos</option>
				</select>-->
				</div>
				<div class="col"></div>
				<div class="col">
					<!-- 	<a
					href="<%=request.getContextPath()%>/ServletPrestadores?acao=avaliar&id=${modelAnuncio.id}"><button
						type="button" class="btn btn-success">Avaliar</button></a> <a
					href="<%=request.getContextPath()%>/ServletPrestadores?acao=denuncia&id=${modelAnuncio.id}"><button
						type="button" class="btn btn-danger">Denunciar Anuncio</button></a>
			</div>
			<br /> <br /> <br /> -->
				</div>
				<div class="row" id="avaliacoes">

					<div class="card " style="width: 1200px; height: 1200px;">
						<div class="card-body">
							<c:forEach items="${modelAvaliacaos}" var="av">
								<h5 class="card-title">
									Cliente: <i><c:out value="${av.nome_cliente}"></c:out></i>
									Nota: <i><c:out value="${av.nota}"></c:out></i>
								</h5>
								<br>
								<p class="card-text">
									Titulo:
									<c:out value="${av.titulo}"></c:out>
								</p>
								<p class="card-text">
									Descri��o:
									<c:out value="${av.descricao}"></c:out>
								</p>

								<p class="card-text">
									<a
										href="<%=request.getContextPath()%>/ServletCarregarRequisicao?acao=denunciarAvaliacao&id=${av.id}&id_user=<%= session.getAttribute("id")%>&id_anuncio=${modelAnuncio.id}"><button
											type="button" class="btn btn-danger">Denunciar</button></a>
								</p>
								<br>
								<br>
							</c:forEach>
						</div>
					</div>

				</div>
				<nav aria-label="Page navigation example">
					<br /> <br />
					<ul class="pagination">

						<%
						ModelAnuncio modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

						int totalPagina = (int) request.getAttribute("totalPagina");

						for (int p = 0; p < totalPagina; p++) {
							String url = request.getContextPath() + "/ServletGerenciarSistema?acao=carregarAnuncioBanido&id_user="
							+ session.getAttribute("id") + "&paginar=" + (p * 5) + "&id=" + modelAnuncio.getId();
							out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"" + url + "\">" + (p + 1) + " </a></li>");
						}
						%>


					</ul>
				</nav>
			</div>
		</div>

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
			<h1>Fun��o indisponivel</h1>
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

	<script type="text/javascript">
		function visualizarImg(fotoembase64, filefoto) {

			var preview = document.getElementById(fotoembase64);
			var fileUser = document.getElementById(filefoto).files[0];
			var reader = new FileReader();

			reader.onloadend = function() {
				preview.src = reader.result /*Carregar foto na tela*/
			}

			if (fileUser) {
				reader.readAsDataURL(fileUser);
			} else {
				preview.src = '';
			}

		}
	</script>


</body>
</html>