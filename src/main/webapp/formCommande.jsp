<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Confirmation de Commande</title>
    <!-- Liens vers Bootstrap pour le style -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1 class="text-center mb-4">Confirmation de Commande</h1>
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <h2>Produits sélectionnés :</h2>
                <ul>
                    <%-- Récupérer et afficher les données des produits --%>
                    <% 
                        // Récupérer les produits sélectionnés depuis les paramètres de requête
                        String[] produits = request.getParameterValues("produits");
                        if (produits != null) {
                            for (String produit : produits) {
                                out.println("<li>" + produit + "</li>");
                            }
                        }
                    %>
                </ul>

                <!-- Formulaire pour confirmer la commande -->
                <form action="CommandeServlet" method="post">
                    <%-- Ajouter un champ caché pour chaque produit dans la liste --%>
                    <% 
                        if (produits != null) {
                            for (String produit : produits) {
                    %>
                                <input type="hidden" name="produits" value="<%= produit %>">
                    <% 
                            }
                        }
                    %>
                    <!-- Ajoutez d'autres champs pour la date, le client, etc. si nécessaire -->
                    <div class="form-group">
                        <label for="date">Date de la commande :</label>
                        <input type="date" class="form-control" id="date" name="date" required>
                    </div>
                    <div class="form-group">
                        <label for="client">Nom du client :</label>
                        <input type="text" class="form-control" id="client" name="client" required>
                    </div>
                    <button type="submit" class="btn btn-success">Confirmer la Commande</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
