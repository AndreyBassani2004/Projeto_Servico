<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
@charset "ISO-8859-1";

body {
    width: 100%;
    margin: 0;
    padding: 0;
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

#texto{
	font-family: 'Times New Roman', Times, serif;
    text-align: center;  
    margin-left: auto;
    margin-right: auto;
    font-size: 25px;  
}


#espaco{
	align-items: center;
    justify-content: space-between;
    background-color: #ffff;
    padding: 1em;
}
</style>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/quemsomos.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" 
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>

	<%@include file="/Componentes/header.jsp"%>
	<div id="titulo">
		<h1>Quem Somos ?</h1>
		<br>
	</div>
	<div id="espaco"></div>
	<div id="texto">
		<h1>Nosso objetivo</h1><br><br>
		<p>Paragrafo 1</p><br>
		<p>Paragrafo 2</p><br>
		<p>Paragrafo 3</p><br>
		<p>Paragrafo 4</p><br>
	</div>
	<div id="espaco"></div>
	
		 	<%@include file="/Componentes/rodape.jsp"%>

</body>
</html>