<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
<meta charset="ISO-8859-1">
<title>PresTec</title>
<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/Img/logo_superior.png" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/index.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
	<div id="Menu">
		<%@include file="/Componentes/header.jsp"%>
	</div>

<section>
	<div id="Servicos">
		<div id="titulo">
			<h1 size="20">
				<b>Precisa consertar, reformar ou construir?</b>
			</h1>
		</div>
		<br>

		<div id="servico1">
			<div id="img1">
				<img src="<%=request.getContextPath()%>/Img/alvenaria.jpg"
					alt="Alvenaria" width="510" height="340">
			</div>
			<div id="text1">
				<h5>Alvenaria</h5>
				<p>
					O Pedreiro � o profissional que constr�i ou reveste muros, </br>
					paredes, escadas, vigas, lajes, tectos, telhados, chamin�s,</br> etc.,
					em edif�cios e outras obras de constru��o geralmente </br> orientado
					pelo engenheiro ou Mestre de obras.
				</p>
				<br> <a
					href="<%=request.getContextPath()%>/ServletPrestadores?acao=listar&categoria=alvenaria"><button
						type="button" class="btn btn-outline-warning">VER
						PROFISSIONAIS</button></a> <br>
				<br>
			</div>
		</div>

		<div id="linha1"></div>

		<div id="servico2">
			<div id="text2">
				<h5>Eletricista</h5>
				<p>
					O eletricista � o profissional responsavel pela implementa��o, </br>
					manutencao e reparacao de instalacoes eletricas tanto resi-</br>
					denciais quanto industrias alem disso o eletricista realiza a </br>
					instalacao, vistoria e reparo de aparelhos eletricos eletronicos</br> e
					de redes de distribuicao de energia.
				</p>
				<br> <a
					href="<%=request.getContextPath()%>/ServletPrestadores?acao=listar2&categoria=eletricista"><button
						type="button" class="btn btn-outline-warning">VER
						PROFESSIONAIS</button></a><br>
				<br>
			</div>

			<div id="img2">
				<img src="<%=request.getContextPath()%>/Img/eletricista.jpg"
					alt="Eletricista" width="510" height="340">
			</div>
		</div>

		<div id="linha1"></div>

		<div id="servico1">
			<div id="img1">
				<img src="<%=request.getContextPath()%>/Img/faztudo.png"
					alt="faztudo" width="510" height="340">
			</div>

			<div id="text1">
				<h5>FazTudo</h5>
				<p>
					O FazTudo � o profissional da manuten��o basica e intermediaria<br>
					na casa, cuja o trabalho � trocar lampada, trocar e instalar chuve-<br>
					etc., em edif�cios e outras obras de constru��o geralmente <br>
					iro, desentupir encanamento entre outros.
				</p>


				<br> <a
					href="<%=request.getContextPath()%>/ServletPrestadores?acao=listar3&categoria=faztudo"><button
						type="button" class="btn btn-outline-warning">VER
						PROFESSIONAIS</button></a><br>
				<br>
			</div>
		</div>

		<div id="linha1"></div>

		<div id="servico2">
			<div id="text2">
				<h5>Encanador</h5>
				<p>
					O encanador � o profissional da construcao civil<br> cujo
					trabalho e instalar e prover a manutencao de <br> siestemas
					hidraulicos de residencias estabelecimentos<br> e industrias.
				</p>
				<br> <a
					href="<%=request.getContextPath()%>/ServletPrestadores?acao=listar4&categoria=encanador"><button
						type="button" class="btn btn-outline-warning">VER
						PROFESSIONAIS</button></a><br>
				<br>
			</div>
			<div id="img2">
				<img src="<%=request.getContextPath()%>/Img/servicoencanador.jpg"
					alt="Alvenaria" width="510" height="340">
			</div>
		</div>

		<div id="linha1"></div>
	</div>
	</section>
	
	<hr style="width: 80%">
	
	<section>
        <div class="titulo_AND">
            <h3>Anuncios em destaques</h3>
        </div>
        <div class="anuncios_destaque">
             <div class="anuncio_destaque-c">
        
                <div class="anuncio_AND">
                    <a href="#" class="link__AND">
                    <div class="anuncio__img_AND">
                        <img src="<%=request.getContextPath()%>/Img/semImg.png" alt="Sem Imagem" width="300" height="250">
                    </div>
                    <div class="texto_AND">
                        <div class="titulo_anuncio_AND">Titulo</div>
                        <div class="descricao_anuncio_AND"><p>Descri�ao</p></div>
                    </div>
                    </a>
                </div>
                <div class="anuncio_AND">
                    <a href="#" class="link__AND">
                    <div class="anuncio__img_AND">
                        <img src="<%=request.getContextPath()%>/Img/semImg.png" alt="Sem Imagem" width="300" height="250">
                    </div>
                    <div class="texto_AND">
                        <div class="titulo_anuncio_AND">Titulo</div>
                        <div class="descricao_anuncio_AND"><p>Descri�ao</p></div>
                    </div>
                    </a>
                </div>
                <div class="anuncio_AND">
                    <a href="#" class="link__AND">
                    <div class="anuncio__img_AND">
                        <img src="<%=request.getContextPath()%>/Img/semImg.png" alt="Sem Imagem" width="300" height="250">
                    </div>
                    <div class="texto_AND">
                        <div class="titulo_anuncio_AND">Titulo</div>
                        <div class="descricao_anuncio_AND"><p>Descri�ao</p></div>
                    </div>
                    </a>
                </div>  
        </div>
    </section>

        <hr style="width: 80%">
    
    <section>
        <div class="Quem__Somos" id="somos">
            <div class="Quem__Somos-c">
                <div class="titulo__QM">
                    Quem Somos ?
                </div>
                <div class="Texto__QM">
                    <div class="Texto__QM-c">
                        <div class="Texto__QM-p1">
                            <p>
                                Em meios a tantos conflitos no dia a dia notamos que muitas pessoas
                                necessitam de servi�os r�pido, como por exemplo a troca de
                                um chuveiro, problemas de internet entre outros problemas do dia a
                                dia. H� muitos casos em que essas pessoas n�o sabem onde
                                encontrar ajuda ou uma solu��o para o problema. Tamb�m em meio a
                                isso a muitos trabalhadores que poderiam ajudar, mas n�o tem no��o
                                de como ou onde encontr�-las.
                            </p>
                            <br />
                            <p>
                                Como podemos perceber nos dias de hoje praticamente a maioria dos
                                problemas podem ser resolvidos pelo celular ou computador,
                                mas como sempre existem casos de pessoas que ainda necessitam de uma
                                pessoa presente com capacidade de resolver tal problema.
                            </p>
                        </div>
                        <div class="Texto__QM-p2">
                            <p>
                                Com isso nosso grupo decidiu criar um site de presta��o de servi�os
                                r�pidos, que seria uma grande ajuda a solucionar esses tais 
                                problemas do nosso cotidiano, o site poder� ser utilizado de 
                                forma r�pida e f�cil. al�m de ajudar nos problemas cotidianos
                                das pessoas, pensamos tamb�m no profissional que poder�o 
                                localizar os clientes de uma forma mais f�cil.
                            </p>
                            <br />
                            <p>
                                O intuito de criar esse site foi de n�o somente ajudar no
                                cotidiano das pessoas, mas tamb�m em gerar oportunidades de
                                servi�o para os trabalhadores aut�nomos assim de uma forma ou de
                                outra todos saem ganhando.
                            </p>
                            </div>
                            <br/>
                    </div>
                </div>
                <div style="height: 20px;"></div>
            </div>
        </div>
    </section>

    <hr style="width: 80%">

    <section class="planos" id="planos">
        <div class="titulo_PL">
            <h3>Anuncie conosco, confira nossos planos</h3>
        </div>
        <div class="planos-c">
            <div class="plano">
				<h2 class="plano__titulo">B�sico</h2>
				<span class="plano__preco"><sup>R$</sup>Gr�tis</span>
				<hr class="plano__divisor">
				<ul class="plano-lista">
					<li class="plano-lista__item">Acesso vital�cio</li>
					<li class="plano-lista__item">M�ximo 1 anuncio</li>
                    <li class="plano-lista__item">Suporte B�sico</li>
				</ul>
				<a  href="<%= request.getContextPath() %>/ServletPrestadores?acao=cadastrase" class="plano__btn-comprar">Assinar</a>
			</div>
			
			<div class="plano">
				<h2 class="plano__titulo">Popular</h2>
				<span class="plano__preco"><sup>R$</sup>20</span>
				<hr class="plano__divisor">
				<ul class="plano-lista">
					<li class="plano-lista__item">Acesso vital�cio</li>
					<li class="plano-lista__item">M�ximo 4 anuncios</li>
                    <li class="plano-lista__item">Gerenciamento de clientes</li>
					<li class="plano-lista__item">Suporte Premium</li>
				</ul>
				<a href="#" class="plano__btn-comprar">Assinar</a>
			</div>
			
			<div class="plano">
				<h2 class="plano__titulo">Premium</h2>
				<span class="plano__preco"><sup>R$</sup>40</span>
				<hr class="plano__divisor">
				<ul class="plano-lista">
					<li class="plano-lista__item">Acesso vital�cio</li>
					<li class="plano-lista__item">M�ximo 6 anuncios</li>
					<li class="plano-lista__item">Gerenciamento de clientes</li>
                    <li class="plano-lista__item">Emi��o de Nota Fiscal</li>
					<li class="plano-lista__item">Suporte Premium</li>
				</ul>
				<a href="#" class="plano__btn-comprar">Assinar</a>
			</div>
        </div>
    </section>

        <hr style="width: 80%">

	
	<%@include file="/Componentes/rodape.jsp"%>


</body>
