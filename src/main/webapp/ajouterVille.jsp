<%@page import="bean.VilleFrance"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

  </head>
  <body>

	<h3 style="text-align:center; margin:60px;">Modifier la ville</h3>
	<% VilleFrance villeModif = (VilleFrance) session.getAttribute("villeModif"); %>
	<main class="login-form">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <form action="AjouterVille" method="post">
                        	<div class="form-group row">
                                <label for="nom" class="col-md-4 col-form-label text-md-right">Code commune INSEE</label>
                                <div class="col-md-6">
                                    <input type="text" id="codeCommune" class="form-control" name="codeCommune" value="<%= villeModif.getCode_commune_INSEE() %>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="nom" class="col-md-4 col-form-label text-md-right">Code Postal</label>
                                <div class="col-md-6">
                                    <input type="text" id="codePostal" class="form-control" name="codePostal" value="<%= villeModif.getCode_postal()%>">
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="nom" class="col-md-4 col-form-label text-md-right">Nom Commune</label>
                                <div class="col-md-6">
                                    <input type="text" id="nomCommune" class="form-control" name="nomCommune" value="<%= villeModif.getNom_commune() %>">
                                </div>
                            </div>
                            
                            
                            <div class="form-group row">
                                <label for="nom" class="col-md-4 col-form-label text-md-right">Libelle</label>
                                <div class="col-md-6">
                                    <input type="text" id="libelleacheminement" class="form-control" name="libelleacheminement" value="<%= villeModif.getLibelle_acheminement() %>">
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="nom" class="col-md-4 col-form-label text-md-right">Ligne 5</label>
                                <div class="col-md-6">
                                    <input type="text" id="ligne5" class="form-control" name="ligne5" value="<%= villeModif.getLigne_5() %>">
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="nom" class="col-md-4 col-form-label text-md-right">Latitude</label>
                                <div class="col-md-6">
                                    <input type="text" id="latitude" class="form-control" name="latitude" value="<%= villeModif.getLatitude() %>">
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="nom" class="col-md-4 col-form-label text-md-right">Longitude</label>
                                <div class="col-md-6">
                                    <input type="text" id="longitude" class="form-control" name="longitude" value="<%= villeModif.getLongitude() %>">
                                </div>
                            </div>


                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-success" value="Valider">
                                    Modifier
                                </button>
                                <a href="index.jsp" class="btn btn-link">
                                    Retour
                                </a>
                            </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</main>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  </body>
</html>