<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>\principal\css\headerTarefa.css">
    <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
    <div id="barra">
        <div id="fotoNome">
        <img src="<%=request.getContextPath()%>/principal/img/user.jpg" alt="foto user"><br><br>
        <p><%= session.getAttribute("usuario")%></p>
        <nav class="dp-menu">
            <ul>
                <li id="menu-cr"><a href="#">Menu</a>
                    <ul>
                        <li><a href="#" id="opcao">Perfil</a></li>
                        <li><a href="<%=request.getContextPath()%>\principal\cadastroUser.jsp" id="opcao">Cadastra usuarios (ADM)</a></li>
                        <li><a href="#" id="opcao">Validar Avaliações</a></li>
                        <li><a href="#" id="opcao">Avaliações Denunciadas</a></li>
                        <li><a href="#" id="opcao">Anuncio Denunciados</a></li>
                        <li ><a href="ServletLogin?acao=logout" id="sair">Sair</a></li>
                    </ul>
                </li>
            </ul>
        </nav>      
        </div>
        <div id="t1">
                <br>
                <div id="imgt1"><img src="#" alt="Logo"></div><br><br><br>
                <h2>CENTRAL DE ATENDIMENTO</h2>
               <h3>(11)12345-6789</h3>
            </div>
    </div>
    <div id="barraDiv"></div>
</body>
</html>