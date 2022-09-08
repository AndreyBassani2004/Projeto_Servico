<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
	width: 100%;
	padding: 0;
	margin: 0;
}

.linha1 {
	align-items: center;
	justify-content: space-between;
	background-color: #ffff;
	padding: 3em;
}
</style>
<meta charset="UTF-8">
<title>PresTec</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	 <link rel="icon" type="image/png" href="<%= request.getContextPath() %>/Img/logo_superior.png"/>

</head>
<body>
	<div class="linha1"></div>
	<div class="container">
		<div class="row">
			<div class="col">
				<h2>ERRO!</h2>
				<hr>
				<br />
				<h4>Ocorreu um erro, entre em contato com os desenvolvedores.</h4>
			<!-- <br /><a href="<%=request.getContextPath()%>/index.jsp">Voltar ao Inicio</a> -->
			</div>
		</div>
	</div>

</body>
</html>