<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PresTec</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/principal/css/principalpag.css">
	 <link rel="icon" type="image/png" href="<%= request.getContextPath() %>/Img/logo_superior.png"/>
	
</head>
<body>
	<%@include file="/principal/Componente/header2.jsp"%>
	<div id="titulo">
	<h1><% 
		
		String situacao = request.getSession().getAttribute("situacao_user").toString();		 
	
		if(situacao.equals("ATIVO")){
			out.print("Seja, Bem Vindo(a)!");
		}else if(situacao.equals("DESATIVADO")){
			out.print("Sua conta foi banido, por violações as regras.");
		}else{
			out.print("Seja, Bem Vindo!");
		}
	
	%></h1>
	</div>
	<%@include file="/Componentes/rodape.jsp"%>
</body>
</html>