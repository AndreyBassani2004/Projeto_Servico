<%@page import="Model.ModelAvaliacao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/principal/css/carregarAvaliacaoStyle.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>

	<%@include file="/principal/Componente/header2.jsp"%>

	<div id="linha1"></div>

	<div class="container">
		<div class="row" style="align-items: center; text-align: center;">
			<div class="col">
				<h1>Avaliar avaliação do cliente</h1>
			</div>
		</div>
	</div>

	<div id="linha1"></div>

	<form>
		<div class="container">
			<h5>Cadastro do login</h5>
			<hr>
			<br>
			<div class="row">

				<div class="col">
					<div id="textcampo">
						<p>
							<b>ID Avaliação:</b>
						</p>
						<input type="text" class="form-control"
							value="${modelAvaliacao.id}" name="id_avaliacao"
							id="id_avaliacao" readonly="readonly">
					</div>
					<br />
					<!--  
					<div id="textcampo">
						<p>
							<b>Nome do prestador de serviço:</b>
						</p>
						<input type="text" class="form-control" value=""
							name="nome_prestador" id="nome_prestador" readonly="readonly">
					</div>
					<br />-->
					<div id="textcampo">
						<p>
							<b>Nome do cliente:</b>
						</p>
						<input type="text" class="form-control"
							value="${modelAvaliacao.nome_cliente}" name="nome_cliente"
							id="nome_cliente" readonly="readonly">
					</div>
					<br />
				</div>
				<div class="col">
					<div id="textcampo">
						<p>
							<b>Email Cliente:</b>
						</p>
						<input type="text" class="form-control"
							value="${modelAvaliacao.email_cliente}" name="email_cliente"
							id="email_cliente" readonly="readonly">
					</div>
					<br />
					<!-- 
					<div id="textcampo">
						<p>
							<b>Email do prestador de serviço:</b>
						</p>
						<input type="text" class="form-control" value=""
							name="email_prestador" id="email_prestador" readonly="readonly">
					</div>
					<br /> -->
					<!--  <div id="textcampo">
						<p>
							<b>Data da avaliação:</b>
						</p>
						<input type="text" class="form-control" value="${modelAvaliacao.data_prestacao}"
							name="data_denuncia" id="data_denuncia" readonly="readonly">
					</div>
					<br />-->
				</div>
			</div>
			<h5>Prova da prestação</h5>
			<hr>
			<br>
			<div class="row">
				<div class="col">
					<div id="textcampo">
						<p>
							<b>Data da prestação:</b>
						</p>
						<input type="text" class="form-control"
							value="${modelAvaliacao.data_prestacao}" name="data_prestacao"
							id="data_prestacao" readonly="readonly">
					</div>
					<br />
					<div id="textcampo">
						<p>
							<b>Email do prestador de serviço:</b>
						</p>
						<input type="text" class="form-control"
							value="${modelAvaliacao.email_prestador}" name="email_prestador"
							id="email_prestador" readonly="readonly">
					</div>
					<br />
				</div>
				<div class="col">
					<div id="textcampo">
						<p>
							<b>Foto comprovação:</b>
						</p>

					</div>
					<br />
				</div>
			</div>



			<h5>Nota da prestação</h5>
			<hr>
			<div class="row">
				<div class="col">
					<div id="textcampo">
						<p>
							<b>Nota:</b>
						</p>
						<input type="text" class="form-control"
							placeholder="Digite o Titulo" name="nota" id="nota"
							value="${modelAvaliacao.nota}" readonly="readonly">
					</div>
					<br />
				</div>
				<div class="col">
					<div id="textcampo">
						<p>
							<b>Titulo:</b>
						</p>
						<input type="text" class="form-control"
							placeholder="Digite o Titulo" name="titulo" id="titulo"
							value="${modelAvaliacao.titulo}" readonly="readonly">
					</div>
					<br />
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div id="textcampo">
						<p>
							<b>Descrição:</b>
						</p>
						<textarea class="form-control" readonly="readonly">${modelAvaliacao.descricao}</textarea>

					</div>
				</div>
			</div>


			<br>
			<hr>
			<br>
			<div class="row">
				<div class="col">
					<span>${msg}</span>
				</div>
				<div class="col">
				<a href="<%=request.getContextPath()%>/ServletAvaliarAvaliacao?acao=alterar&id_avaliacao=${modelAvaliacao.id}&id_user=<%= session.getAttribute("id") %>&situacao=APROVADO"><button type="button" class="btn btn-success">Aprovar</button></a>
				</div>
				<div class="col">
				<a href="<%=request.getContextPath()%>/ServletAvaliarAvaliacao?acao=alterar&id_avaliacao=${modelAvaliacao.id}&id_user=<%= session.getAttribute("id") %>&situacao=REPROVADO"><button type="button" class="btn btn-danger">Reprovar</button></a>
				</div>
			</div>

		</div>
	</form>

	<div id="linha1"></div>

	<%@include file="/Componentes/rodape.jsp"%>

</body>
</html>