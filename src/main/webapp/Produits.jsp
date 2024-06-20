<%@page import="model.Produit"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Produits</title>
    <!-- Liens vers Bootstrap pour le style -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Style pour les cartes */
        .card {
            margin: 20px;
            width: 300px;
            display: inline-block;
            vertical-align: top;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        /* Style pour les boutons Ajouter au Panier */
        .btn-panier {
            width: 100%;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 0;
            padding: 10px;
            cursor: pointer;
        }
        /* Style pour les titres des cartes */
        .card-title {
            font-size: 20px;
            font-weight: bold;
        }
        /* Style pour les images des cartes */
        .card-img-top {
            max-height: 200px;
            object-fit: cover;
        }
        /* Style pour le texte des cartes */
        .card-text {
            font-size: 16px;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center mb-4">Liste des Produits</h1>
        <div class="row">
            <% 
            List<Produit> produits = (List<Produit>)request.getAttribute("produits");
            User u = (User)session.getAttribute("user");
            if(produits != null) {
                for (Produit produit : produits) {
            %>
            <div class="col-md-4">
                <div class="card">
                    <img src="<%= produit.getImageUrl() %>" alt="Image du produit" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title"><%= produit.getNom() %></h5>
                        <p class="card-text">Prix: <%= produit.getPrix() %> €</p>
                        <p class="card-text">Ingrédients: <%= produit.getIngredients() %></p>
                        <p class="card-text">Quantité disponible: <%= produit.getQuantite() %></p>
                        <!-- Bouton Ajouter au Panier avec lien vers formpenier et envoi de l'ID du produit -->
                      <form action="AjouterAuPanierServlet" method="get">
    <!-- Autres champs du formulaire -->
    <input type="hidden" name="id" value="<%= produit.getId() %>">
    <button type="submit" class="btn btn-primary">Ajouter au Panier</button>
</form>


                    </div>
                </div>
            </div>
            <% 
                }
            }
            %>
        </div>
    </div>
</body>
</html>