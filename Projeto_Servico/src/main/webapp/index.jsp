<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/index.css">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<div id="Menu">
   <%@include file="/Componentes/header.jsp"%>
</div>

<div id="Servicos">
    <div id="titulo">
        <h1 size="20"><b>Precisa consertar, reformar ou construir?</b></h1>
    </div>
    <br>
    
    <div id="servico1">
        <div id="img1">
            <img src="<%= request.getContextPath() %>/Img/alvenaria.jpg" alt="Alvenaria" width="510" height="340">
        </div>       
        <div id="text1">
        <h5>Alvenaria</h5>        
        <p>O Pedreiro é o profissional que constrói ou reveste muros, </br>
        paredes, escadas, vigas, lajes, tectos, telhados, chaminés,</br>
        etc., em edifícios e outras obras de construção geralmente </br>
        orientado pelo engenheiro ou Mestre de obras.</p>
        <br>
        <button type="button" class="btn btn-outline-warning">VER PROFISSIONAIS</button><br><br>     
        </div>             
    </div>

    <div id="linha1"></div>

    <div id="servico2">
        <div id="text2">
        <h5>Eletricista</h5>
        <p>O eletricista é o profissional responsavel pela implementação, </br>
        manutencao e reparacao de instalacoes eletricas tanto resi-</br>
        denciais quanto industrias alem disso o eletricista realiza a </br>
        instalacao, vistoria e reparo de aparelhos eletricos eletronicos</br>
        e de redes de distribuicao de energia. </p>
        <br>
        <button type="button" class="btn btn-outline-warning">VER PROFESSIONAIS</button><br><br>
        </div> 
        
        <div id="img2">
            <img src="<%= request.getContextPath() %>/Img/eletricista.jpg" alt="Eletricista" width="510" height="340">
        </div>       
    </div>

    <div id="linha1"></div>

    <div id="servico1">
        <div id="img1">
            <img src="<%= request.getContextPath() %>/Img/faztudo.png" alt="Alvenaria" width="510" height="340">
        </div>
        
        <div id="text1">
        <h5>FazTudo</h5>
        <p>O FazTudo é o profissional da manutenção basica e intermediaria<br>
        na casa, cuja o trabalho é trocar lampada, trocar e instalar chuve-<br>
        etc., em edifícios e outras obras de construção geralmente <br>
        iro, desentupir encanamento entre outros.</p>
       

        <br>
        <button type="button" class="btn btn-outline-warning">VER PROFESSIONAIS</button><br><br>
        </div>        
    </div>
    
    <div id="linha1"></div>

    <div id="servico2">  
        <div id="text2">
        <h5>Encanador</h5>
        <p>O encanador é o profissional da construcao civil<br>
        cujo trabalho e instalar e prover a manutencao de <br>
        siestemas hidraulicos de residencias estabelecimentos<br>
        e industrias.</p>
        <br>
        <button type="button" class="btn btn-outline-warning">VER PROFESSIONAIS</button><br><br>
        </div> 
        <div id="img2">
            <img src="<%= request.getContextPath() %>/Img/servicoencanador.jpg" alt="Alvenaria" width="510" height="340">
        </div>       
    </div>

    <div id="linha1"></div>
   </div>
   <%@include file="/Componentes/rodape.jsp"%>
   
 
</body>
