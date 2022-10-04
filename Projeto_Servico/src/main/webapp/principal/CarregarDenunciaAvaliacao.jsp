<%@page import="Model.ModelDenunciaAvaliacao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PresTec</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/principal/css/carregarDenAnuStyle.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	 <link rel="icon" type="image/png" href="<%= request.getContextPath() %>/Img/logo_superior.png"/>
	<link
	href="https://code.jquery.com/ui/1.9.1/themes/smoothness/jquery-ui.css"
	rel="stylesheet">
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
				<h1>Avaliar denuncia da avaliação</h1>
			</div>
		</div>
	</div>


	<div class="container">
		<form action="<%=request.getContextPath()%>/ServletProvidenciaDenunciaAvaliacao"
			method="post">
			<h5>Dados</h5>
			<hr>
			<br />
			<div class="row">

				<div class="col">
					<div id="textcampo">
						<p>
							<b>ID:</b>
						</p>
						<input type="text" class="form-control"
							value="${modelDenunciaAvaliacao.id}" name="id_avaliacao"
							id="id_avaliacao" readonly="readonly">
					</div>
					<br />

					<div id="textcampo">
						<p>
							<b>ID Avaliação:</b>
						</p>
						<input type="text" class="form-control"
							value="${modelDenunciaAvaliacao.id_avaliacao}" name="id_avaliacao2"
							id="id_avaliacao2" readonly="readonly">
					</div>
					<br />
					

					<div id="textcampo">
						<p>
							<b>Nome do cliente:</b>
						</p>
						<input type="text" class="form-control"
							value="${modelDenunciaAvaliacao.nome_cliente}"
							name="nome_cliente" id="nome_cliente" readonly="readonly">
					</div>
					<br />
				</div>
				<div class="col">
					<div id="textcampo">
						<p>
							<b>ID anuncio:</b>
						</p>
						<input type="text" class="form-control"
							value="${modelDenunciaAvaliacao.id_anuncio}" name="id_anuncio"
							id="id_anuncio" readonly="readonly">
					</div>
					<br />
					<div id="textcampo">
						<p>
							<b>Email Cliente:</b>
						</p>
						<input type="text" class="form-control"
							value="${modelDenunciaAvaliacao.email_cliente}"
							name="email_cliente" id="email_cliente" readonly="readonly">
					</div>
					<br />
				</div>
			</div>

			<br />
			<br />
			<br />
			<br />

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

			<br />
			<br />
			<br />
			<br />


			<h5>Prova da prestação</h5>
			<hr>
			<br>
			<div class="row">
				<div class="col">
					<div id="textcampo">
						<p>
							<b>Data da prestação:</b>
						</p>
						<input type="date" class="form-control"
							value="${modelDenunciaAvaliacao.data_prestacao}" name="data_prestacao"
							id="data_prestacao" readonly="readonly">
					</div>
					<br />
					<div id="textcampo">
						<p>
							<b>Email do prestador de serviço:</b>
						</p>
						<input type="text" class="form-control"
							value="${modelDenunciaAvaliacao.email_prestador}"
							name="email_prestador" id="email_prestador" readonly="readonly">
					</div>
					<br />
				</div>
				<div class="col">
					<div id="textcampo">
						<p>
							<b>Foto comprovação:</b>
						</p>
						<c:if test="${modelDenunciaAvaliacao.foto != '' && modelDenunciaAvaliacao.foto != null}">
						<img alt="Imagem" id="fotoembase64" src="${modelDenunciaAvaliacao.foto}" width="400px" height="250px">
															</c:if>
															<c:if test="${modelDenunciaAvaliacao.foto == '' || modelDenunciaAvaliacao.foto == null}">
															<img alt="Imagen User" id="fotoembase64" src="<%=request.getContextPath()%>/principal/img/semImg.jpg" width="200px" height="100px">
															</c:if>	

					</div>
					<br />
				</div>
			</div>

			<br />
			<br />
			<br />
			<br />


			<h5>Descrição denuncia</h5>
			<hr>
			<div class="row">
				<div class="col">
					<div id="textcampo">
						<p>
							<b>Motivo:</b>
						</p>
						<input type="text" class="form-control" name="motivo" id="motivo"
							value="${modelDenunciaAvaliacao.motivo}" readonly="readonly">
					</div>
					<br />
				</div>

				<div class="col">
					<div id="textcampo">
						<p>
							<b>Foto:</b>
						</p>
						<c:if test="${modelDenunciaAvaliacao.fotoAvaliacao != '' && modelDenunciaAvaliacao.fotoAvaliacao != null}">
						<img alt="Imagem" id="fotoembase64" src="${modelDenunciaAvaliacao.fotoAvaliacao}" width="400px" height="250px">
															</c:if>
															<c:if test="${modelDenunciaAvaliacao.fotoAvaliacao == '' || modelDenunciaAvaliacao.fotoAvaliacao == null}">
															<img alt="Imagen User" id="fotoembase64" src="<%=request.getContextPath()%>/principal/img/semImg.jpg" width="200px" height="100px">
															</c:if>	
						
					</div>

				</div>

			</div>
			<div class="row">
				<div class="col">
					<div id="textcampo">
						<p>
							<b>Descrição:</b>
						</p>
						<textarea id="descricao_denuncia" name="descricao_denuncia"
							class="form-control" maxlength="150" readonly="readonly">${modelDenunciaAvaliacao.descricao}</textarea>
					</div>
					<br />
				</div>
			</div>

			<br />
			<br />
			<br />
			<br />

			<h5>Providencia</h5>
			<hr>
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


			<br />
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
		$("#data").val(dateFormat.toLocaleDateString('pt-BR',{timeZone: 'UTC'}));

}
    </script>

</body>
</html>