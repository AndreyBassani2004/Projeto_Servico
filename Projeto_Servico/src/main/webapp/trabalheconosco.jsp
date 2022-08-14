<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<head>
<meta charset="ISO-8859-1">
<title>PresTec</title>
	 <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/trabalhe.css">
 	 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
</head>
<body>

	<%@include file="/Componentes/header.jsp"%>
	<div id="titulo">
 	<h1>Trabalhe Conosco</h1>
 	</div>
 	    <div id="linha1"></div>
 	<div id="texto" style="align-items: flex-start; text-align: left;">
 		  <p>Se quer uma maneira f�cil de solucionar seus problemas do dia a dia ou uma maneira de arranjar servi�o,<br/> 
 		  na <i>PresTec</i> facilitamos a sua procura, contando com profissionais especializados para atender suas <br/>
 		  necessidades di�rias, atrav�s de uma navega��o simples f�cil e gratuita.</p><br/>  

          <p>Tamb�m ao profissional facilitamos as oportunidades de servi�o, com uma p�gina somente de an�ncio sobre<br/>
           seu trabalho, al�m disso o site conta com uma maneira muito f�cil de se cadastrar r�pido pr�tico e seguro.<p/>  
 	</div>
 	
 	    <div id="linha1"></div>
 	
 	<div id="login">
 		<a href="<%= request.getContextPath() %>/cadastrase.jsp"><button type="button" class="btn btn-warning">Cadastrar-se</button></a>
 	</div>
 	
 		<div id="linha1"></div>
 		
 	<%@include file="/Componentes/rodape.jsp"%>
 	
</body>
