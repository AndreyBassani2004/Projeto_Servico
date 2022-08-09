<%@page import="Model.ModelDenunciaAnuncio"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/principal/css/carregarDenAnuStyle.css">
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
				<h1>Avaliar denuncia do anuncio</h1>
			</div>
		</div>
	</div>

	<div id="linha1"></div>


	<div class="container">
		<h5>Dados</h5>
		<hr>
		<br>
		<div class="row">

			<div class="col">
				<div id="textcampo">
					<p>
						<b>ID Anuncio:</b>
					</p>
					<input type="text" class="form-control" value="${modelDenunciaAnuncio.id_anuncio}"
						name="id_avaliacao" id="id_avaliacao" readonly="readonly">
				</div>
				<br />

				<div id="textcampo">
					<p>
						<b>Nome do prestador de serviço:</b>
					</p>
					<input type="text" class="form-control" value="${modelDenunciaAnuncio.nome_prestador}"
						name="nome_prestador" id="nome_prestador" readonly="readonly">
				</div>
				<br />
				<div id="textcampo">
					<p>
						<b>Nome do cliente:</b>
					</p>
					<input type="text" class="form-control" value="${modelDenunciaAnuncio.nome_cliente}"
						name="nome_cliente" id="nome_cliente" readonly="readonly">
				</div>
				<br />
			</div>
			<div class="col">
				<div id="textcampo">
					<p>
						<b>Email Cliente:</b>
					</p>
					<input type="text" class="form-control" value="${modelDenunciaAnuncio.email_cliente}"
						name="email_cliente" id="email_cliente" readonly="readonly">
				</div>
				<br />
				<div id="textcampo">
					<p>
						<b>Email do prestador de serviço:</b>
					</p>
					<input type="text" class="form-control" value="${modelDenunciaAnuncio.email_prestador}"
						name="email_prestador" id="email_prestador" readonly="readonly">
				</div>
				<br />
			</div>
		</div>
		<h5>Denuncia</h5>
		<hr>
		<br>
		<div class="row">
			<div class="col">
				<div id="textcampo">
					<p>
						<b>Motivo:</b>
					</p>
					<input type="text" class="form-control" value="${modelDenunciaAnuncio.motivo}" name="motivo"
						id="motivo" readonly="readonly">
				</div>
				<br />
				<div id="textcampo">
					<p>
						<b>Descrição da denucia:</b>
					</p>
					<textarea class="form-control" id="descricao_cliente"
						name="descricao_cliente" readonly="readonly">${modelDenunciaAnuncio.descricao_anuncio}
					</textarea>
				</div>
			</div>
			<div class="col">
				<div id="textcampo">
					<p>
						<b>Foto comprovação (Não Obrigatório):</b>
					</p>
				</div>
			</div>
		</div>
		<br>
		<br>
		<h5>Medidas sobre denuncia</h5>
		<hr>
		<br>
		<div class="row">
			<div class="col">
				<div id="textcampo">
					<p>
						<b>Relatorio:</b>
					</p>
					<textarea class="form-control" id="descricao_cliente" 
						name="descricao_cliente" required="required">${modelDenunciaAnuncio.relatorio}
						
					</textarea>
				</div>
			</div>
		</div>
		<br>
		<br>
		<hr>
		<div class="row">
			<div class="col">
				<span>${msg}</span>
			</div>
			<div class="col">
				<button type="button" class="btn btn-success">Aprovar</button>
			</div>
			<div class="col">
				<button type="button" class="btn btn-danger">Reprovar</button>
			</div>
		</div>
	</div>

	<div id="linha1"></div>

</body>
</html>