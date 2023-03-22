package entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Categories")
public class Categories implements Serializable {
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id_Cat;
	private String libelle;
	
	
	@OneToMany(mappedBy = "category", cascade = CascadeType.REMOVE)
	private List<Products> produits;
	public int getId_Cat() {
		return id_Cat;
	}
	public Categories(int id_Cat, String libelle) {
		super();
		this.id_Cat = id_Cat;
		this.libelle = libelle;
	}
	public Categories() {
		super();
	}
	public void setId_Cat(int id_Cat) {
		this.id_Cat = id_Cat;
	}
	public String getLibelle() {
		return libelle;
	}
	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}
	

}

