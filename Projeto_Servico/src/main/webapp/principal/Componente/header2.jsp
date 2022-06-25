<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>\principal\css\headerTarefa.css">
    <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
    <script language=javascript type="text/javascript">
        dayName = new Array ("Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado")
        monName = new Array ("Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro")
        now = new Date
    </script>
</head>
<body>

    <div id="barra">
        <div id="fotoNome">
        <img src="img/user.jpg" alt="foto user"><br><br>
        <p>(Usuario)</p>
        <nav class="dp-menu">
            <ul>
                <li id="menu-cr"><a href="#">Menu</a>
                    <ul>
                        <li><a href="#">Perfil</a></li>
                        <li><a href="#">Cadastra usuarios (ADM)</a></li>
                        <li><a href="#">Validar Avaliações</a></li>
                        <li><a href="#">Avaliações Denunciadas</a></li>
                        <li><a href="#">Anuncio Denunciados</a></li>
                        <li ><a href="ServletLogin?acao=logout" id="sair">Sair</a></li>
                    </ul>
                </li>
            </ul>
        </nav>      
        </div>
        <div id="hora">
            <script language=javascript type="text/javascript">
                document.write ("<h3> Hoje é <br> " + dayName[now.getDay() ] + ", " + now.getDate () + " de " + monName [now.getMonth() ]   +  " de "  +     now.getFullYear () + ". </h3>")
            </script>
        </div>
    </div>
    <div id="barraDiv"></div>
</body>
</html>