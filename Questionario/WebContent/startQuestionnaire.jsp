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
  			}
  		}
		</script>
		
	</head>
	<body>

		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Wrapper -->
					<div id="wrapper">
							
							<section class="panel banner right">
								<div class="content color0 span-3-75">
									<h2 class="major">Secuencia 
									<%String s = (String) request.getAttribute("QN"); out.print(s+":");%>
									</h2>
									<audio id="Player">
  										<source src="audio/secuencia<%out.print(s+".mp3\""); %> type="audio/mpeg">
										Error: El navegador no acepta el audio. Favor de usar otro navegador.
									</audio>
									<button id="Btn" onclick="checkTimesPlayed();">Escuchar por Primera Vez</button>
								<form method="get" action="Server">
									<pre>
									
									</pre>
									Anote en el próximo recuadro los sonidos que escuche:
									<pre>
									</pre>
									<textarea name="AV" id="AV" rows="4"></textarea>
									<input type="submit" value="Próxima secuencia" class="special color2">
									
									<input type="hidden" name="Key" value=<%out.println((String) request.getAttribute("Key")); %>>
									<input type="hidden" name="QN" value=<%out.println(s); %>>
									</form>
									</div>
								<div class="image filtered span-1-75" data-position="25% 25%">
									<img src="images/pic01.jpg" alt="" />
								</div>									
							</section>
							<div class="copyright">&copy; Luis Edgar Domínguez Llanos. Design: <a href="https://html5up.net">HTML5 UP</a>.</div>

					</div>

			</div>
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>