<%@page import="Model.ModelAnuncio"%>
<%@page import="Model.ModelLogin"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PresTec</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/alvenaria.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/alvenariaStyle.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	 <link rel="icon" type="image/png" href="<%= request.getContextPath() %>/Img/logo_superior.png"/>
	
</head>
<body>
	<%@include file="/Componentes/header.jsp"%>

	<section>
		<div class="titulo">
			<div class="titulo-c">
				<h1>Encanador</h1>
			</div>
		</div>
	</section>	
	
	<section>
		<div class="anuncios">
			<div class="anuncios-c">
				<div class="caixa__pesquisa">
					<div class="caixa__pesquisa-c">
						<form action="<%=request.getContextPath()%>/ServletPesquisaPrestadorPublic?" method="get">
                       	<input type="hidden" id="acao" name="acao" value="pesquisa2">
						<input type="hidden" id="paginar" name="paginar" value="0">
															  <input type="hidden" id="categoria" name="categoria" value="encanador">
							<div class="elemento">
								<label>Cidade:</label> <input type="text" class="form-control"
									name="cidade" id="cidade"
									placeholder="Digite o nome da cidade."
									value="${modelAnuncio.cidade_pesquisa}" required="required">
							</div>
							<div class="elemento">
								<label>Estado:</label>
								<select class="form-control" name="uf" id="uf">
									<option value="">Selecione</option>
									<option value="AC"
										<% 
										ModelAnuncio modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");

										
										modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");


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
							<div class="elemento">
								<label></label>
								<button type="submit" class="btn btn-primary mb-2">Pesquisar</button>
							</div>
						</form>
					</div>
				</div>
				<hr>
				<div class="anuncios2">
					<div class="anuncios2-c">
							<c:forEach items="${modelAnuncios}" var="an">
							<div>
								<a
									href="<%=request.getContextPath()%>/ServletPrestadores?acao=perfil&id=${an.id}&paginar=0">
									<div class="anuncio">
										<div class="anuncio-c">
											<div class="anuncio_foto">
												<c:if test="${an.foto != '' && an.foto != null}">
													<img alt="Imagen User" id="fotoembase64" src="${an.foto}"
														class="foto__Anuncio">
												</c:if>
												<c:if test="${an.foto == '' || an.foto == null}">
													<img alt="Imagen User" id="fotoembase64"
														src="<%=request.getContextPath()%>/Img/semImg.png"
														class="foto__Anuncio">
												</c:if>
											</div>
											<div class="anuncio_elemento">
												<div class="anuncio_elemento-t">
													<div class="anuncio_elemento-t-T">
														<h4>
															<c:out value="${an.titulo}"></c:out>
														</h4>
													</div>
													<div class="anuncio_elemento-t-N"></div>
												</div>



												<div class="anuncio_elemento-d">
													<p>
														<c:out value="${an.descricao}"></c:out>
													</p>
												</div>



												<div class="anuncio_elemento-c">
													<h6>
														<strong>Cidades atendidas:</strong>${an.regiao}
													</h6>
												</div>
											</div>
										</div>
									</div>
								</a> <br />
							</div>
						</c:forEach>

					</div>

					<nav aria-label="Page navigation example" style="">
						<ul class="pagination">

							<%
														
						 	String categoria_pesquisa = request.getParameter("modelAnuncio.categoria_pesquisa");
								
							int totalPagina = (int) request.getAttribute("totalPagina");
							
							for (int p = 0; p < totalPagina; p++){
								String url = request.getContextPath()+ "/ServletPesquisaPrestadorPublic?acao=pagina&paginar=" + (p * 5) + "&categoria=" + modelAnuncio.getCategoria_pesquisa() + "&cidade=" + 
							    modelAnuncio.getCidade_pesquisa() + "&uf=" + modelAnuncio.getEstado_pesquisa();
								out.print("<li class=\"page-item\"><a class=\"page-link\" href=\""+url+"\">"+(p + 1)+" </a></li>");	}	
							%>


						</ul>
					</nav>
				</div>
			</div>
		</div>
	</section>

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