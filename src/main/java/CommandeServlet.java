

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dao.GestionRepository;
import entities.Client;
import entities.Commande;
import entities.Information;
import entities.Products;


public class CommandeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GestionRepository gestionRepository = new GestionRepository();
	Commande commande= new Commande();
  
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id =Integer.parseInt( request.getParameter("id"));
		String action=(String) request.getParameter("action");

		ProductServlet ps = new ProductServlet();
		ps.getProducts(request);
		
		ClientServlet cs = new ClientServlet();
		cs.getClients(request);
		
		if(action.equals("delete")) {
		
			doDelete(request, response);
	        
		} else if(action.equals("view")) {
			if(id == 0) {
				 request.setAttribute("commandeValue", null);
				 
				request.getRequestDispatcher("Commande_Form.jsp").forward(request, response);
			}else if(id==-1) {
				this.getCommandes( request );
				
				request.getRequestDispatcher("Commande.jsp").forward(request, response);
			}
			
			else {
				getCommande(request, id);
				request.getRequestDispatcher("CommandeDetail.jsp").forward(request, response);

			}
			}
	}

	



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		
		Commande command= new Commande();
		if(id!=0) {
			command.setId_com(id);
		}
		
		if(request.getParameter("date")!=null) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date d;
			try {
				d = dateFormat.parse(request.getParameter("date"));
				System.out.println(d);
				command.setDate(d);
			} catch (ParseException e) {
				command.setDate(new Date());
				e.printStackTrace();
			}
			
		}else{
			command.setDate(new Date());
		}
		
		int idC=Integer.parseInt(request.getParameter("id_client"));
		//int idC=(int) request.getAttribute("idC");

		Client cli = (Client) gestionRepository.findById(idC, new Client());
		
		int idP=Integer.parseInt(request.getParameter("id_produit"));
		//int idP=(int) request.getAttribute("idP");
		Products pro = (Products) gestionRepository.findById(idP, new Products());
		
		command.setClient(cli);
		command.setProduit(pro);
		
		gestionRepository.save(command);
		
		this.getCommandes( request );
		
		request.getRequestDispatcher("Commande.jsp").forward(request, response);
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action=(String) req.getParameter("action");
		int id=Integer.parseInt(req.getParameter("id"));
		
		if(action.equals("delete")) {
		
			gestionRepository.delete(id,commande);
		}
		
		this.getCommandes(req);
		
		req.getRequestDispatcher("Commande.jsp").forward(req, resp);
	}
	
	private void getCommandes(HttpServletRequest request) {
		
		List<Object> objets =  gestionRepository.findALL(commande);
		List<Commande> commandes=new ArrayList<Commande>();
		for (Object s : objets) {
			commandes.add((Commande)s);
				}
		
		request.setAttribute("commandesTable", commandes);
	}
	
	public void getCommande(HttpServletRequest request,int id ){
		
		Commande com =  (Commande) gestionRepository.findById(id,commande);
		
		 request.setAttribute("commandeValue", com);
	}
}
