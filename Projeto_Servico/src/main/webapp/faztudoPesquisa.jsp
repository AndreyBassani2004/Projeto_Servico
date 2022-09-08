<%@page import="Model.ModelAnuncio"%>
<%@page import="Model.ModelLogin"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PresTec</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/alvenaria.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
	<%@include file="/Componentes/header.jsp"%>

	<div id="titulo">
		<h1>
			FazTudo
		</h1>
	</div>

	<div id="linha1"></div>

	<div class="listaBarra">
		<div class="listaBarra-c">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="card mb-3"
							style="min-height: 800px; min-width: 700px;">
							<div class="row g-0">


								<c:forEach items="${modelAnuncios}" var="an">
									<div class="col-md-4">
										 <c:if test="${an.foto != '' && an.foto != null}">
															<img alt="Imagen User" id="fotoembase64" src="${an.foto}" width="250px" height="140px" >
															</c:if>
															<c:if test="${an.foto == '' || an.foto == null}">
															<img alt="Imagen User" id="fotoembase64" src="<%=request.getContextPath()%>/Img/semImg.png" width="250px" height="140px">
															</c:if>
									</div>
									<div class="col-md-8">
										<div class="card-body">
											<h5 class="card-title">
												<c:out value="${an.titulo}"></c:out>
											</h5>
											<p class="card-text">
												<c:out value="${an.descricao}"></c:out>
											</p>
											<p class="card-text">
												<small class="text-muted"><a href="<%=request.getContextPath()%>/ServletPrestadores?acao=perfil&id=${an.id}&paginar=0"> <button type="button"
														class="btn btn-secondary">Conhecer</button></a></small>
											</p>
										</div>
									</div>
								</c:forEach>

							</div>
						</div>
						<nav aria-label="Page navigation example" style="">
							<ul class="pagination">
								
								<%	
									//ServletPesquisaPrestadorPublic?acao=pesquisa&paginar=0&categoria=alvenaria&cidade=abc&uf=AC	
									
									ModelAnuncio modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");
									
								 	String categoria_pesquisa = request.getParameter("modelAnuncio.categoria_pesquisa");
 									
									int totalPagina = (int) request.getAttribute("totalPagina");
									
									for (int p = 0; p < totalPagina; p++){
										String url = request.getContextPath()+ "/ServletPesquisaPrestadorPublic?acao=pagina3&paginar=" + (p * 5) + "&categoria=" + modelAnuncio.getCategoria_pesquisa() + "&cidade=" + 
									    modelAnuncio.getCidade_pesquisa() + "&uf=" + modelAnuncio.getEstado_pesquisa();
										out.print("<li class=\"page-item\"><a class=\"page-link\" href=\""+url+"\">"+(p + 1)+" </a></li>");									}
								
								%>
								
								
							</ul>
						</nav>
					</div>
					<div class="col">
						<div class="card mb-3"
							style="min-width: 360px; min-height: 800px;">
							<div class="row g-0">
								<form action="<%=request.getContextPath()%>/ServletPesquisaPrestadorPublic?" method="get" class="col-md-4" id="form_pesquisa">
									<input type="hidden" id="acao" name="acao" value="pesquisa3">
									<input type="hidden" id="paginar" name="paginar" value="0">   
									<h5>
										<b>Pesquisar</b>
									</h5>
									<br /> <br /> <br />
									  <input type="hidden" id="categoria" name="categoria" value="faztudo"> 
									<div id="text_campo">
										<label>Cidade:</label><input type="text" class="form-control" name="cidade" id="cidade" value="${modelAnuncio.cidade_pesquisa}"
											placeholder="Digite o nome da cidade." style="width: 250px;" required="required">
									</div>
									<br />
									<div id="textcampo">
										<p>Estado:</p>
										<select class="form-control" name="uf" id="uf">
									<option value="">Selecione</option>
									<option value="AC"
										<% modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");


if (modelAnuncio != null && modelAnuncio.getEstado_pesquisa().equals("AC")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>AC</option>
									<option value="AL"
										<%modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

if (modelAnuncio != null && modelAnuncio.getEstado_pesquisa().equals("AL")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>AL</option>
									<option value="AP"
										<%modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

if (modelAnuncio != null && modelAnuncio.getEstado_pesquisa().equals("AP")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>AP</option>
									<option value="AM"
										<%modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

if (modelAnuncio != null && modelAnuncio.getEstado_pesquisa().equals("AM")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>AM</option>
									<option value="BA"
										<%modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

if (modelAnuncio != null && modelAnuncio.getEstado_pesquisa().equals("BA")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>BA</option>
									<option value="CE"
										<%modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

if (modelAnuncio != null && modelAnuncio.getEstado_pesquisa().equals("CE")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>CE</option>
									<option value="DF"
										<%modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

if (modelAnuncio != null && modelAnuncio.getEstado_pesquisa().equals("DF")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>DF</option>
									<option value="ES"
										<%modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

if (modelAnuncio != null && modelAnuncio.getEstado_pesquisa().equals("ES")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>ES</option>
									<option value="GO"
										<%modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

if (modelAnuncio != null && modelAnuncio.getEstado_pesquisa().equals("GO")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>GO</option>
									<option value="MA"
										<%modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

if (modelAnuncio != null && modelAnuncio.getEstado_pesquisa().equals("MA")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>MA</option>
									<option value="MT"
										<%modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

if (modelAnuncio != null && modelAnuncio.getEstado_pesquisa().equals("MT")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>MT</option>
									<option value="MS"
										<%modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

if (modelAnuncio != null && modelAnuncio.getEstado_pesquisa().equals("MS")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>MS</option>
									<option value="MG"
										<%modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

if (modelAnuncio != null && modelAnuncio.getEstado_pesquisa().equals("MG")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>MG</option>
									<option value="PA"
										<%modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

if (modelAnuncio != null && modelAnuncio.getEstado_pesquisa().equals("PA")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>PA</option>
									<option value="PB"
										<%modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

if (modelAnuncio != null && modelAnuncio.getEstado_pesquisa().equals("PB")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>PB</option>
									<option value="PR"
										<%modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

if (modelAnuncio != null && modelAnuncio.getEstado_pesquisa().equals("PR")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>PR</option>
									<option value="PE"
										<%modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

if (modelAnuncio != null && modelAnuncio.getEstado_pesquisa().equals("PE")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>PE</option>
									<option value="PI"
										<%modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

if (modelAnuncio != null && modelAnuncio.getEstado_pesquisa().equals("PI")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>PI</option>
									<option value="RJ"
										<%modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

if (modelAnuncio != null && modelAnuncio.getEstado_pesquisa().equals("RJ")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>RJ</option>
									<option value="RN"
										<%modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

if (modelAnuncio != null && modelAnuncio.getEstado_pesquisa().equals("RN")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>RN</option>
									<option value="RS"
										<%modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

if (modelAnuncio != null && modelAnuncio.getEstado_pesquisa().equals("RS")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>RS</option>
									<option value="RO"
										<%modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

if (modelAnuncio != null && modelAnuncio.getEstado_pesquisa().equals("RO")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>RO</option>
									<option value="RR"
										<%modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

if (modelAnuncio != null && modelAnuncio.getEstado_pesquisa().equals("RR")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>RR</option>
									<option value="SC"
										<%modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

if (modelAnuncio != null && modelAnuncio.getEstado_pesquisa().equals("SC")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>SC</option>
									<option value="SP"
										<%modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

if (modelAnuncio != null && modelAnuncio.getEstado_pesquisa().equals("SP")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>SP</option>
									<option value="SE"
										<%modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

if (modelAnuncio != null && modelAnuncio.getEstado_pesquisa().equals("SE")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>SE</option>
									<option value="TO"
										<%modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

if (modelAnuncio != null && modelAnuncio.getEstado_pesquisa().equals("TO")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>TO</option>
								</select>
									</div>
									<div id="linha2"></div>
									<div id="textcampo">
										<button type="submit" class="btn btn-primary">Pesquisar</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

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