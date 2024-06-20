package controller;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import model.Produit;
import model.Commande;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import java.util.List;
import java.util.ArrayList;

import dao.CommandeDAO;
import dao.ProduitDAO;
@WebServlet("/AjouterAuPanierServlet")
public class AjouterAuPanierServlet extends HttpServlet {
    private ProduitDAO produitDAO;
    private CommandeDAO commandeDAO;

    public void init() {
        produitDAO = new ProduitDAO();
        commandeDAO = new CommandeDAO();
    }

    public AjouterAuPanierServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String produitId = request.getParameter("id");
        Produit produit = produitDAO.findById(Integer.parseInt(produitId)); // Utiliser l'instance de ProduitDAO pour récupérer le produit

        // Ajouter le produit à l'objet request
        request.setAttribute("produit", produit);

        // Transférer la requête à la JSP
        request.getRequestDispatcher("formpanier.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String produitId = request.getParameter("id");
        // Check if the product ID parameter is not null
        if (produitId != null) {
            Produit produit = produitDAO.findById(Integer.parseInt(produitId));

            // Récupérer la quantité et le supplément du formulaire
            int quantite;
            try {
                quantite = Integer.parseInt(request.getParameter("quantite"));
            } catch (NumberFormatException e) {
                // Handle the case where the quantity is not a valid integer
                // For example, display an error message and return
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid quantity");
                return;
            }
            String supplement = request.getParameter("supplement");

            // Créer un objet Commande avec les détails
            // You might want to pass the current date here instead of null
            Commande commande = new Commande(produit.getId(), produit, quantite, supplement, null);

            // Récupérer la liste des commandes actuelle de la session
            HttpSession session = request.getSession();
            List<Commande> panier = (List<Commande>) session.getAttribute("panier");
            if (panier == null) {
                panier = new ArrayList<>();
            }

            // Ajouter la nouvelle commande à la liste
            panier.add(commande);

            // Mettre à jour la liste des commandes dans la session
            session.setAttribute("panier", panier);

            // Transférer la requête à la JSP
            request.getRequestDispatcher("panier.jsp").forward(request, response);
        } else {
            // Handle the case where the product ID parameter is missing
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing product ID");
        }
    }

}