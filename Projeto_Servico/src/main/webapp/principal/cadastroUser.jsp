<%@page import="Model.ModelLogin" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/principal/css/cadastroUserAdm.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<%@include file="/principal/Componente/header2.jsp"%>

	<div id="titulo">
		<h1>
			<b>Cadastrar Administrador</b>
		</h1>
	</div>

	<div id="linha1"></div>

	<div id="formulario">
		<form
			action="<%=request.getContextPath()%>/ServletCadastroAdm"
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
								<input type="password" class="form-control"
									placeholder="Digite sua senha" name="senha" id="senha"
									value="${modelLogin.senha}" required="required" readonly="readonly">
							</div>
						</td>
						<td>
							<div id="textcampo">
								<p>
									<b>Gerar Senha:</b>
								</p>
								<input type='button' class="btn btn-primary" value ='Gerar Senha' onclick='document.getElementById("senha").value = Password.generate(16)'>
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
									placeholder="Digite seu telefone de contato" name="foneContato"
									id="foneContato" value="${modelLogin.telefone}"
									required="required">
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
				  
				  
				  _getRandomByte : function()
				  {
				    // http://caniuse.com/#feat=getrandomvalues
				    if(window.crypto && window.crypto.getRandomValues) 
				    {
				      var result = new Uint8Array(1);
				      window.crypto.getRandomValues(result);
				      return result[0];
				    }
				    else if(window.msCrypto && window.msCrypto.getRandomValues) 
				    {
				      var result = new Uint8Array(1);
				      window.msCrypto.getRandomValues(result);
				      return result[0];
				    }
				    else
				    {
				      return Math.floor(Math.random() * 256);
				    }
				  },
				  
				  generate : function(length)
				  {
				    return Array.apply(null, {'length': length})
				      .map(function()
				      {
				        var result;
				        while(true) 
				        {
				          result = String.fromCharCode(this._getRandomByte());
				          if(this._pattern.test(result))
				          {
				            return result;
				          }
				        }        
				      }, this)
				      .join('');  
				  }    
				    
				};
	</script>
	
	<%@include file="/Componentes/rodape.jsp"%>
</body>
</html>