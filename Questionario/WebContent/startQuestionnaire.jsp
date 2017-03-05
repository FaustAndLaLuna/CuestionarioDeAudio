<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Ethereal by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Cuestionario</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<script>
		var TimesPlayed=0;
  		function checkTimesPlayed(){
  			if(TimesPlayed==0){
  				var audio = document.getElementById("Player");
  				audio.play();
  				var btn = document.getElementById("Btn");
  				btn.innerHTML = "Escuchar por Segunda Vez";
  				TimesPlayed++;
  			}
  			else if(TimesPlayed==1){
  				var audio = document.getElementById("Player");
  				if(! audio.paused) return;
  				audio.play();
  				var btn = document.getElementById("Btn");
  				btn.innerHTML = "Limite de veces escuchado";
  				btn.disabled = true;
  				var av = document.getElementById("AV");
  				av.innerHTML = "";
  				av.style.backgroundColor='initial';
  				av.style.opacity='1';
  				av.disabled=false;
  			}
  		}
		</script>
		
	</head>
	<body class="homepage">
	<div id="header-wrapper">
					<div id="header" class="container">
					</div>

					<!-- Hero -->
						<section id="hero" class="container">
							
								<header>
									<h2 class="major" style="color: #fff">Secuencia 
									<%String s = (String) request.getAttribute("QN"); out.print(s+":");
									String t = (String) request.getAttribute("Type");%>
									</h2>
									<hr style="color: #fff"/>
								</header>
								
									<audio id="Player">
  										<source src="audio/secuencia<%out.print(t+s+".mp3\""); %> type="audio/mpeg">
										Error: El navegador no acepta el audio. Favor de usar otro navegador.
									</audio>
									<button id="Btn" onclick="checkTimesPlayed();" style="color: #fff">Escuchar por Primera Vez</button>
								<form method="get" action="Server">
									<pre>
									
									</pre>
									<p style="color: #fff">Anote en el próximo recuadro los sonidos que escuche: </p>
									<pre>
									</pre>
									<textarea name="AV" id="AV" rows="4" disabled 
									style="background-color: gray; opacity: 0.5; color:#fff;">Sección de respuesta desactivada hasta que el audio sea escuchado dos veces.</textarea>
									<br /><input type="submit" value="Próxima secuencia" class="special color2" style="color: #fff">
									
									<input type="hidden" name="Type" value=<%out.println((String) request.getAttribute("Type")); %>>
									<input type="hidden" name="Key" value=<%out.println((String) request.getAttribute("Key")); %>>
									<input type="hidden" name="QN" value=<%out.println(s); %>>
									</form>
						</section>
				</div>
		
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>