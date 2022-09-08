<%@page import="Model.ModelAnuncio"%>
<%@page import="Model.ModelLogin"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PresTec</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>\principal\css\carregarAnuncio.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	 <link rel="icon" type="image/png" href="<%= request.getContextPath() %>/Img/logo_superior.png"/>
	
</head>
<body>
	<%@include file="/principal/Componente/header2.jsp"%>
	<div id="titulo">
		<h1>Fazer alteração anuncio</h1>
	</div>
	<form action="<%=request.getContextPath()%>/ServletCarregaAnuncio"
		method="post" id="cadastroAnuncio" enctype="multipart/form-data">
		<div id="formulario">
			<div id="formulario0">
				<h5>Dados do prestador (conta):</h5>
				<br>
				<table>
					<tr>
						<td>
							<div id="textcampo">
								<p>
									<b>Nome:</b>
								</p>
								<input type="text" class="form-control" name="nome" id="nome"
									value="<%=session.getAttribute("nome")%>" readonly="readonly">
							</div>
						</td>
						<td>
							<div id="textcampo">
								<p>
									<b>ID_Prestador:</b>
								</p>
								<input type="text" class="form-control" name="id_prestador" id="id_prestador"
									value="<%=session.getAttribute("id")%>"
									readonly="readonly">
							</div>
						</td>
					</tr>
					<tr><td>
							<div id="textcampo">
								<p>
									<b>ID Anuncio:</b>
								</p>
								<input type="text" class="form-control" name="id" id="id"
									value="${modelAnuncio.id}"
									readonly="readonly">
							</div>
						</td>
						<td>
							<div id="textcampo">
								<p>
									<b>Situação:</b>
								</p>
								<select class="form-control" name="situacao" id="situacao">
												<option value="">Selecione</option>
											    <option value="ATIVO" <% 
											    ModelAnuncio modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");
											    
											    if (modelAnuncio != null && modelAnuncio.getSituacao().equals("ATIVO")) {
											    	out.print(" ");
											    	out.print("selected=\"selected\"");
											    	out.print(" ");
											    }
											    %>>ATIVO</option>
											    <option value="PAUSADO" <% 
											     modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");
											    
											    if (modelAnuncio != null && modelAnuncio.getSituacao().equals("PAUSADO")) {
											    	out.print(" ");
											    	out.print("selected=\"selected\"");
											    	out.print(" ");
											    }
											    %>>PAUSADO</option>
											    																		
								</select>
								
								<!--  
								<input type="text" class="form-control" name="situacao" id="situacao"
									value="${modelAnuncio.situacao}"
									readonly="readonly"> -->
							</div>
						</td>
						</tr>
				</table>
			</div>
			<br><br>
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
								<input type="text" class="form-control"
						 name="servico" id="servico"
						value="${modelAnuncio.servico}" readonly="readonly">
							</div>
						</td>
						<td>

							<div id="textcampo">
								<p>
									<b>Estado:</b>
								</p>
								<input type="text" class="form-control" name="uf2" id="uf2"
									value="<%=request.getSession().getAttribute("estado").toString()%>"
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
						value="${modelAnuncio.regiao}" required="required">
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
						value="${modelAnuncio.titulo}" required="required">
				</div>

				<div id="textcampo2">
					<p>
						<b>Descrição:</b>
					</p>
					<textarea class="form-control" id="descricao" name="descricao"
						 rows="3">${modelAnuncio.descricao}</textarea>
				</div>
				<br> <br>
			</div>
			<div id="formulario3">
				<h5>Local e contato definido</h5>
				<br>
				<div id="linha2"></div>
				<table id="tabelafrom1">
					<tr>
						<td>
							<div id="textcampo">
								<p>
									<b>Telefone de contato (cadastrado):</b>
								</p>
								<input type="text" class="form-control" name="foneContato"
									id="foneContato"
									value="<%=request.getSession().getAttribute("telefone").toString()%>"
									readonly="readonly">
							</div>
						</td>
						<td>
							<div id="textcampo">
								<p>
									<b>Email para contato:</b>
								</p>
								<input type="text" class="form-control" name="emailContato"
									id="emailContato" value="${modelAnuncio.email_contato}">
							</div>
						</td>
					</tr>
				</table>


			</div>
			<br><br>
			<div id="formulario4">
				<h5>Foto do anuncio</h5>
				<br>
				<div id="linha2"></div>
				<table id="tabelafrom1">
					<tr>
						<td>
							<div id="textcampo">
								<p>
									<b>Foto Anuncio:</b>
								</p>
								 <c:if test="${modelAnuncio.foto != '' && modelAnuncio.foto != null}">
															<img alt="Imagen User" id="fotoembase64" src="${modelAnuncio.foto}" width="480px" height="350px">
															</c:if>
															<c:if test="${modelAnuncio.foto == '' || modelAnuncio.foto == null}">
															<img alt="Imagen User" id="fotoembase64" src="<%=request.getContextPath()%>/principal/img/semImg.png" width="480px" height="350px">
															</c:if>
							</div>
						</td>
						<td>
							<div id="textcampo">
								<p>
									<b>Alterar Arquivo:</b>
								</p>
	<input type="file" id="fileFoto" name="fileFoto" accept="image/*" onchange="visualizarImg('fotoembase64', 'fileFoto');" class="form-control-file" style="margin-top: 15px; margin-left: 5px;">
								
							</div>
						</td>
					</tr>
				</table>
			</div>
			
			
			<div id="linha1"></div>

			<br>
				<div id="linha2"></div>
			
			<div id="button">
				<button type="submit"
					class="btn btn-warning">Alterar</button>
			</div>
			<div id="spam">
				<spam>${msg}</spam>
			</div>
		</div>
	</form>
	
				<div id="linha1"></div>
	
	
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