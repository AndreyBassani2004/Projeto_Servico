<%@page import="Model.ModelDenunciaAnuncio"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PresTec</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/principal/css/carregarProvideniciaDenStyle.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	 <link rel="icon" type="image/png" href="<%= request.getContextPath() %>/Img/logo_superior.png"/>
	
	
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
				<h1>Providencia Denuncia Anuncio</h1>
			</div>
		</div>
	</div>

	<div id="linha1"></div>

	<form action="<%=request.getContextPath()%>/ServletMedidasDenunciaAnuncio" method="post">
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
						value="${modelDenunciaAnuncio.id_anuncio}" name="id_anuncio"
						id="id_anuncio" readonly="readonly">
				</div>
				<br />
				
				<div id="textcampo">
					<p>
						<b>ID prestador:</b>
					</p>
					<input type="text" class="form-control"
						value="${modelDenunciaAnuncio.id_prestador}" name="id_prestador"
						id="id_prestador" readonly="readonly">
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
						<b>Foto comprovação:</b>
					</p>
					 <c:if test="${modelDenunciaAnuncio.foto != '' && modelDenunciaAnuncio.foto != null}">
										<img alt="Imagen User" id="fotoembase64" src="${modelDenunciaAnuncio.foto}" width="319px"
					height="259px">
															</c:if>
															<c:if test="${modelDenunciaAnuncio.foto == '' || modelDenunciaAnuncio.foto == null}">
															<img alt="Imagen User" id="fotoembase64" src="<%=request.getContextPath()%>/principal/img/semImg.png"  width="319px"
					height="259px">
															</c:if>
															<br><br>
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
		<h5>Relatório sobre denuncia</h5>
		<hr>
		<br>
		<div class="row">
				<div class="col">
					<div id="textcampo">
						<p>
							<b>Estado:</b>
						</p>
						<input type="text" class="form-control" name="estado_denuncia" id="estado_denuncia"
							value="${modelDenunciaAnuncio.situacao}" readonly="readonly">
					</div>
				</div>
				<div class="col">
					<div id="textcampo">
						<p>
							<b>ID do administrador:</b>
						</p>
						<input type="text" class="form-control" name="id_adm" id="id_adm"
							value="${modelDenunciaAnuncio.id_adm}" readonly="readonly">
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
						<textarea class="form-control" maxlength="150" id="relatorio" name="relatorio" readonly="readonly">${modelDenunciaAnuncio.relatorio}</textarea>
					</div>
					<br />
				</div>
			</div>
		
		
		<br> <br>
		<h5>Providencia a denuncia</h5>
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
							<option value="MensagemAlerta">Mandar Mensagen de alerta</option>
							<option value="ExcluirAnuncio">Excluir Anuncio</option>
							<option value="BanirConta">Banir Conta</option>
						</select>
					</div>
				</div>
				<div class="col">
					<div id="textcampo">
						<p>
							<b>ID do administrador:</b>
						</p>
						<input type="text" class="form-control" name="id_adm_2" id="id_adm_2"
							value="<%= request.getSession().getAttribute("id").toString() %>" readonly="readonly">
					</div>
				</div>
			</div>
			<br />
			<br />
			<div class="row" >
				<div class="col" id="mensagem" >
					<div id="textcampo">
						<p>
							<b>Titulo Mensagem (Obrigatório):</b>
						</p>
						<input type="text" class="form-control" name="tituloMensagem" id="tituloMensagem" required="required">
					</div>
					<br />
				</div>
			</div>
			
			<div class="row" >
				<div class="col" id="mensagem" >
					<div id="textcampo">
						<p>
							<b>Mensagem para o prestador (Obrigatório):</b>
						</p>
						<textarea class="form-control" maxlength="150" id="mensagem" name="mensagem" required="required"></textarea>
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