<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ville de France</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body style="height:1500px">


	<h1 class="text-md-center">Bienvenue sur la plateforme !</h1>
	
	<div class="container">
		<p class="text-justify">Cette plateforme permet de consulter un ensemble de donn�es sur les villes fran�aises. <br>
			La personne utilisant la plateforme pourra <em>rechercher</em> une ville, en <em>modifier</em> les informations, en <em>ajouter</em>, ou <em>calculer</em> la distance entre deux villes.
		
		</p>
	</div>
	<br/>
	
	<div class="container">
		
		<h3 class="text-md-center">Vos actions</h3>
	
		<div class="row shadow p-3 mb-5 bg-white rounded">
	 		 <div class="col-sm-6 justify-content-start">
					<div class="card text-center shadow p-3 mb-5 bg-white rounded" style="width: 18rem;">
			 			 <div class="card-body">
				   			 <h5 class="card-header">Affichage des Villes</h5>
				    		<p class="card-text"> Cette option vous permettra d'afficher toutes les villes que vous voulez </p>
				  			<a href="AfficherVille" id="consulterVille" class="btn btn-primary btn-lg"/>Consulter les villes</a>
			 			 </div>
					</div>
			</div>
				
			 <div class="col-sm-6 justify-content-end">
				
					<div class="card text-center shadow p-3 mb-5 bg-white rounded" style="width: 18rem;">
			 			 <div class="card-body">
				   			 <h5 class="card-header">Calcul de distance</h5>
				    		<p class="card-text"> Desormais vous pouvez calculer la distance entre deux villes !</p>
				  			<a href="CalculerDistance" id="calculerDistance" class="btn btn-secondary btn-lg"/>Calculer la distance entre deux villes</a>
			 			 </div>
					</div>
			</div>
		
		</div>
	</div>
	
</body>
</html>