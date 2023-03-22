package entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Products")
public class Products implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id_prod;
	private String type;
	private String name;
	
	@OneToMany(mappedBy = "produit", cascade = CascadeType.REMOVE)
	private List<Commande> commandes;
	
	@ManyToOne()
	private Categories category;
	
	public Products(int id_prod, String type, String name) {
		super();
		this.id_prod = id_prod;
		this.type = type;
		this.name = name;
		
		
	}
	public Products() {
		super();
	}
	
		
		public int getId_prod() {
			return id_prod;
		}
		public void setId_prod(int id_prod) {
			this.id_prod = id_prod;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public List<Commande> getCommandes() {
			return commandes;
		}
		public void setCommandes(List<Commande> commandes) {
			this.commandes = commandes;
		}
		public Categories getCategory() {
			return category;
		}
		public void setCategory(Categories category) {
			this.category = category;
		}
	
		
}
