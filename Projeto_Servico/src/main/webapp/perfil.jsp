<%@page import="Model.ModelAnuncio"%>
<%@page import="Model.ModelAvaliacao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="<c:url value='/css/anuncioStyle.css'/>" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/Img/logo_superior.png" />
<title>PresTec</title>
</head>
<body>

	<%@include file="/Componentes/header.jsp"%>

	<section>
		<div class="row" style="width: 100%; height: 100px">
		</div>
	</section>

	<section>
        <div class="anuncio">
            <div class="anuncio-c" class="row">
                <div class="anuncio__Detalhes" class="col">
                    <div class="anuncio__Detalhes-c" >
                        <div class="titulo__anuncio-c">
                            <h1>${modelAnuncio.titulo}</h1>
                            <p>Cód<span> ${modelAnuncio.id}</span></p>
                        </div>
                        <div class="foto__anuncio-c">
                            <c:if test="${modelAnuncio.foto != '' && modelAnuncio.foto != null}">
										<img alt="Imagen User" id="fotoembase64" src="${modelAnuncio.foto}" class="foto__Anuncio">
															</c:if>
															<c:if test="${modelAnuncio.foto == '' || modelAnuncio.foto == null}">
															<img alt="Imagen User" id="fotoembase64" src="<%=request.getContextPath()%>/principal/img/semImg.png" class="foto__Anuncio">
															</c:if>
                        </div>
                        <hr class="hr_separador">
                        <div class="descricao-c">
                            <h4>Descrição</h4>
                            <p>${modelAnuncio.descricao}</p>

                        </div>
                        <hr class="hr_separador">
                        <div class="detalhe-c">
                            <h4>Detalhes</h4><br><br>

                             <h5>Estado: <strong>${modelAnuncio.estado}</strong></h5><br><br>
                            <h5>Cidades atendidas: ${modelAnuncio.regiao}</h5>
                        </div>
                        <hr class="hr_separador">


                        <div class="contato__Anuncio2">
                            <div class="contato__Anuncio-c2">
                                <div class="nota__anuncio2">
                                    <div class="nota__anuncio-c2">
                                        <p>Nota Média <span><b>${modelAvaliacao.nota_media}</b></span></p>
                                    </div>
                                </div>
                                <div class="dados__prestador2">
                                    <div class="dados__prestador-c2">
                                    <div class="descricao__dados__prestador2"><br>
                                         <h2>Nome: ${modelAnuncio.nome_prestador}</h2><br/><br/>
                                        <h2>Fone: ${modelAnuncio.telefone_prestador}</h2><br/><br/>
                                        <h2>Email: ${modelAnuncio.email_contato}</h2><br/><br/>
                                    </div>
                                    <div class="opcoes__anuncio2">
                                        <button class="btn btn-warning" style="width: 200px;">Entre em contato</button><br/><br/>
                                        <a href="<%=request.getContextPath()%>/ServletPrestadores?acao=avaliar&id=${modelAnuncio.id}"><button class="btn btn-success" style="width: 200px;">Avaliar</button></a><br/><br/>
                                        <a href="<%=request.getContextPath()%>/ServletPrestadores?acao=denuncia&id=${modelAnuncio.id}"><button class="btn btn-danger" style="width: 200px;">Denunciar</button></a><br/><br/>
                                    </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>

                        <hr class="hr_separador2">

                        <div class="avaliacoes" style=" height: 933px;"> 
                        <div class="avaliacoes-c">
                        
                           
                                <h4>Avaliações</h4> <br/><br/>
                                <c:forEach items="${modelAvaliacaos}" var="av">
                                <div class="avaliacao">
                                    <div class="descricao__avaliacao">
                                        <h4><c:out value="${av.titulo}"></c:out></h4>
                                        <p><c:out value="${av.descricao}"></c:out></p>
                                    </div>
                                    <div class="nome_avaliacao">
                                        <h6 class="nome_avaliacao_1">Nome: <c:out value="${av.nome_cliente}"></c:out></h6>
                                        <h6 class="nome_avaliacao_2">Nota: <c:out value="${av.nota}"></c:out></h6>
                                    </div>
                                </div>
                             
                                </c:forEach>
                                <div class="paginacao">
                               <ul class="pagination">
				
				<%	
			   						ModelAnuncio modelAnuncio = (ModelAnuncio) request.getAttribute("modelAnuncio");
				
									int totalPagina = (int) request.getAttribute("totalPagina");
				
									for (int p = 0; p < totalPagina; p++){
										String url = request.getContextPath()+ "/ServletPrestadores?acao=perfil&id="+modelAnuncio.getId()+"&paginar=" + (p * 5);
										out.print("<li class=\"page-item\"><a class=\"page-link\" href=\""+url+"\">"+(p + 1)+" </a></li>");									}
								
								%>


			</ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="contato__Anuncio" class="col">
                    <div class="contato__Anuncio-c">
                        <div class="nota__anuncio">
                            <div class="nota__anuncio-c">
                                 <p>Nota Média <span><b>${modelAvaliacao.nota_media}</b></span></p>
                            </div>
                        </div>
                        <div class="dados__prestador">
                            <div class="dados__prestador-c">
                            <div class="descricao__dados__prestador"><br>
                                <h2>Nome:<br> ${modelAnuncio.nome_prestador}</h2><br/>
                                <h2>Fone:<br> ${modelAnuncio.telefone_prestador}</h2><br/>
                                <h2>Email: <br/> ${modelAnuncio.email_contato} </h2><br/>
                            </div>
                            <div class="opcoes__anuncio">
                                <button class="btn btn-warning" style="width: 200px;">Entre em contato</button><br/>
                                <a href="<%=request.getContextPath()%>/ServletPrestadores?acao=avaliar&id=${modelAnuncio.id}"><button class="btn btn-success" style="width: 200px; margin-top: 12px;">Avaliar</button></a><br/>
                               <a href="<%=request.getContextPath()%>/ServletPrestadores?acao=denuncia&id=${modelAnuncio.id}"><button class="btn btn-danger" style="width: 200px; margin-top: 12px;">Denunciar</button></a><br/>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <section>
		<div class="row" style="width: 100%; height: 100px">
		</div>
	</section>

	<%@include file="/Componentes/rodape.jsp"%>

</body>
</html>