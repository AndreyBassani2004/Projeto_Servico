<%@page import="Model.ModelDenunciaAnuncio"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PresTec</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/principal/css/carregarDenAnuStyle.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
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
		<div class="row" style="align-items: center; text-align: center;">
			<div class="col">
				<h1>Avaliar denuncia do anuncio</h1>
			</div>
		</div>
	</div>

	<div id="linha1"></div>

	<form action="<%=request.getContextPath()%>/ServletProvidenciaDenunciaAnuncio" method="post">
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
					<input type="text" class="form-control"
						value="${modelDenunciaAnuncio.id_anuncio}" name="id_avaliacao"
						id="id_avaliacao" readonly="readonly">
				</div>
				<br />

				<div id="textcampo">
					<p>
						<b>Nome do prestador de serviço:</b>
					</p>
					<input type="text" class="form-control"
						value="${modelDenunciaAnuncio.nome_prestador}"
						name="nome_prestador" id="nome_prestador" readonly="readonly">
				</div>
				<br />
				<div id="textcampo">
					<p>
						<b>Nome do cliente:</b>
					</p>
					<input type="text" class="form-control"
						value="${modelDenunciaAnuncio.nome_cliente}" name="nome_cliente"
						id="nome_cliente" readonly="readonly">
				</div>
				<br />
			</div>
			<div class="col">
			
				<div id="textcampo">
					<p>
						<b>ID Denuncia:</b>
					</p>
					<input type="text" class="form-control"
						value="${modelDenunciaAnuncio.id}" name="id"
						id="id" readonly="readonly">
				</div>
				<br />
				<div id="textcampo">
					<p>
						<b>Email Cliente:</b>
					</p>
					<input type="text" class="form-control"
						value="${modelDenunciaAnuncio.email_cliente}" name="email_cliente"
						id="email_cliente" readonly="readonly">
				</div>
				<br />
				<div id="textcampo">
					<p>
						<b>Email do prestador de serviço:</b>
					</p>
					<input type="text" class="form-control"
						value="${modelDenunciaAnuncio.email_prestador}"
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
					<input type="text" class="form-control"
						value="${modelDenunciaAnuncio.motivo}" name="motivo" id="motivo"
						readonly="readonly">
				</div>
				<br />
			</div>

			<div class="col">
				<div id="textcampo">
					<p>
						<b>Foto comprovação (Não Obrigatório):</b>
					</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div id="textcampo">
					<p>
						<b>Descrição da denucia:</b>
					</p>
					<textarea class="form-control" id="descricao_cliente"
						name="descricao_cliente" readonly="readonly">${modelDenunciaAnuncio.descricao_denuncia}
					</textarea>
				</div>
			</div>
		</div>
		<br> <br>
		<h5>Medidas sobre denuncia</h5>
		<hr>
		<br>
		<div class="row">
				<div class="col">
					<div id="textcampo">
						<p>
							<b>Providencia:</b>
						</p>
						<select class="form-control" name="providencia" id="providencia"
							required="required">
							<option value="">Selecione</option>
							<option value="Aprovar">Aprovar</option>
							<option value="Reprovar">Reprovar</option>
						</select>
					</div>
				</div>
				<div class="col">
					<div id="textcampo">
						<p>
							<b>ID do administrador:</b>
						</p>
						<input type="text" class="form-control" name="id_adm" id="id_adm"
							value="<%= request.getSession().getAttribute("id").toString() %>" readonly="readonly">
					</div>
				</div>
			</div>
			<br />
			<br />
			<div class="row">
				<div class="col">
					<div id="textcampo">
						<p>
							<b>Relatório:</b>
						</p>
						<textarea class="form-control" maxlength="150" id="relatorio" name="relatorio" required="required"></textarea>
					</div>
					<br />
				</div>
			</div>
		
		<br> <br>
		<hr>		
			<div class="row">
				<div class="col">
					<spam style="margin-left: 5em;">${msg}</spam>
				</div>
				<div class="col">
					<button type="submit" class="btn btn-primary"
						style="margin-left: 20em;">Finalizar Analise</button>
				</div>
			</div>
	</div>
	</form>

	<br />
	<br />
	<br />
	<br />
	<br />
	<br />

	<%@include file="/Componentes/rodape.jsp"%>

</body>
</html>