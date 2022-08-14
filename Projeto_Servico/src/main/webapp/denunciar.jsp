<%@page import="Model.ModelAnuncio"%>
<%@page import="Model.ModelLogin"%>
<%@page import="Model.ModelAvaliacao"%>
<%@page import="Model.ModelDenunciaAnuncio"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PresTec</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/denunciarStyle.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>

	<%@include file="/Componentes/header.jsp"%>

	<div id="linha1"></div>

	<div class="container">
		<h1 style="text-align: center;">Denunciar anuncio presta��o de
			servi�o</h1>
	</div>
	<br />
	<br />

	<div class="container">
		<form method="post"
			action="<%=request.getContextPath()%>/ServletCadastraDenunciaAnuncio">
			<h3>Anuncio</h3>
			<hr>
			<div class="row">
				<div class="col">

					<div id="textcampo">
						<p>
							<b>ID:</b>
						</p>
						<input type="text" class="form-control" name="id" id="id"
							value="${modelDenunciaAnuncio.id_anuncio}" readonly="readonly">
					</div>
					<br />

					<div id="textcampo">
						<p>
							<b>Nome do prestador:</b>
						</p>
						<input type="text" class="form-control"
							placeholder="Digite seu nome completo" name="nome_prestador"
							id="nome_prestador"
							value="${modelDenunciaAnuncio.nome_prestador}"
							readonly="readonly">
					</div>
					<br />
					<div id="textcampo">
						<p>
							<b>Servi�o do prestador:</b>
						</p>
						<input type="text" class="form-control"
							placeholder="Digite seu nome completo" name="servico_prestador"
							id="servico_prestador"
							value="${modelDenunciaAnuncio.servico_prestador}"
							readonly="readonly">
					</div>
					<br />
					<div id="textcampo">
						<p>
							<b>Estado:</b>
						</p>
						<input type="text" class="form-control"
							placeholder="Digite seu nome completo" name="estado" id="estado"
							value="${modelDenunciaAnuncio.uf}" readonly="readonly">
					</div>

				</div>
				<div class="col">

					<div id="textcampo">
						<p>
							<b>Titulo:</b>
						</p>
						<input type="text" class="form-control"
							placeholder="Digite seu nome completo" name="titulo_anuncio"
							id="titulo_anuncio"
							value="${modelDenunciaAnuncio.titulo_anuncio}"
							readonly="readonly">
					</div>
					<br />
					<div id="textcampo">
						<p>
							<b>Descri��o:</b>
						</p>
						<input type="text" class="form-control" style="height: 244px;"
							value="${modelDenunciaAnuncio.descricao_anuncio}"
							id="descricao2" name="descricao2" readonly="readonly">
					</div>

				</div>

			</div>
			<br /> <br />
			<h3>Dados</h3>
			<hr>
			<div class="row">
				<div class="col">
					<div id="textcampo">
						<p>
							<b>Nome:</b>
						</p>
						<input type="text" class="form-control"
							placeholder="Digite seu nome completo" name="nome_cliente"
							value="${modelDenunciaAnuncio.nome_cliente}" id="nome_cliente"
							required="required">
					</div>
					<br />
				</div>
				<div class="col">
					<div id="textcampo">
						<p>
							<b>Email:</b>
						</p>
						<input type="text" class="form-control"
							placeholder="Digite seu email completo" name="email_cliente"
							value="${modelDenunciaAnuncio.email_cliente}" id="email_cliente"
							required="required">
					</div>
					<br />
				</div>
			</div>
			<br /> <br />
			<h3>Descri��o denuncia</h3>
			<hr>
			<div class="row">
				<div class="col">
					<div id="textcampo">
						<p>
							<b>Motivo:</b>
						</p>
						<select class="form-control" name="motivo" id="motivo"
							required="required">
							<option value="">Selecione</option>
							<option value="Spam">Spam</option>
							<option value="Golpe">Golpe</option>
							<option value="ConteudoInapropriado">Conteudo
								Inapropriado</option>
							<option value="Outro">Outro</option>
						</select>
					</div>
					<br />
					<div id="textcampo">
						<p>
							<b>Descri��o:</b>
						</p>
						<input type="text" class="form-control" style="height: 140px;"
							name="descricao" required="required">
					</div>
					<br />
				</div>

				<div class="col">
					<div id="textcampo">
						<p>
							<b>Foto (N�o obrigat�rio)</b>
						</p>
						<p>Ultilize este campo caso seja necess�rio</p>
						<p>(Essa imagen sera mandida em sigilo)</p>
					</div>

				</div>

			</div>

			<hr>
			<div class="row">
				<div class="col">
					<spam style="margin-left: 5em;">${msg}</spam>
				</div>
				<div class="col">
					<button type="submit" class="btn btn-warning"
						style="margin-left: 20em;">Denunciar</button>
				</div>
			</div>

		</form>
	</div>

	<div id="linha1"></div>


	<%@include file="/Componentes/rodape.jsp"%>

</body>
</html>