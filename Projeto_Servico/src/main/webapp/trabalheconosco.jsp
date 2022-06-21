<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
@charset "ISO-8859-1";

body {
    width: 50%;
    margin: 0;
    padding: 0;
    background-color: black;
}

#titulo h1{
	font-family: 'Times New Roman', Times, serif;
    text-align: center;  
    margin-left: auto;
    margin-right: auto;
    margin-top: 0.9em;
    margin-bottom: 0.5em;
    font-size: 50px;   
}

#texto p{
	font-family: 'Times New Roman', Times, serif;
    text-align: center;  
    margin-left: auto;
    margin-right: auto;
    font-size: 25px;  
}

#linha1{
	align-items: center;
    justify-content: space-between;
    background-color: #ffff;
    padding: 2em;
}

#login{
	text-align: center;  
    margin-left: auto;
    margin-right: auto;
}
</style>
	 <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/trabalheconosco.css">	
 	 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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