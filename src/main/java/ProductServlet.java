

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.GestionRepository;
import entities.Categories;
import entities.Client;
import entities.Products;


public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GestionRepository gestionRepository = new GestionRepository();
	Products p= new Products();
    
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id =Integer.parseInt( request.getParameter("id"));
		String action=(String) request.getParameter("action");
		
		request.setAttribute("productValue", null);
		this.getProducts( request );
		CategoryServlet cs = new CategoryServlet();
		cs.getCategogies(request);
		
		if(action.equals("delete")) {
			
			doDelete(request, response);
	        
		} else if(action.equals("view")) {
			 
			if(id==-1) {
				
				request.getRequestDispatcher("Produit.jsp").forward(request, response);
			}
			
			else {
				getProduct(request, id);
				request.getRequestDispatcher("Produit.jsp").forward(request, response);
			}
			}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		
		Products prod = new Products();
		if(id!=0) {
			prod.setId_prod(id);
		}
		prod.setName(request.getParameter("nom"));
		prod.setType(request.getParameter("type"));
		
		int id_cat=Integer.parseInt( request.getParameter("categorie"));
		Categories cat = (Categories) gestionRepository.findById(id_cat, new Categories());
		
		prod.setCategory(cat);
		gestionRepository.updateORsave(prod,id);
		
		
		request.setAttribute("productValue", null);
		this.getProducts( request );
		CategoryServlet cs = new CategoryServlet();
		cs.getCategogies(request);
		request.getRequestDispatcher("Produit.jsp").forward(request, response);
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action=(String) req.getParameter("action");
		int id=Integer.parseInt(req.getParameter("id"));
		
		if(action.equals("delete")) {
		
			gestionRepository.delete(id,p);
		}
		req.setAttribute("productValue", null);
		this.getProducts( req);
		CategoryServlet cs = new CategoryServlet();
		cs.getCategogies(req);
		req.getRequestDispatcher("Produit.jsp").forward(req, resp);

	
	}
	
	public void getProducts(HttpServletRequest request ){
		List<Object> objets =  gestionRepository.findALL(p);
		List<Products> products= new ArrayList<Products>();
		for (Object s : objets) {
			products.add((Products)s);
				}
		
		request.setAttribute("productsTable", products);
	}
	public void getProduct(HttpServletRequest request,int id ){
		Products ps= new Products();
		Products product =  (Products) gestionRepository.findById(id,ps);
		
		 request.setAttribute("productValue", product);
	}
}
