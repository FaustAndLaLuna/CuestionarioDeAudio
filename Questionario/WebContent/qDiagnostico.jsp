<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html><head>
		<title>Cuestionario Diagnóstico</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css">
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	</head>
	<body class="no-sidebar">
		<div id="page-wrapper">

			
				

			
				<div class="wrapper">
					<div class="container" id="main">

						
							<article id="content">
								<header>
									<h2>Cuestionario diagnóstico:</h2>
									<p>Conteste las próximas preguntas honestamente.</p>
									<form method="post" action="Server">
									<input type="hidden" name="Type" value=<%out.println((String) request.getAttribute("Type")); %>>
									<input type="hidden" name="Key" value=<%out.println((String) request.getAttribute("Key")); %>>
									
									<ol>
									<li>
										Nombre:  <input type="text" name="Name">
									</li>
									<li>
										Edad:  <input type="text" name="Age">
									</li>
									<li>
										Sexo: <br />
										<input type="radio" name="Gender" value="male" checked> Masculino<br>
  										<input type="radio" name="Gender" value="female"> Femenino<br>
  									</li>
									<li>
										¿Tiene problemas auditivos?  <br />
										<input type="radio" name="HearingProblems" value="true" checked> Sí<br>
  										<input type="radio" name="HearingProblems" value="false"> No<br>
  									</li>
									<li>
										¿Con qué frecuencia escucha música? <br />
										<input type="radio" name="ListeningFrequency" value="never">Nunca pongo música<br>
  										<input type="radio" name="ListeningFrequency" value="occasionally">Ocasionalmente escucho música<br>
  										<input type="radio" name="ListeningFrequency" value="usually">Usualmente oigo música<br>
  										<input type="radio" name="ListeningFrequency" value="alwayson">Siempre tengo música puesta<br>
									</li>
									<li>
										¿Toca algún instrumento? ¿Cuál? (Deje vacío si no toca alguno) 
										<input type="text" name="InstrumentPlayed">
									</li>
									<li>
										¿Le gusta cantar? ¿Porqué? (Deje vacío si no le gusta) 
										<input type="text" name="SingReason">	
									</li>
									<li>
										Mencione 3 canciones que le gusten: 
										<ul>
										<li><input type="text" name="SongA"> </li>
										<li><input type="text" name="SongB"> </li>
										<li><input type="text" name="SongC"> </li>
										</ul>
									</li>
									<li>
										¿Escucha música mientras estudia?<br />
										<input type="radio" name="StudyMusic" value="true">Sí<br />
										<input type="radio" name="StudyMusic" value="false">No
									</li>
									<li>
											¿Le gusta leer?<br />
										<input type="radio" name="LikesReading" value="true">Sí<br />
										<input type="radio" name="LikesReading" value="false">No
									</li>
									<li>
											¿Hace ejercicio?<br />
										<input type="radio" name="Exercises" value="true">Sí<br />
										<input type="radio" name="Exercises" value="false">No
									</li>
									<li>
										¿A que hora despierta?
										<input type="text" name="TimeAwake">
									</li>
									<li>
										¿A que hora duerme?
										<input type="text" name="TimeAsleep">
									</li>
									<li>
										¿Vive en un lugar ruidoso?<br />
										<input type="radio" name="NoisyPlace" value="true">Sí<br />
										<input type="radio" name="NoisyPlace" value="false">No
									</li>
									<li>
										¿Toma algún medicamento? ¿Cuál? (Deje en blanco si no toma ninguno)
										<input type="text" name="Medicine">
									</li>
									<li>
										¿Le gusta estudiar?<br />
										<input type="radio" name="LikesStudying" value="true">Sí<br />
										<input type="radio" name="LikesStudying" value="false">No
									</li>
									<li>
										¿Cómo se siente en este momento?<br />
										<input type="radio" name="CurrentState" value="Cansado">Cansado<br />
										<input type="radio" name="CurrentState" value="Mal">Mal<br />
										<input type="radio" name="CurrentState" value="Regular">Regular<br />
										<input type="radio" name="CurrentState" value="Bien">Bien<br />
									</li>
									<li>
										¿Se siente nervioso/a cuando tiene exámenes?<br />
										<input type="radio" name="ExamNervousness" value="true">Sí<br />
										<input type="radio" name="ExamNervousness" value="false">No
									</li>
									<li>
										¿Se aburre fácilmente?<br />
										<input type="radio" name="EasilyBored" value="true">Sí<br />
										<input type="radio" name="EasilyBored" value="false">No
									</li>
									<li>
										¿Cómo se siente usualmente?<br />
										<input type="radio" name="RegularState" value="Cansado">Cansado<br />
										<input type="radio" name="RegularState" value="Mal">Mal<br />
										<input type="radio" name="RegularState" value="Regular">Regular<br />
										<input type="radio" name="RegularState" value="Bien">Bien<br />
									</li>
									
									</ol>
									<input type="submit" value="Enviar">
									</form>
								</header>
								
								
								
								
							</article>

						
					</div>
				</div>

			<!-- Footer -->
				

		</div>

		<!-- Scripts -->

			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>

	
<ul class="dropotron level-0" style="user-select: none; display: none; position: absolute; z-index: 1000;">
											<li style="white-space: nowrap;"><a href="#" style="display: block;">Lorem ipsum dolor</a></li>
											<li style="white-space: nowrap;"><a href="#" style="display: block;">Magna phasellus</a></li>
											<li style="white-space: nowrap;"><a href="#" style="display: block;">Etiam dolore nisl</a></li>
											<li class="opener" style="user-select: none; cursor: pointer; white-space: nowrap;">
												<a href="#" style="display: block;">Phasellus consequat</a>
												<ul style="user-select: none; display: none; position: absolute; z-index: 1001;" class="dropotron level-1">
													<li style="white-space: nowrap;"><a href="#" style="display: block;">Lorem ipsum dolor</a></li>
													<li style="white-space: nowrap;"><a href="#" style="display: block;">Phasellus consequat</a></li>
													<li style="white-space: nowrap;"><a href="#" style="display: block;">Magna phasellus</a></li>
													<li style="white-space: nowrap;"><a href="#" style="display: block;">Etiam dolore nisl</a></li>
												</ul>
											</li>
											<li style="white-space: nowrap;"><a href="#" style="display: block;">Veroeros feugiat</a></li>
										</ul><div id="navButton"><a href="#navPanel" class="toggle"></a></div><div id="navPanel"><nav><a href="index.html" class="link depth-0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Home</a><a class="link depth-0" href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-0"></span>Dropdown</a><a class="link depth-1" href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-1"></span>Lorem ipsum dolor</a><a class="link depth-1" href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-1"></span>Magna phasellus</a><a class="link depth-1" href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-1"></span>Etiam dolore nisl</a><a class="link depth-1" href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-1"></span>Phasellus consequat</a><a class="link depth-2" href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-2"></span>Lorem ipsum dolor</a><a class="link depth-2" href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-2"></span>Phasellus consequat</a><a class="link depth-2" href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-2"></span>Magna phasellus</a><a class="link depth-2" href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-2"></span>Etiam dolore nisl</a><a class="link depth-1" href="#" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-1"></span>Veroeros feugiat</a><a class="link depth-0" href="left-sidebar.html" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-0"></span>Left Sidebar</a><a class="link depth-0" href="right-sidebar.html" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-0"></span>Right Sidebar</a><a class="link depth-0" href="no-sidebar.html" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"><span class="indent-0"></span>No Sidebar</a></nav></div></body></html>