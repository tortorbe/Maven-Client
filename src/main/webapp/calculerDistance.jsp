<%@page import="bean.VilleFrance"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calcul de la distance</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

 

<style>
#div1 {
  width:500px;
  margin: auto;
 
}

 

</style>

 

</head>
<body>
    <h1 class="text-md-center">Distance entre deux villes !</h1>
    <br/>
    <p class="text-md-center">Vous pouvez ici calculer la distance séparant deux villes françaises</p>
    <div class="text-center">
        <a href="index.jsp" class = "btn btn-info" id="retourAccueil"/>Retour à l'accueil</a>
        
    </div>
    
    <br/>

 

    <div id="div1" class="shadow p-3 mb-5 bg-white rounded">
        <form name="villesForm" method="post" action="CalculerDistance">
            
             <p class="text-md-center"> Calcul de la distance entre : </p>
             
            <select class="custom-select" name="choixVille1">
                <%ArrayList<VilleFrance> villes = new ArrayList<VilleFrance>();
                 villes = (ArrayList<VilleFrance>) session.getAttribute("listeVilles");
                 for(int i=0;i<villes.size();i++){
                     %>
                    <option name="nomVilleDepart" value=<%=villes.get(i).getCode_commune_INSEE() %>><%=villes.get(i).getNom_commune() %> (<%=villes.get(i).getCode_postal()%>)
                    </option>
                    <% }%>
            </select>
            <p class="text-md-center"> et </p>
            
            <select class="custom-select" name="choixVille2">
            <%ArrayList<VilleFrance> villes2 = new ArrayList<VilleFrance>();
                 villes2 = (ArrayList<VilleFrance>) session.getAttribute("listeVilles");
                 for(int i=0;i<villes2.size();i++){
                     %>
                    <option name="nomVilleArrivee" value=<%=villes2.get(i).getCode_commune_INSEE() %>><%=villes2.get(i).getNom_commune() %> (<%=villes2.get(i).getCode_postal()%>)
                    </option>
                    <% }%>
            </select>
            <br>
            <div class="text-center">
                <button type="submit" class ="btn btn-primary"  value="Calculer"> Calculer </button>
            </div>
        </form>
        
        <div >
            <p class="text-md-center"> La distance est de <%= session.getAttribute("distance") %> Kms </p>
        
        
        </div>
    
    </div>

 


</body>
</html>