

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
import entities.Information;

public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GestionRepository gestionRepository = new GestionRepository();
	Categories c= new Categories();
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id =Integer.parseInt( request.getParameter("id"));
		String action=(String) request.getParameter("action");

		
		if(action.equals("delete")) {
		
			doDelete(request, response);
	        
		} else if(action.equals("view")) {
			 request.setAttribute("categoryValue", null);
			 if(id==-1) {
				this.getCategogies( request );
				
				request.getRequestDispatcher("category.jsp").forward(request, response);
			}
			
			else {
				this.getCategogies( request );
				getCategory(request, id);
				request.getRequestDispatcher("category.jsp").forward(request, response);

			}
			}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int id=Integer.parseInt(request.getParameter("id"));
		
		Categories cat = new Categories();
		if(id!=0) {
			cat.setId_Cat(id);
		}
		cat.setLibelle(request.getParameter("libelle"));

		gestionRepository.updateORsave(cat,id);
		request.setAttribute("categoryValue", null);
		this.getCategogies(request);
		request.getRequestDispatcher("category.jsp").forward(request, response);
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action=(String) req.getParameter("action");
		int id=Integer.parseInt(req.getParameter("id"));
		
		if(action.equals("delete")) {
		
			gestionRepository.delete(id,c);
		}
		req.setAttribute("categoryValue", null);
		this.getCategogies(req);
		
		req.getRequestDispatcher("category.jsp").forward(req, resp);
	}
	public void getCategogies(HttpServletRequest request ){
		List<Object> objets =  gestionRepository.findALL(c);
		List<Categories> categories= new ArrayList<Categories>();
		for (Object s : objets) {
			categories.add((Categories)s);
				}
		
		request.setAttribute("categoriesTable", categories);
	}
	public void getCategory(HttpServletRequest request,int id ){
		Categories c= new Categories();
		Categories category =  (Categories) gestionRepository.findById(id,c);
		
		 request.setAttribute("categoryValue", category);
	}
}
