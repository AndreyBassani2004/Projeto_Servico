<%@page import="Model.ModelLogin" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PresTec</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/principal/css/perfilCSS.css">
</head>
<body>
	<%@include file="/principal/Componente/header2.jsp"%>
	<div id="titulo"><h1>Meus Dados</h1></div>
	
	<div id="linha1"></div>

	<div id="formulario">
		<form action="<%= request.getContextPath() %>/ServletPosLoginAdm" method="post"
			id="cadastroCliente">
			<input type="hidden" name="acao" id="acao" value="">
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
									 name="nome" id="nome" value="<%= session.getAttribute("nome") %>" readonly="readonly">
							</div>
						</td>
						<td>
							<div id="textcampo">
								<p>
									<b>Email (Para a conta) :</b>
								</p>
								<input type="email" class="form-control"
									 name="email" id="email" value="<%=session.getAttribute("usuario")%>" readonly="readonly">
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
									placeholder="Digite sua senha" name="senha" id="senha" value="<%= request.getSession().getAttribute("senha").toString() %>">
							</div>
						</td>
						<td>
							<div id="textcampo">
								<p>
									<b>Repetir Senha:</b>
								</p>
								<input type="password" class="form-control" value="${modelLogin.rSenha}"
									placeholder="Digite sua senha novamente" name="Rsenha" id="Rsenha">
							</div>
						</td>
					</tr>
				</table>
			</div>

			<div id="linha1"></div>

			<div id="fromulario2">
				<h5>Qual seu local e contato</h5>
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
									id="foneContato" value="<%= session.getAttribute("telefone_contato_adm").toString() %>">
							</div>
						</td>
						<td>
							<div id="textcampo">
								<p>
									<b>Estado:</b>
								</p>
								<select class="form-control" name="uf" id="uf">
									<option value="<%= session.getAttribute("estado").toString() %>"><%= session.getAttribute("estado").toString() %></option>
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
									id="cidade" value="<%= request.getSession().getAttribute("cidade_adm").toString() %>">
							</div>
						</td>
						<td>
							<div id="textcampo">
								<p>
									<b>Logradouro:</b>
								</p>
								<input type="text" class="form-control"
									placeholder="Digite seu logradouro" name="logradouro"
									id="logradouro" value="<%= request.getSession().getAttribute("cep_adm").toString() %>">
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div id="linha1"></div>
		<div id="button">

				<button type="submit"
					class="btn btn-warning" onclick="verEditar('<%=session.getAttribute("usuario")%>')">Alterar</button>
			</div>
			<div id="spam"><spam>${msg}</spam></div>
		</form>
	</div>

	<div id="linha1"></div>
	
	<script type="text/javascript">
	function verEditar(login){
		
		var urlAction = document.getElementById('cadastroCliente').action;
		
		window.location.href = urlAction + '?acao=buscarEditar&login=' + login;
		
		
	}
	</script>
	
	
	<%@include file="/Componentes/rodape.jsp"%>
</body>
</html>