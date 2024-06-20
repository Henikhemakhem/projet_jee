package model;

import java.sql.Date;
import java.util.Set;

import jakarta.persistence.*;

@Entity
@Table(name = "LigneCommande")
public class LigneCommande {
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;
	
	@ManyToOne
	@JoinColumn(name="id_commande")
	private Commande commande;
	@ManyToOne
	@JoinColumn(name="id_produit")
	private Produit produit;
    private int quantité_client;
    private  String suppliment;

}
