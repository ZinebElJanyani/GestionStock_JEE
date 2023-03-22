import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dao.GestionRepository;
import entities.Categories;
import entities.Client;
import entities.Commande;
import entities.Information;
import entities.Products;

public class main {

	public static void main(String[] args) {
		
		GestionRepository gestionRepository = new GestionRepository();
		
		Information info = new Information();
		/*info.setAdresse("fes/Rue : Badr");
		info.setEmail("rajae.fikri@gmail.com");
		gestionRepository.save(info);*/
		
		Client c =new Client();
		/*c.setNom("Nasiri");
		c.setPrenom("fati");
		c.setInformation(info);
		
		gestionRepository.save(c);
		System.out.println("koko");
		
		
		
		List<Object> objets =  gestionRepository.findALL(c);
		List<Client> clients=new ArrayList<Client>();
		for (Object s : objets) {
			clients.add((Client)s);
			
				}
		for (Client cl : clients) {
			
			System.out.println("Nom"+cl.getNom());
			System.out.println("Prenom"+cl.getPrenom());
			System.out.println("Adresse"+cl.getInformation().getAdresse());
			System.out.println("Email"+cl.getInformation().getEmail());
				}*/
		
		/*Client cl = (Client) gestionRepository.findById(352, c);
		System.out.println("Nom"+cl.getNom());
		System.out.println("Prenom"+cl.getPrenom());
		System.out.println("Adresse"+cl.getInformation().getAdresse());
		System.out.println("Email"+cl.getInformation().getEmail());*/
		
		/*c.setNom("nasir");
		c.setPrenom("warda");
		Client m=new Client();
		
		m.setId(302);
		m.setNom("HT");
		m.setPrenom("laila");
		info.setAdresse("casa");
		info.setEmail("email.laila@gmail.com");
		m.setInformation(info);
		
		Client clm = (Client) gestionRepository.update(m);
		//Client clm = (Client) gestionRepository.updateORsave(c, 3);
		
		System.out.println("Nom"+clm.getNom());
		System.out.println("Prenom"+clm.getPrenom());*/
		//System.out.println("Adresse"+clm.getInformation().getAdresse());
		//System.out.println("Email"+clm.getInformation().getEmail());
		// gestionRepository.delete(602,c);
		
		Categories ca =new Categories();
		/*cat.setLibelle("pcs");
	
		
		gestionRepository.save(cat);*/
		//Categories cat= (Categories) gestionRepository.findById(851, ca);
		
		Products product = (Products) gestionRepository.findById(1251, new Products());
		Client cl = (Client) gestionRepository.findById(201, new Client());
		
		Commande commande = new Commande();
		commande.setClient(cl);
		commande.setProduit(product);
		commande.setDate(new Date());
		gestionRepository.save(commande);
		
		/*product.setName("best tv");
		product.setType("electro");
		product.setCategory(cat);
		gestionRepository.save(product);*/
		
		/*Products product2 =new Products();
		product2.setName("old tv");
		product2.setType("electro");
		product2.setCategory(cat);
		gestionRepository.save(product2);*/
		
		//gestionRepository.delete(1001,product);
		
		//gestionRepository.delete(901,ca);
		 
	}
}
