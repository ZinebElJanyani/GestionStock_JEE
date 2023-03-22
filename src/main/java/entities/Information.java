package entities;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Information")
public class Information implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id_inf;
	private String email;
	private String adresse;
	public Information(int id_inf, String email, String adresse) {
		super();
		this.id_inf = id_inf;
		this.email = email;
		this.adresse = adresse;
	}
	public Information() {
		super();
	}
	public int getId_inf() {
		return id_inf;
	}
	public void setId_inf(int id_inf) {
		this.id_inf = id_inf;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	
	
}
