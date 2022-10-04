<%@page import="Model.ModelAnuncio"%>
<%@page import="Model.ModelLogin"%>
<%@page import="Model.ModelAvaliacao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/avaliarStyle.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/Img/logo_superior.png" />
<link
	href="https://code.jquery.com/ui/1.9.1/themes/smoothness/jquery-ui.css"
	rel="stylesheet">

<title>PresTec</title>
</head>
<body>
	<%@include file="/Componentes/header.jsp"%>

	<div id="linha1"></div>

	<div class="container">
		<h1 style="text-align: center;">Avaliar prestação de serviço</h1>
	</div>
	<br />
	<br />
	<div class="container">
		<form method="post"
			action="<%=request.getContextPath()%>/ServletCadastrarAvaliacao"
			enctype="multipart/form-data">
			<h3>Anuncio</h3>
			<hr>
			<div class="row">
				<div class="col">

					<div id="textcampo">
						<p>
							<b>ID:</b>
						</p>
						<input type="text" class="form-control" name="id" id="id"
							value="${modelAvaliacao.id_anuncio}" readonly="readonly">
					</div>
					<br />

					<div id="textcampo">
						<p>
							<b>Nome do prestador:</b>
						</p>
						<input type="text" class="form-control"
							placeholder="Digite seu nome completo" name="nome_prestador"
							id="nome_prestador" value="${modelAvaliacao.nome_prestador}"
							readonly="readonly">
					</div>
					<br />
					<div id="textcampo">
						<p>
							<b>Serviço do prestador:</b>
						</p>
						<input type="text" class="form-control"
							placeholder="Digite seu nome completo" name="servico_prestador"
							id="servico_prestador"
							value="${modelAvaliacao.servico_prestador}" readonly="readonly">
					</div>
					<br />
					<div id="textcampo">
						<p>
							<b>Estado:</b>
						</p>
						<input type="text" class="form-control"
							placeholder="Digite seu nome completo" name="estado" id="estado"
							value="${modelAvaliacao.uf}" readonly="readonly">
					</div>

				</div>
				<div class="col">

					<div id="textcampo">
						<p>
							<b>Titulo:</b>
						</p>
						<input type="text" class="form-control"
							placeholder="Digite seu nome completo" name="titulo_anuncio"
							id="titulo_anuncio" value="${modelAvaliacao.titulo_anuncio}"
							readonly="readonly">
					</div>
					<br />
					<div id="textcampo">
						<p>
							<b>Descrição:</b>
						</p>
						<input type="text" class="form-control" style="height: 244px;"
							value="${modelAvaliacao.descricao}" id="descricao2"
							name="descricao2" readonly="readonly">
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
							value="${modelAvaliacao.nome_cliente}" id="nome_cliente"
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
							value="${modelAvaliacao.email_cliente}" id="email_cliente"
							required="required">
					</div>
					<br />
				</div>
			</div>
			<br /> <br />
			<h3>Prova da prestação</h3>
			<hr>
			<div class="row">
				<div class="col">
					<div id="textcampo">
						<p>
							<b>Data Prestação:</b>
						</p>
						<input type="date" class="form-control"
							value="${modelDenunciaAvaliacao.data_prestacao}" name="data_prestacao"
							id="data_prestacao" readonly="readonly">





					</div>
					<br />
					<div id="textcampo">
						<p>
							<b>Como foi a prestação:</b>
						</p>
						<textarea class="form-control" maxlength="150" required="required"
							id="descricao_cliente" name="descricao_cliente">${modelAvaliacao.descricao_cliente}</textarea>
					</div>
				</div>
				<div class="col">
					<div id="textcampo">
						<p>
							<b>Foto comprovação</b>
						</p>
						<p>Tire um print ou foto da concersa você e o prestador</p>
						<p>(Essa imagen sera mandida em sigilo)</p>
						<input type="file" id="fileFoto" name="fileFoto" accept="image/*"
							class="form-control-file"
							style="margin-top: 15px; margin-left: 5px;" required="required">

					</div>

				</div>
			</div>
			<br /> <br />
			<h3>Nota da prestação</h3>
			<hr>
			<div class="row">
				<div class="col">
					<div id="textcampo">
						<p>
							<b>Nota: (0-10)</b>
						</p>
						<select class="form-control" name="nota" id="nota"
							required="required">
							<option value="">Selecione</option>
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
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
							value="${modelAvaliacao.titulo}" required="required">
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
						<textarea class="form-control" maxlength="150" required="required">${modelAvaliacao.descricao}</textarea>
					</div>
				</div>
			</div>
			<br /> <br />
			<hr>
			<div class="row">
				<div class="col">
					<spam style="margin-left: 5em;">${msg}</spam>
				</div>
				<div class="col">
					<button type="submit" class="btn btn-success"
						style="margin-left: 20em;">Avaliar</button>
				</div>
			</div>
		</form>
	</div>
	<div id="linha1"></div>


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
		$(function() {

			$("#data")
					.datepicker(
							{
								dateFormat : 'dd/mm/yy',
								dayNames : [ 'Domingo', 'Segunda', 'Terça',
										'Quarta', 'Quinta', 'Sexta', 'Sábado' ],
								dayNamesMin : [ 'D', 'S', 'T', 'Q', 'Q', 'S',
										'S', 'D' ],
								dayNamesShort : [ 'Dom', 'Seg', 'Ter', 'Qua',
										'Qui', 'Sex', 'Sáb', 'Dom' ],
								monthNames : [ 'Janeiro', 'Fevereiro', 'Março',
										'Abril', 'Maio', 'Junho', 'Julho',
										'Agosto', 'Setembro', 'Outubro',
										'Novembro', 'Dezembro' ],
								monthNamesShort : [ 'Jan', 'Fev', 'Mar', 'Abr',
										'Mai', 'Jun', 'Jul', 'Ago', 'Set',
										'Out', 'Nov', 'Dez' ],
								nextText : 'Próximo',
								prevText : 'Anterior'
							});
		});
	</script>

</body>
</html>