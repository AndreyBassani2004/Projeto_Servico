<%@page import="Model.ModelDenunciaAvaliacao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/principal/css/denunciarAvaliacaoStyle.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>PresTec</title>
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
		<div class="row">
			<h2>Denunciar Avaliação</h2>
		</div>
	</div>
	<br />
	<br />
	<br />
	
	<div class="container">
	<form action="<%=request.getContextPath()%>/ServletSDenunciaAvaliacao" method="post" enctype="multipart/form-data">
		<h5>Dados</h5>
		<hr>
		<br />
		<div class="row">
	
				<div class="col">
					<div id="textcampo">
						<p>
							<b>ID Avaliação:</b>
						</p>
						<input type="text" class="form-control"
							value="${modelDenunciaAvaliacao.id}" name="id_avaliacao"
							id="id_avaliacao" readonly="readonly">
					</div>
					<br />
					  
					
					<div id="textcampo">
						<p>
							<b>Nome do cliente:</b>
						</p>
						<input type="text" class="form-control"
							value="${modelDenunciaAvaliacao.nome_cliente}" name="nome_cliente"
							id="nome_cliente" readonly="readonly">
					</div>
					<br />
				</div>
				<div class="col">
				<div id="textcampo">
						<p>
							<b>ID anuncio:</b>
						</p>
						<input type="text" class="form-control" value="${modelDenunciaAvaliacao.id_anuncio}"
							name="id_anuncio" id="id_anuncio" readonly="readonly">
					</div>
					<br />
					<div id="textcampo">
						<p>
							<b>Email Cliente:</b>
						</p>
						<input type="text" class="form-control"
							value="${modelDenunciaAvaliacao.email_cliente}" name="email_cliente"
							id="email_cliente" readonly="readonly">
					</div>
					<br />
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
							value="${modelDenunciaAvaliacao.data_prestacao}" name="data_prestacao"
							id="data_prestacao" readonly="readonly">
					</div>
					<br />
					<div id="textcampo">
						<p>
							<b>Email do prestador de serviço:</b>
						</p>
						<input type="text" class="form-control"
							value="${modelDenunciaAvaliacao.email_prestador}" name="email_prestador"
							id="email_prestador" readonly="readonly">
					</div>
					<br />
				</div>
				<div class="col">
					<div id="textcampo">
						<p>
							<b>Foto comprovação:</b>
						</p>
						 <c:if test="${modelDenunciaAvaliacao.fotoAvaliacao != '' && modelDenunciaAvaliacao.fotoAvaliacao != null}">
						<img alt="Imagen User" id="fotoembase64" src="${modelDenunciaAvaliacao.fotoAvaliacao}" width="400px" height="250px">
															</c:if>
															<c:if test="${modelDenunciaAvaliacao.fotoAvaliacao == '' || modelDenunciaAvaliacao.fotoAvaliacao == null}">
															<img alt="Imagen User" id="fotoembase64" src="<%=request.getContextPath()%>/principal/img/semImg.jpg" width="200px" height="100px">
															</c:if>	
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
							value="${modelDenunciaAvaliacao.nota}" readonly="readonly">
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
							value="${modelDenunciaAvaliacao.titulo}" readonly="readonly">
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
						<textarea class="form-control" readonly="readonly">${modelDenunciaAvaliacao.descricao_avaliacao}</textarea>

					</div>
				</div>
			</div>
			<br/><br/>
			<h5>Descrição denuncia</h5>
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
							<option value="Falso">Avaliação Falsa</option>
							<option value="ConteudoInapropriado">Conteudo
								Inapropriado</option>
							<option value="Outro">Outro</option>
						</select>
					</div>
					<br />
					<div id="textcampo">
						<p>
							<b>Descrição:</b>
						</p>
						<textarea id="descricao_denuncia" name="descricao_denuncia" class="form-control" maxlength="150" required="required"></textarea>
					</div>
					<br />
				</div>

				<div class="col">
					<div id="textcampo">
						<p>
							<b>Foto</b>
						</p>
						<p>Ultilize este campo caso seja necessário</p>
						<input type="file" id="fileFoto" name="fileFoto" accept="image/*" class="form-control-file" style="margin-top: 15px; margin-left: 5px;"  required="required">
						
					</div>

				</div>

			</div>
			<br/>
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
	


	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<%@include file="/Componentes/rodape.jsp"%>
	
	
	<script type="text/javascript">
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