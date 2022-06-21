<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
 		<p>Paragrafo 1</p><br>
		<p>Paragrafo 2</p><br>
		<p>Paragrafo 3</p><br>
		<p>Paragrafo 4</p><br>
 	</div>
 	
 	    <div id="linha1"></div>
 	
 	<div id="login">
 		<a href="#"><button type="button" class="btn btn-warning">Cadastrar-se</button></a>
 	</div>
 	
 		<div id="linha1"></div>
 		
 	<%@include file="/Componentes/rodape.jsp"%>
 	
</body>
