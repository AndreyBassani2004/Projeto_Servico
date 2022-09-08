<%@page import="Model.ModelMensagem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PresTec</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>\principal\css\msgStyle.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	 <link rel="icon" type="image/png" href="<%= request.getContextPath() %>/Img/logo_superior.png"/>
	
</head>
<body>

	<%@include file="/principal/Componente/header2.jsp"%>

	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>Mensangens</h1>
			</div>
		</div>
	</div>

	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<div class="container">
	
		<div style="min-height: 800px; min-width: 700px;">
			<div class="row g-0">
				
						<div style="min-height: 800px; min-width: 700px;">
			<div class="row g-0">
				<c:forEach items="${ModelMensagems}" var="an">
						
						<div class="p-5 mb-4 bg-light rounded-3" style="min-height: 200px; min-width: 900px; border: 0.1em; border-color: black;">
							<div class="container-fluid py-5">
								<h1 class="display-5 fw-bold">${an.titulo}</h1>
								<p class="col-md-8 fs-4">${an.mensagem}</p>
							</div>
						</div>
						<br/> <br/> <br/>
				</c:forEach>

			</div>
		</div>
						<br/> <br/> <br/>
						

			</div>
		</div>
		
	
	
	<nav aria-label="Page navigation example" style="">
							<ul class="pagination">
								
								<%	
								
								
									int totalPagina = (int) request.getAttribute("totalPagina");

				for (int p = 0; p < totalPagina; p++) {
					String url = request.getContextPath() + "/ServletCarregarRequisicao?acao=carregarMensagem&id_user="
					+ request.getSession().getAttribute("id") + "&paginar=" + (p * 5);
					out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"" + url + "\">" + (p + 1) + " </a></li>");
				}
							%>	
								
							</ul>
						</nav>
		</div>
		<br/> <br/> <br/>		<br/> <br/> <br/>
		
			<%@include file="/Componentes/rodape.jsp"%>
		
</body>
</html>