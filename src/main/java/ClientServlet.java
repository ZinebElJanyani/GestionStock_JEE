

import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.GestionRepository;
import entities.Client;
import entities.Information;

/**
 * Servlet implementation class ClientServlet
 */
public class ClientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GestionRepository gestionRepository = new GestionRepository();
	Client c= new Client();
	
	
    
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		this.getClients( request );
		
		request.getRequestDispatcher("client.jsp").forward(request, response);
	}*/

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id=Integer.parseInt(request.getParameter("id"));
		
		Information info = new Information();
		info.setAdresse(request.getParameter("adresse"));
		info.setEmail(request.getParameter("email"));
		
		gestionRepository.save(info);
		
		Client client = new Client();
		if(id!=0) {
			client.setId(id);
		}
		client.setNom(request.getParameter("nom"));
		client.setPrenom(request.getParameter("prenom"));
		client.setInformation(info);
		gestionRepository.updateORsave(client,id);
		
		
		
		this.getClients( request );
		request.getRequestDispatcher("client.jsp").forward(request, response);

	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int id =Integer.parseInt( request.getParameter("id"));
	String action=(String) request.getParameter("action");

	
	if(action.equals("delete")) {
	
		doDelete(request, response);
        
	} else if(action.equals("view")) {
		if(id == 0) {
			 request.setAttribute("clientValue", null);
			 
			request.getRequestDispatcher("Client_form.jsp").forward(request, response);
		}else if(id==-1) {
			this.getClients( request );
			
			request.getRequestDispatcher("client.jsp").forward(request, response);
		}
		
		else {
			getClient( request, id );
			request.getRequestDispatcher("Client_form.jsp").forward(request, response);

		}
		}
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action=(String) req.getParameter("action");
		int id=Integer.parseInt(req.getParameter("id"));
		
		if(action.equals("delete")) {
			Client c = new Client();
			gestionRepository.delete(id,c);
		}
		this.getClients( req );
		req.getRequestDispatcher("client.jsp").forward(req, resp);

	}
	
	
	public void getClients(HttpServletRequest request ){
		List<Object> objets =  gestionRepository.findALL(c);
		List<Client> clients=new ArrayList<Client>();
		for (Object s : objets) {
			clients.add((Client)s);
				}
		
		request.setAttribute("clientsTable", clients);
	}
	public void getClient(HttpServletRequest request,int id ){
		Client c= new Client();
		Client client =  (Client) gestionRepository.findById(id,c);
		
		 request.setAttribute("clientValue", client);
	}
}
