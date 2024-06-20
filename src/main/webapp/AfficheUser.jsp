<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
		User u=(User)session.getAttribute("user");
%>

		<h1> l'utilisateur connecte est <%=u.getNom() %> <%= u.getPrenom() %></h1>
<h2>Ajouter un Produit</h2>
<form action="ProduitServlet" method="post">
    <label for="nom">Nom du Produit:</label><br>
    <input type="text" id="nom" name="nom"><br>
    <label for="prix">Prix du Produit:</label><br>
    <input type="text" id="prix" name="prix"><br>
    <label for="imageUrl">URL de l'image:</label><br>
    <input type="text" id="imageUrl" name="imageUrl"><br>
    <label for="ingredients">Ingr�dients:</label><br>
    <textarea id="ingredients" name="ingredients"></textarea><br>
    <label for="quantite">Quantit� disponible:</label><br>
    <input type="number" id="quantite" name="quantite"><br><br>
    <input type="submit" value="Ajouter">
</form>


</body>
</html>