<%@page import="bean.VilleFrance"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Liste des villes</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<h1>Liste des villes !</h1>
	<br/>
	<p>Voici l'ensemble des villes françaises contenues dans la base de données</p>
	<a href="index.jsp" class = "btn btn-info" id="retourAccueil"/>Retour à l'accueil</a>
	<br/>

	 <form action="AfficherVille" method="post">
	<div class="row">
          <div class="card border-left-primary shadow mb-4 col-xl-12 ">
                  <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Villes de France</h6>
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                      <table class="table table-bordered text-center" id="tableauUtilisateurs" width="100%" cellspacing="0">
					<thead>
			        	<tr>
				            <th scope="col">Nom commune</th>
				            <th scope="col">Longitude</th>
				            <th scope="col">Code Postal</th>
				            <th scope="col">Latitude</th>
				            <th scope="col">Ligne 5</th>
				             <th scope="col">Code commune</th>
				              <th scope="col">Libelle</th>
				              <th scope="col"> Modifier</th>
				              <th scope="col"> Supprimer</th>
			        	</tr>
			        </thead>
			        <tfoot>
			        	<%ArrayList<VilleFrance> villes = new ArrayList<VilleFrance>();
			        	villes = (ArrayList<VilleFrance>) session.getAttribute("listeVilles");
			        	
			        	for(int i=0;i<villes.size();i++){
			        		%>
			        		
				        	<tr>
				        		<td><%=villes.get(i).getNom_commune() %></td>
				        		 <td><%=villes.get(i).getLongitude() %></td>
				        		    <td><%=villes.get(i).getCode_postal() %></td>
				        		    <td><%=villes.get(i).getLatitude() %></td>
				        		    <td><%=villes.get(i).getLigne_5() %></td>
				        		  
				        			<td><%=villes.get(i).getCode_commune_INSEE() %></td>
					              <td><%=villes.get(i).getLibelle_acheminement() %></td>
					              <td><a href="AjouterVille">
					              <button class="btn btn-success btn-icon-split" name="modif" value=<%=villes.get(i).getCode_commune_INSEE() %>>Modifier</button>
					              
					              </a>
					              
								</td>
								<td>
								<form method="post" action="SupprimerVille">
								<a href="SupprimerVille">
								<button class="btn btn-danger btn-icon-split" name="supp" value=<%=villes.get(i).getCode_commune_INSEE() %>>Supprimer</button>
								</a>
								</form>
								</td>
					        </tr>
			        	<% }%>			       
			        </tfoot>
                        <tbody id="bodyUtilisateurs">

                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
              </form>
</body>
</html>