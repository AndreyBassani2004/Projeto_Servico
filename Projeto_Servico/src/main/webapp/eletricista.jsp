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
                <h1>Eletricista</h1>
            </div>
        </div>
    </section>

    <section>
        <div class="anuncios">
            <div class="anuncios-c">
                <div class="caixa__pesquisa">
                    <div class="caixa__pesquisa-c">
                        <form action="<%=request.getContextPath()%>/ServletPesquisaPrestadorPublic?" method="get">
                        <input type="hidden" id="acao" name="acao" value="pesquisa4">
									<input type="hidden" id="paginar" name="paginar" value="0">
																		  									  <input type="hidden" id="categoria" name="categoria" value="eletricista"> 
                        <div class="elemento">
                            <label>Cidade:</label>
                            <input type="text" class="form-control" name="cidade" id="cidade" placeholder="Digite o nome da cidade." required="required">
                        </div>
                        <div class="elemento">
                            <label>Estado:</label>
                            <select class="form-control" name="uf" id="uf" required="required">
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
                     <a href="<%=request.getContextPath()%>/ServletPrestadores?acao=perfil&id=${an.id}&paginar=0">
                        <div class="anuncio">
                            <div class="anuncio-c">
                                <div class="anuncio_foto">
                                
                                 <c:if test="${an.foto != '' && an.foto != null}">
															<img alt="Imagen User" id="fotoembase64" src="${an.foto}" class="foto__Anuncio">
															</c:if>
															<c:if test="${an.foto == '' || an.foto == null}">
															<img alt="Imagen User" id="fotoembase64" src="<%=request.getContextPath()%>/Img/semImg.png" class="foto__Anuncio">
															</c:if>
                                </div>
                                <div class="anuncio_elemento">
                                    <div class="anuncio_elemento-t">
                                        <div class="anuncio_elemento-t-T"><h4><c:out value="${an.titulo}"></c:out></h4></div>
                                        <div class="anuncio_elemento-t-N"></div>
                                    </div>
                                    
                                    
                                    
                                    <div class="anuncio_elemento-d">
                                    <p><c:out value="${an.descricao}"></c:out></p>
                                    </div>

                                    
                                    
                                    <div class="anuncio_elemento-c">
                                    <h6><strong>Cidades atendidas:</strong>${an.regiao}</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </a>
                        <br /> 
                    </div>
                      </c:forEach>

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