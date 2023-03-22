package entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "Commande")
public class Commande implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
    private int id_com;
	
	@Temporal(TemporalType.DATE) 
	Date date;

	@ManyToOne
	private Client client;
	
	@ManyToOne
	private Products produit;
	
	public int getId_com() {
		return id_com;
	}
	public void setId_com(int id_com) {
		this.id_com = id_com;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Commande(int id_com, Date date) {
		super();
		this.id_com = id_com;
		this.date = date;
	}
	public Commande() {
		super();
	}
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	public Products getProduit() {
		return produit;
	}
	public void setProduit(Products produit) {
		this.produit = produit;
	}
	

}

