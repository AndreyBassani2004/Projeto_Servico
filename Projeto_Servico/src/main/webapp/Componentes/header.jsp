<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


    
<link href="<%= request.getContextPath() %>/css/header.css" rel="stylesheet" type="text/css">
 <header>
        <div id="img"><img src="<%= request.getContextPath() %>/Img/logo.png" alt="Logo" width="150" height="=150" style="margin: 0.01em"></div>
        <div id="t1">
            <h2>CENTRAL DE ATENDIMENTO</h2>
           <h3>(11)12345-6789</h3>
        </div>        
    </header>
	
	<div id="barra1"></div>
	
	<nav>	
        <ul>
            <li><a href="<%= request.getContextPath() %>/index.jsp">INICIO</a></li>
            <li><a href="<%= request.getContextPath() %>/index.jsp#planos">ANUNCIE CONOSCO</a></li>
            <li><a href="<%= request.getContextPath() %>/index.jsp#somos">QUEM SOMOS</a></li>
            <li><a href="<%= request.getContextPath() %>/login.jsp">LOGIN</a></li>
          </ul>
    </nav>
	
	<div id="navMobile">
	   <ul>
            <li><a href="<%= request.getContextPath() %>/index.jsp">INICIO</a></li>
            <li><a href="<%= request.getContextPath() %>/index.jsp#planos">ANUNCIE CONOSCO</a></li>
            <li><a href="<%= request.getContextPath() %>/index.jsp#somos">QUEM SOMOS</a></li>
            <li><a href="<%= request.getContextPath() %>/login.jsp">LOGIN</a></li>
          </ul>
	</div>
	
    <div id="barra2"></div>
    