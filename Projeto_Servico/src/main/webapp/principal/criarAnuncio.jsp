<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>\principal\css\criarAnuncio.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
	<%@include file="/principal/Componente/header2.jsp"%>
	<div id="titulo">
		<h1>Criar anuncio</h1>
	</div>
	<form action="">
		<div id="formulario">
			<div id="formulario1">
				<h5>Sobre região e serviço</h5>
				<br>
				<div id="linha2"></div>
				<br>
				<table>
					<tr>
						<td>
							<div id="textcampo">
								<p>
									<b>Tipo de Serviço:</b>
								</p>
								<select class="form-control" name="servico" id="servico"
									required="required">
									<option value="">Selecione</option>
									<option value="Alvenaria">Alvenaria</option>
									<option value="Eletricista">Eletricista</option>
									<option value="FazTudo">FazTudo</option>
									<option value="Encanador">Encanador</option>
								</select>
							</div>
						</td>
						<td>

							<div id="textcampo">
								<p>
									<b>Estado:</b>
								</p>
								<input type="text" class="form-control" name="uf" id="uf"
									readonly="readonly">

							</div>
						</td>
					</tr>
				</table>
				<br> <br>
				<div id="textcampo2">

					<p>
						<b>Descreva as cidades que você atende:</b>
					</p>
					<input type="text" class="form-control"
						placeholder="Nome das cidades completo" name="regiao" id="regiao"
						value="${modelLogin.nome}" required="required">
				</div>

				<br> <br>
			</div>
			<div id="fomulario2">
				<h5>Descrição e titulo</h5>
				<br>
				<div id="linha2"></div>

				<div id="textcampo2">

					<p>
						<b>Titulo do anuncio:</b>
					</p>
					<input type="text" class="form-control"
						placeholder="Titulo do anuncio" name="tituloAn" id="tituloAn"
						value="${modelLogin.nome}" required="required">
				</div>

				<div id="textcampo2">
					<p>
						<b>Descrição:</b>
					</p>
					<textarea class="form-control" id="exampleFormControlTextarea1"
						rows="3"></textarea>
				</div>
			</div>
			<div id="linha1"></div>

			<div id="button">
				<button type="submit"
					class="btn btn-success waves-effect waves-light">Criar
					Anuncio</button>
			</div>
			<div id="spam">
				<spam>${msg}</spam>
			</div>
		</div>
	</form>
	<br>
	<br>
	<br>

	<%@include file="/Componentes/rodape.jsp"%>
</body>
</html>