<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<meta >
<title>PresTec</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/quem.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

</head>
<body>

	<%@include file="/Componentes/header.jsp"%>
	<div id="titulo">
		<h1>
			<b>Quem Somos ?</b>
		</h1>
		<br>
	</div>
	<div id="espaco"></div>
	<div id="texto">
		<div lang="pt-BR">
		<p lang="pt-BR">
			Em meios a tantos conflitos no dia a dia notamos que muitas pessoas <br/>
			necessitam de serviços rápido, como por exemplo a troca de <br/>
			um chuveiro, problemas de internet entre outros problemas do dia a <br/>
			dia. Há muitos casos  em que essas pessoas não sabem onde <br/>
			encontrar ajuda ou uma solução para o problema. Também em meio a <br/>
			isso a muitos trabalhadores que poderiam ajudar, mas não tem noção de <br/>
			como ou onde encontrá-las.
		</p>
		<br/> 
		<p>
			Como podemos perceber nos dias de hoje praticamente a maioria dos<br/>
			problemas podem ser resolvidos pelo celular ou computador,<br/>
			mas como sempre existem casos de pessoas que ainda necessitam de uma<br/>
			pessoa presente com capacidade de resolver tal problema.<br/>
		</p>
		<br/> 
		<p lang="pt-BR">
			Com isso nosso grupo decidiu criar um site de prestação de serviços<br/>
			rápidos, que seria uma grande ajuda a solucionar esses tais <br/>
			problemas do nosso cotidiano, o site poderá ser utilizado de <br/>
			forma rápida e fácil. além de ajudar nos problemas cotidianos <br/>
			das pessoas, pensamos também no profissional que poderão <br/>
			localizar os clientes de uma forma mais fácil.
		</p>
		<br/>
		<p lang="pt-BR">
			O intuito de criar esse site foi de não somente ajudar no<br/>
			cotidiano das pessoas, mas também em gerar oportunidades de<br/>
			serviço para os trabalhadores autônomos assim de uma forma ou de<br/>
			outra todos saem ganhando.
		<p /></div>
	</div>
	<div id="espaco"></div>

	<%@include file="/Componentes/rodape.jsp"%>

</body>