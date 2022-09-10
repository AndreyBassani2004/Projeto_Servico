<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


    
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
            <li><a href="<%= request.getContextPath() %>/ServletPrestadores?acao=inicio">INICIO</a></li>
            <li><a href="<%= request.getContextPath() %>/ServletPrestadores?acao=trabalheConosco">TRABALHE CONOSCO</a></li>
            <li><a href="<%= request.getContextPath() %>/ServletPrestadores?acao=quemsomos">QUEM SOMOS</a></li>
            
          </ul>
    </nav>
	
	<div id="navMobile">
	   <ul>
            <li><a href="<%= request.getContextPath() %>/ServletPrestadores?acao=inicio">INICIO</a></li>
            <li><a href="<%= request.getContextPath() %>/ServletPrestadores?acao=trabalheConosco">TRABALHE CONOSCO</a></li>
            <li><a href="<%= request.getContextPath() %>/ServletPrestadores?acao=quemsomos">QUEM SOMOS</a></li>
            
          </ul>
	</div>
	
    <div id="barra2"></div>