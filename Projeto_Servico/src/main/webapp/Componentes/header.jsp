<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="\css\header.css" rel="stylesheet" type="text/css">
<style>
@charset "ISO-8859-1";

body{
 font-family: Verdana, Geneva, Tahoma, sans-serif;
 width: 100%;
 margin: 0;
 padding: 0;
}

header{
    display: flex;
    align-items: center;
    justify-content: space-between;
    background-color: #FFFFFF;
    
    padding: 1em;
}

#t1{
    padding: 0.1em 7.0em;
}

#img{
    padding: 0.1em 7.0em;
}

#barra1{
    display: flex;
    align-items: center;
    justify-content: space-between;
    background-color: #F3F3F3;
    padding: 0.05em;
}

#navMobile{
	display:none;
}

nav{
    display: flex;
    align-items: center;
    justify-content: space-between;
    background-color: #FFFFFF;
    padding: 0.7em;
}

nav ul {
    list-style-type: none;
    overflow: hidden;
    background-color: #FFFFFF;
}

nav ul li {
    float: left;
}

nav ul li a {
    display: inline-block;
    color: black;
    text-align: center;
    padding: 1.0em 1.0em;
    margin-left: 3em;
    text-decoration: none;
}

nav ul li a:hover {
    color: #F4BC16;
}

#barra2{
    display: flex;
    align-items: center;
    justify-content: space-between;
    background-color: #F3F3F3;
    padding: 0.05em;
}

@media (max-width: 900px)
{
  body{
 font-family: Verdana, Geneva, Tahoma, sans-serif;
 width: 100%;
 margin: 0;
 padding: 0;
}
#img{
	padding: 0.5em 7.0em;
}
#t1{
    display: none;
}

nav{
    display: none;
}
#navMobile{
	display: flex;
	align-items: center;
	background-color: #FFFFFF;
    padding: 0.9em;
}

#navMobile ul{
	list-style-type: none;
    overflow: hidden;
    background-color: #FFFFFF;	
}

#navMobile ul li{
	float:none;
}

#navMobile ul li a{
	display: inline-block;
    color: black;
    text-align: center;
    padding: 1.0em 1.0em;
    margin-left: 3em;
    text-decoration: none;
}

#navMobile ul li a:hover {
    color: #F4BC16;
}
}
</style>
</head>
<body>

 <header>
        <div id="img"><img src="./img/#" alt="Logo" width="320" height="=240"></div>
        <div id="t1">
            <h2 style="font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;" size="15">CENTRAL DE ATENDIMENTO</h2>
           <h3 style="font-family:cursive; padding: 0.1em 5.0em;" size="10">(11)12345-6789</h3>
        </div>        
    </header>
	
	<div id="barra1"></div>
	
	<nav>	
        <ul>
            <li><a href="./index.html">INICIO</a></li>
            <li><a href="./quemsomos.html">QUEM SOMOS</a></li>
            <li><a href="./trabalheconosco.html">TRABALHE CONOSCO</a></li>
          </ul>
    </nav>
	
	<div id="navMobile">
	   <ul>
            <li><a href="./index.html">INICIO</a></li>
            <li><a href="./quemsomos.html">QUEM SOMOS</a></li>
            <li><a href="./trabalheconosco.html">TRABALHE CONOSCO</a></li>
          </ul>
	</div>
	
    <div id="barra2"></div>

</body>
</html>