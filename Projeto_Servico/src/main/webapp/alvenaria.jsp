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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	 <link rel="icon" type="image/png" href="<%= request.getContextPath() %>/Img/logo_superior.png"/>
	
</head>
<body>
	<%@include file="/Componentes/header.jsp"%>

	<div id="titulo">
		<h1>
			Alvenaria
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
															<img alt="Imagen User" id="fotoembase64" src="${an.foto}" width="247px" height="137px" style="border-radius: 8px; margin: 5px;">
															</c:if>
															<c:if test="${an.foto == '' || an.foto == null}">
															<img alt="Imagen User" id="fotoembase64" src="<%=request.getContextPath()%>/Img/semImg.png" width="247px" height="137px" style="border-radius: 8px; margin: 5px;">
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
								
									int totalPagina = (int) request.getAttribute("totalPagina");
									
									for (int p = 0; p < totalPagina; p++){
										String url = request.getContextPath()+ "/ServletPrestadores?acao=paginar&pagina=" + (p * 5) + "&categoria=alvenaria";
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
									<input type="hidden" id="acao" name="acao" value="pesquisa">
									<input type="hidden" id="paginar" name="paginar" value="0">  
									<h5>
										<b>Pesquisar</b>
									</h5>
									<br /> <br /> <br />
									  <input type="hidden" id="categoria" name="categoria" value="alvenaria"> 
									<div id="text_campo">
										<label>Cidade:</label><input type="text" class="form-control" name="cidade" id="cidade"
											placeholder="Digite o nome da cidade." style="width: 250px;" required="required">
									</div>
									<br />
									<div id="textcampo">
										<p>Estado:</p>
										<select class="form-control" name="uf" id="uf"
											style="width: 250px;" required="required">
											<option value="">Selecione</option>
											<option value="AC">AC</option>
											<option value="AL">AL</option>
											<option value="AP">AP</option>
											<option value="AM">AM</option>
											<option value="BA">BA</option>
											<option value="CE">CE</option>
											<option value="DF">DF</option>
											<option value="ES">ES</option>
											<option value="GO">GO</option>
											<option value="MA">MA</option>
											<option value="MT">MT</option>
											<option value="MS">MS</option>
											<option value="MG">MG</option>
											<option value="PA">PA</option>
											<option value="PB">PB</option>
											<option value="PR">PR</option>
											<option value="PE">PE</option>
											<option value="PI">PI</option>
											<option value="RJ">RJ</option>
											<option value="RN">RN</option>
											<option value="RS">RS</option>
											<option value="RO">RO</option>
											<option value="RR">RR</option>
											<option value="SC">SC</option>
											<option value="SP">SP</option>
											<option value="SE">SE</option>
											<option value="TO">TO</option>
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