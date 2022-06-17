<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
<meta charset="ISO-8859-1">
<link href="<%= request.getContextPath() %>\css\header.css" rel="stylesheet" type="text/css">
<title></title>
</head>
<body>

 <header>
        <div id="img"><img src="./img/#" alt="Logo" width="320" height="=240"></div>
        <div id="t1">
            <h2 style="font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;" size="15">CENTRAL DE ATENDIMENTO</h2>
           <h3 style="font-family:cursive; padding: 0.1em 5.0em;" size="10">(11)12345-6789</h3>
        </div>        
    </header>
	
	<div id="barra1"></div>
	
	<nav>	
        <ul>
            <li><a href="<%= request.getContextPath() %>/index.jsp">INICIO</a></li>
            <li><a href="./quemsomos.html">QUEM SOMOS</a></li>
            <li><a href="./trabalheconosco.html">TRABALHE CONOSCO</a></li>
          </ul>
    </nav>
	
	<div id="navMobile">
	   <ul>
            <li><a href="<%= request.getContextPath() %>/index.jsp">INICIO</a></li>
            <li><a href="./quemsomos.html">QUEM SOMOS</a></li>
            <li><a href="./trabalheconosco.html">TRABALHE CONOSCO</a></li>
          </ul>
	</div>
	
    <div id="barra2"></div>

</body>
