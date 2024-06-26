<%@page import="Model.ModelLogin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PresTec</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/principal/css/perfilCSS.css">
	 <link rel="icon" type="image/png" href="<%= request.getContextPath() %>/Img/logo_superior.png"/>
	
</head>
<body>
	<%@include file="/principal/Componente/header2.jsp"%>
	<div id="titulo">
		<h1>Meus Dados</h1>
	</div>

	<div id="linha1"></div>

	<div id="formulario">
		<form action="<%=request.getContextPath()%>/ServletPosLoginPrestador"
			method="post" id="cadastroCliente" enctype="multipart/form-data">
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
								<input type="text" class="form-control" name="nome" id="nome"
									value="<%=session.getAttribute("nome")%>" readonly="readonly">
							</div>
						</td>
						<td>
							<div id="textcampo">
								<p>
									<b>Email (Para a conta) :</b>
								</p>
								<input type="email" class="form-control" name="email" id="email"
									value="<%=session.getAttribute("usuario")%>"
									readonly="readonly">
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
									placeholder="Digite sua senha" name="senha" id="senha"
									value="${modelLogin.senha}">
							</div>
						</td>
						<td>
							<div id="textcampo">
								<p>
									<b>Repetir Senha:</b>
								</p>
								<input type="password" class="form-control"
									value="${modelLogin.rSenha}"
									placeholder="Digite sua senha novamente" name="Rsenha"
									id="Rsenha">
							</div>
						</td>
						
					</tr>
					<tr>
					<td>
							<div id="textcampo">
								<p>
									<b>Foto Usu�rio:</b>
								</p>
									<br/><br/>					
								 <div id="fotoNome">
       	 <c:if test="${modelLogin.fotouser != '' && modelLogin.fotouser != null}">
															<img alt="Imagen User" id="fotoembase64" src="${modelLogin.fotouser}" width="70px">
															</c:if>
															<c:if test="${modelLogin.fotouser == '' || modelLogin.fotouser == null}">
															<img alt="Imagen User" id="fotoembase64" src="<%=request.getContextPath()%>/principal/img/user.jpg" width="70px">
															</c:if>
        
        <br><br>
        </div>
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

				<button type="submit" class="btn btn-warning"
					onclick="verEditar('<%=session.getAttribute("usuario")%>')">Alterar</button>

			</div>
			<div id="spam">
				<spam>${msg}</spam>
			</div>
		</form>
	</div>

	<div id="linha1"></div>
	<div id="finalizarOperacao" class="finalizarOperacao">
		<div class="container">
			<div class="row">
				<div class="col">
					<h5>Para Finalizar as altera��es deverar ser realizado lagout.</h5>
				</div>
			</div>
			<br/> <br/>
			<div class="row">
				<div class="col">
					<a href="<%=request.getContextPath()%>\ServletLogin?acao=logout"><button
							type="submit" class="btn btn-success" onclick="finalizar()">Finalizar</button></a>
				</div>
			</div>
		</div>
	</div>

	<div id="linha1"></div>
	<div id="linha1"></div>
	<script type="text/javascript">
		function finalizar() {
			alert("Para finalizar as altera��es sera feito logout!");
		}
		function verEditar(login) {

			var urlAction = document.getElementById('cadastroCliente').action;

			window.location.href = urlAction + '?acao=buscarEditar&login='
					+ login;

		}
		
		function visualizarImg(fotoembase64, filefoto) {
			
			
			var preview = document.getElementById(fotoembase64);
			var fileUser = document.getElementById(filefoto).files[0];
			var reader = new FileReader();
			
			reader.onloadend = function (){
				preview.src = reader.result /*Carregar foto na tela*/
			}
			
			if(fileUser){
				reader.readAsDataURL(fileUser);
			}else{
				preview.src= '';
			}
			
		}
	</script>


	<%@include file="/Componentes/rodape.jsp"%>
</body>
</html>