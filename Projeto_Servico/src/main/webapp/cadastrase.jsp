<%@page import="Model.ModelLogin" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/cadastra.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
	<%@include file="/Componentes/header.jsp"%>

	<div id="titulo">
		<h1>
			<b>Cadastra-se e trabalhe conosco.</b>
		</h1>
	</div>

	<div id="linha1"></div>

	<div id="formulario">
		<form action="<%= request.getContextPath() %>/ServletCadastroPrestador" method="post"
			id="cadastroCliente">
			<div id="formulario1">
				<h5>Cadastro do login</h5>
				<br>
				<div id="linha2"></div>
				<br>
				<table id="tabelafrom1">
					<tr>
						<td>
							<div id="textcampo">
								<p>
									<b>Nome:</b>
								</p>
								<input type="text" class="form-control"
									placeholder="Digite seu nome completo" name="nome" id="nome" value="${modelLogin.nome}">
							</div>
						</td>
						<td>
							<div id="textcampo">
								<p>
									<b>Email (Para a conta) :</b>
								</p>
								<input type="email" class="form-control"
									placeholder="Digite seu email para login" name="email" id="email" value="${modelLogin.login}">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div id="textcampo">
								<p>
									<b>Senha:</b>
								</p>
								<input type="password" class="form-control"
									placeholder="Digite sua senha" name="senha" id="senha" value="${modelLogin.senha}">
							</div>
						</td>
						<td>
							<div id="textcampo">
								<p>
									<b>Repetir Senha:</b>
								</p>
								<input type="password" class="form-control"
									placeholder="Digite sua senha novamente" name="Rsenha" id="Rsenha">
							</div>
						</td>
					</tr>
				</table>
			</div>

			<div id="linha1"></div>

			<div id="fromulario2">
				<h5>Qual seu local e contato?</h5>
				<br>
				<div id="linha2"></div>
				<table id="tabelafrom1">
					<tr>
						<td>
							<div id="textcampo">
								<p>
									<b>Telefone de contato:</b>
								</p>
								<input type="text" class="form-control"
									placeholder="Digite seu telefone de contato" name="foneContato"
									id="foneContato" value="${modelLogin.telefone}">
							</div>
						</td>
						<td>
							<div id="textcampo">
								<p>
									<b>Estado:</b>
								</p>
								<select class="form-control" name="uf" id="uf">
									<option value="">Selecione</option>
									<option value="AC">AC</option>
									<option value="AL">AL</option>
									<option value="AP">AP</option>
									<option value="AM">AM</option>
									<option value="BA">BA</option>
									<option value="CE">CE</option>
									<option value="DF">DF</option>
									<option value="ES">ES</option>
									<option value="GO">GO</option>
									<option value="MA">MA</option>
									<option value="MT">MT</option>
									<option value="MS">MS</option>
									<option value="MG">MG</option>
									<option value="PA">PA</option>
									<option value="PB">PB</option>
									<option value="PR">PR</option>
									<option value="PE">PE</option>
									<option value="PI">PI</option>
									<option value="RJ">RJ</option>
									<option value="RN">RN</option>
									<option value="RS">RS</option>
									<option value="RO">RO</option>
									<option value="RR">RR</option>
									<option value="SC">SC</option>
									<option value="SP">SP</option>
									<option value="SE">SE</option>
									<option value="TO">TO</option>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div id="textcampo">
								<p>
									<b>Cidade:</b>
								</p>
								<input type="text" class="form-control"
									placeholder="Digite seu telefone de contato" name="cidade"
									id="cidade" value="${modelLogin.cidade}">
							</div>
						</td>
						<td>
							<div id="textcampo">
								<p>
									<b>Logradouro:</b>
								</p>
								<input type="text" class="form-control"
									placeholder="Digite seu logradouro" name="logradouro"
									id="logradouro" value="${modelLogin.logradouro}">
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div id="linha1"></div>
		<div id="button">

				<button type="submit"
					class="btn btn-success waves-effect waves-light">Criar Conta</button>
			</div>
			<div id="spam"><spam>${msg}</spam></div>
		</form>
	</div>

	<div id="linha1"></div>
	


	<div id="redirecionar">
		<p>Já possui uma conta?</p>
		<br> <a href="<%=request.getContextPath()%>/principal/principal.jsp"><button
				type="button" class="btn btn-warning">Fazer Login</button></a>
	</div>

	<div id="linha1"></div>


	<%@include file="/Componentes/rodape.jsp"%>

</body>
