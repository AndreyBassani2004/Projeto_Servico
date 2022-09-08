<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>PresTec</title>
	 <link rel="icon" type="image/png" href="<%= request.getContextPath() %>/Img/logo_superior.png"/>
	 <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/trabalhe.css">
 	 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
</head>
<body>

	<%@include file="/Componentes/header.jsp"%>
	<div id="titulo">
 	<h1>Trabalhe Conosco</h1>
 	</div>
 	    <div id="linha1"></div>
 	<div id="texto">
 		  <p>Se quer uma maneira fácil de solucionar seus problemas do dia a dia ou uma maneira de arranjar serviço,<br/> 
 		  na <i>PresTec</i> facilitamos a sua procura, contando com profissionais especializados para atender suas <br/>
 		  necessidades diárias, através de uma navegação simples fácil e gratuita.</p><br/>  

          <p>Também ao profissional facilitamos as oportunidades de serviço, com uma página somente de anúncio sobre<br/>
           seu trabalho, além disso o site conta com uma maneira muito fácil de se cadastrar rápido prático e seguro.<p/>  
 	</div>
 	
 	    <div id="linha1"></div>
 	
 	<div id="login">
 		<a href="<%= request.getContextPath() %>/ServletPrestadores?acao=cadastrase"><button type="button" class="btn btn-warning">Cadastrar-se</button></a>
 	</div>
 	
 		<div id="linha1"></div>
 		
 	<%@include file="/Componentes/rodape.jsp"%>
 	
</body>
