<%@page import="Model.ModelAnuncio"%>
<%@page import="Model.ModelLogin"%>
<%@page import="Model.ModelAvaliacao"%>
<%@page import="Model.ModelDenunciaAnuncio"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
	 <link rel="icon" type="image/png" href="<%= request.getContextPath() %>/Img/logo_superior.png"/>
	
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
			action="<%=request.getContextPath()%>/ServletCadastraDenunciaAnuncio" enctype="multipart/form-data">
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
					<textarea class="form-control" readonly="readonly">${modelDenunciaAnuncio.descricao_anuncio}</textarea>
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
						<textarea class="form-control" maxlength="150" id="descricao" name="descricao" required="required"></textarea>

					</div>
					<br />
				</div>

				<div class="col">
					<div id="textcampo">
						<p>
							<b>Foto:</b>
						</p>
						<p>(Essa imagen sera mandida em sigilo)</p>
						<br><br>					
						<input type="file" id="fileFoto" name="fileFoto" accept="image/*" onchange="visualizarImg('fotoembase64', 'fileFoto');" class="form-control-file" style="margin-top: 15px; margin-left: 5px;" required="required">
							
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

<script type="text/javascript">
	function verEditar(login){
		
		var urlAction = document.getElementById('cadastroCliente').action;
		
		window.location.href = urlAction + '?acao=buscarEditar&login=' + login;
		
		
	}
	
	function visualizarImg(fotoembase64, filefoto) {
		
		
		var preview = document.getElementById(fotoembase64);
		var fileUser = document.getElementById(filefoto).files[0];
		var reader = new FileReader();
		
		reader.onloadend = function (){
			preview.src = reader.result /*Carregar foto na tela*/
		}
		
		if(fileUser){
			reader.readAsDataURL(fileUser);
		}else{
			preview.src= '';
		}
		
	}
	</script>

</body>
</html>