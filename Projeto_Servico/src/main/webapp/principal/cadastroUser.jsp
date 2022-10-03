<%@page import="Model.ModelLogin"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PresTec</title>
<link
	href="<%=request.getContextPath()%>/principal/css/cadastroUserAdm.css"
	rel="stylesheet" type="text/css">
<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/Img/logo_superior.png" />

</head>
<body>
	<%@include file="/principal/Componente/header2.jsp"%>

	<c:if test="${isAdmin}">

		<div id="titulo">
			<h1>
				<b>Cadastrar Administrador</b>
			</h1>
		</div>

		<div id="linha1"></div>

		<div id="formulario">
			<form action="<%=request.getContextPath()%>/ServletCadastroAdm"
				method="post" id="cadastroCliente">
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
										placeholder="Digite seu nome completo" name="nome" id="nome"
										value="${modelLogin.nome}" required="required">
								</div>
							</td>
							<td>
								<div id="textcampo">
									<p>
										<b>Email (Para a conta) :</b>
									</p>
									<input type="email" class="form-control"
										placeholder="Digite seu email para login" name="email"
										id="email" value="${modelLogin.login}" required="required">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div id="textcampo">
									<p>
										<b>Senha:</b>
									</p>
									<input type="text" class="form-control"
										placeholder="Digite sua senha" name="senha" id="senha"
										value="${modelLogin.senha}" required="required"
										readonly="readonly">
								</div>
							</td>
							<td>
								<div id="textcampo">
									<p>
										<b>Gerar Senha:</b>
									</p>
									<input type='button' class="btn btn-primary"
										value='Gerar Senha'
										onclick='document.getElementById("senha").value = Password.generate(16)'>
								</div>
							</td>
						</tr>
					</table>
				</div>

				<div id="linha1"></div>

				<div id="fromulario2">
					<h5>Local do administrador</h5>
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
										placeholder="Digite seu telefone de contato"
										name="foneContato" id="foneContato"
										value="${modelLogin.telefone}" required="required">
								</div>
							</td>
							<td>
								<div id="textcampo">
									<p>
										<b>Estado:</b>
									</p>
									<select class="form-control" name="uf" id="uf"
										required="required">
										<option value="">Selecione</option>
										<option value="AC"
										<%ModelLogin modelLogin = (ModelLogin) request.getAttribute("ModelLogin");

if (modelLogin != null && modelLogin.getEstado().equals("AC")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>AC</option>
									<option value="AL"
										<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getEstado().equals("AL")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>AL</option>
									<option value="AP"
										<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getEstado().equals("AP")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>AP</option>
									<option value="AM"
										<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getEstado().equals("AM")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>AM</option>
									<option value="BA"
										<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getEstado().equals("BA")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>BA</option>
									<option value="CE"
										<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getEstado().equals("CE")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>CE</option>
									<option value="DF"
										<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getEstado().equals("DF")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>DF</option>
									<option value="ES"
										<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getEstado().equals("ES")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>ES</option>
									<option value="GO"
										<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getEstado().equals("GO")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>GO</option>
									<option value="MA"
										<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getEstado().equals("MA")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>MA</option>
									<option value="MT"
										<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getEstado().equals("MT")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>MT</option>
									<option value="MS"
										<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getEstado().equals("MS")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>MS</option>
									<option value="MG"
										<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getEstado().equals("MG")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>MG</option>
									<option value="PA"
										<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getEstado().equals("PA")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>PA</option>
									<option value="PB"
										<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getEstado().equals("PB")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>PB</option>
									<option value="PR"
										<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getEstado().equals("PR")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>PR</option>
									<option value="PE"
										<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getEstado().equals("PE")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>PE</option>
									<option value="PI"
										<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getEstado().equals("PI")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>PI</option>
									<option value="RJ"
										<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getEstado().equals("RJ")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>RJ</option>
									<option value="RN"
										<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getEstado().equals("RN")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>RN</option>
									<option value="RS"
										<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getEstado().equals("RS")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>RS</option>
									<option value="RO"
										<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getEstado().equals("RO")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>RO</option>
									<option value="RR"
										<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getEstado().equals("RR")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>RR</option>
									<option value="SC"
										<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getEstado().equals("SC")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>SC</option>
									<option value="SP"
										<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getEstado().equals("SP")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>SP</option>
									<option value="SE"
										<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getEstado().equals("SE")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>SE</option>
									<option value="TO"
										<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getEstado().equals("TO")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>TO</option>
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
										id="cidade" value="${modelLogin.cidade}" required="required">
								</div>
							</td>
							<td>
								<div id="textcampo">
									<p>
										<b>Logradouro:</b>
									</p>
									<input type="text" class="form-control"
										placeholder="Digite seu logradouro" name="logradouro"
										id="logradouro" value="${modelLogin.logradouro}"
										required="required">
								</div>
							</td>
						</tr>
					</table>
				</div>
				<div id="linha1"></div>
				<div id="button">

					<button type="submit"
						class="btn btn-success waves-effect waves-light">Criar
						Conta</button>
				</div>
				<div id="spam">
					<spam>${msg}</spam>
				</div>
			</form>
		</div>

		<div id="linha1"></div>

		<script type="text/javascript">
			var Password = {

				_pattern : /[a-zA-Z0-9_\-\+\.]/,

				_getRandomByte : function() {
					// http://caniuse.com/#feat=getrandomvalues
					if (window.crypto && window.crypto.getRandomValues) {
						var result = new Uint8Array(1);
						window.crypto.getRandomValues(result);
						return result[0];
					} else if (window.msCrypto
							&& window.msCrypto.getRandomValues) {
						var result = new Uint8Array(1);
						window.msCrypto.getRandomValues(result);
						return result[0];
					} else {
						return Math.floor(Math.random() * 256);
					}
				},

				generate : function(length) {
					return Array.apply(null, {
						'length' : length
					}).map(
							function() {
								var result;
								while (true) {
									result = String.fromCharCode(this
											._getRandomByte());
									if (this._pattern.test(result)) {
										return result;
									}
								}
							}, this).join('');
				}

			};
		</script>
	</c:if>

	<c:if test="${perfil == 'PRESTADOR' || perfil == 'ADMIN' && !isAdmin}">
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<div class="container"
			style="align-items: center; text-align: center;">
			<h1>Função indisponivel</h1><br>
			<a href="<%=request.getContextPath()%>/principal/principal.jsp">Voltar ao Inicio</a>
		</div>
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
	</c:if>


	<%@include file="/Componentes/rodape.jsp"%>
</body>
</html>