<%@page import="Model.ModelLogin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <c:set scope="session" var="perfil" value='<%= request.getSession().getAttribute("perfil").toString() %>'></c:set>
    <c:set scope="session" var="isAdmin" value='<%= request.getSession().getAttribute("isAdmin").toString() %>'></c:set>
   
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
	<title>PresTec</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>\principal\css\headerTarefa.css">
    <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
    <div id="barra">
        <div id="fotoNome">
        <c:if test="${fotouser != '' && fotouser != null}">
															<img alt="Imagen User" id="fotoembase64" src="${fotouser}" width="70px">
															</c:if>
															<c:if test="${fotouser == '' || fotouser == null}">
															<img alt="Imagen User" id="fotoembase64" src="<%=request.getContextPath()%>/principal/img/user.jpg" width="70px">
															</c:if>
        
        <br><br>
        <p><%= session.getAttribute("nome") %></p>
        <nav class="dp-menu">
            <ul>
                <li id="menu-cr"><a href="<%=request.getContextPath()%>/principal/principal.jsp">Menu</a>
                    <ul>
                    	<c:if test="${perfil == 'PRESTADOR' && situacao_user == 'ATIVO'}">
                    	<c:if test="${perfil == 'PRESTADOR' && situacao_user == 'ATIVO'}">
                        <li><a href="<%=request.getContextPath()%>\principal\perfil.jsp" id="opcao">Perfil</a></li>
                        <li><a href="<%=request.getContextPath()%>\ServletCarregarRequisicao?acao=carregarMensagem&id_user=<%= session.getAttribute("id")%>&paginar=0" id="opcao">Mensagens</a></li>
                          </c:if>
                        <li><a href="<%=request.getContextPath()%>\ServletCarregarRequisicao?acao=carregarCriarAnuncio&id_user=<%= session.getAttribute("id")%>&paginar=0" id="opcao">Criar Anuncio</a></li>
                        <li><a href="<%=request.getContextPath()%>\ServletCarregaAnuncio?acao=listarAnuncio&id_user=<%= session.getAttribute("id")%>&paginar=0" id="opcao">Meus Anuncios</a></li>
                        <li><a href="<%=request.getContextPath()%>\ServletCarregarRequisicao?acao=carregarMinhasAvaliacoes&id_user=<%= session.getAttribute("id")%>&paginar=0" id="opcao">Avaliações</a></li>
                        </c:if>  
                        <c:if test="${perfil == 'ADMIN' && situacao_user == 'ATIVO'}">
                        <li><a href="<%=request.getContextPath()%>\principal\perfilAdm.jsp" id="opcao">Perfil</a></li>
                        </c:if>
                        <c:if test="${isAdmin}">
                        <li><a href="<%=request.getContextPath()%>\principal\cadastroUser.jsp" id="opcao">Cadastra usuarios (ADM)</a></li>
                        <li><a href="<%=request.getContextPath()%>\ServletGerenciarConta?acao=carregarUsuariosAdms&id_user=<%= session.getAttribute("id")%>&paginar=0" id="opcao">Gerenciar usuarios Administradores</a></li>
                        </c:if>
                        <c:if test="${perfil == 'ADMIN' && situacao_user == 'ATIVO'}">
                        <li><a href="<%=request.getContextPath()%>\ServletCarregarRequisicao?acao=carregarDenunciasAprovada&id_user=<%= session.getAttribute("id")%>&paginar=0" id="opcao">Providencia denuncias anuncio aprovado</a></li>
                        <li><a href="<%=request.getContextPath()%>\ServletCarregarRequisicao?acao=carregarAvaliacoes&id_user=<%= session.getAttribute("id")%>&paginar=0" id="opcao">Validar Avaliações</a></li>
                        <li><a href="<%=request.getContextPath()%>\ServletCarregarRequisicao?acao=carregarDenunciaAvaliacoes&id_user=<%= session.getAttribute("id")%>&paginar=0" id="opcao">Avaliações Denunciadas</a></li>
                        <li><a href="<%=request.getContextPath()%>\ServletCarregarRequisicao?acao=carregarDenuncias&id_user=<%= session.getAttribute("id")%>&paginar=0" id="opcao">Anuncio Denunciados</a></li>
                        </c:if>
                        <li><a href="<%=request.getContextPath()%>\ServletLogin?acao=logout" id="sair">Sair</a></li>
                    </ul>
                </li>
            </ul>
        </nav>      
        </div>
        <!--
        <div id="t1">
                <br>
                <div id="imgt1"><img src="#" alt="Logo"></div><br><br><br>
                <h2>CENTRAL DE ATENDIMENTO</h2>
               <h3>(11)12345-6789</h3>
            </div>  -->
    </div>
    <div id="barraDiv"></div>
    
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