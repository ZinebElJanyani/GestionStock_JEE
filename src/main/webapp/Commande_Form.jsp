<%@page import="entities.Products"%>
<%@page import="entities.Commande"%>
<%@page import="entities.Categories"%>
<%@page import="java.util.List"%>
<%@page import="entities.Client"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
Commande commande=(Commande) request.getAttribute("commandeValue");
    List<Products> products =(List<Products>) request.getAttribute("productsTable");
%>
<% List<Client> clients =(List<Client>) request.getAttribute("clientsTable"); %>

<%! int client_id=0;
int product_id=0; %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
  <link rel="shortcut icon" type="image/png" href="images/logo.png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css"/>
 
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap4.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="navBar.jsp" %>
<h3>Pour ajouter une nouvelle commande sélectionner un client puis un produit (la date est optionnelle.)</h3>

<div class="container">
<form action="CommandeServlet" method="POST">

	
	<input type="hidden" name="id" value="<%= (commande==null)? 0:commande.getId_com() %>"/>
	 <div class="form-group">
	 <label for="date">Date</label>
	<input type="Date" name="date" id="date" value="<%= (commande==null)? "":commande.getDate() %>"/>
	</div>
	<input type="hidden" name="id_produit" id="id_produit" value="<%= (commande==null)? "":commande.getClient().getId() %>"/>
	<input type="hidden" name="id_client" id="id_client" value="<%= (commande==null)? "":commande.getProduit().getId_prod() %>" />
	
	<h4>La liste des clients</h4>
	<div class="container">
	<table id="example" class="table table-striped" style="width:100%">
        <thead>
            <tr>
              <th>Nom</th>
				<th>Prenom</th>
				<th>Adresse</th>
				<th>Email</th>
				<th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% for (Client s : clients) {
		%>
		<tr>
			<td><%=s.getNom() %></td>
			<td><%=s.getPrenom() %></td>
			<td><%=s.getInformation().getAdresse() %></td>
			<td><%=s.getInformation().getEmail() %></td>
			<td><button class="btn btn-primary" class="form-control" type="button" onclick="createHiddenInput1('<%=s.getId() %>')" >Choisir</button></td>			
		</tr>
		<%
			}
			%>
            
    
        </tbody>
        <tfoot>
            <tr>
               <th>Nom</th>
				<th>Prenom</th>
				<th>Adresse</th>
				<th>Email</th>
				<th>Action</th>
            </tr>
        </tfoot>
    </table>
	</div>
	<script>$(document).ready(function () {
	    $('#example').DataTable();
	});</script>
	
	<div class="container">
	<h4>La liste des produits</h4>
	<table id="example" class="table table-striped" style="width:100%">
        <thead>
            <tr>
             <th>Name</th>
			<th>Type</th>
			<th>Categorie</th>
			<th>Action</th>
            </tr>
        </thead>
        <tbody>
           
			<% for (Products p : products) {
			%>
			<tr>
				<td><%= p.getName()%></td>
				<td><%= p.getType()%></td>
				<td><%= p.getCategory().getLibelle()%></td>
				<td><a href="ProductServlet?id=<%= p.getId_prod()%>&action=view" class="btn btn-primary">modifier</a><a href="ProductServlet?id=<%= p.getId_prod()%>&action=delete" class="btn btn-danger">supprimer</a></td>
				
			</tr>
			<%
			}
			%>
            
            
        </tbody>
        <tfoot>
            <tr>
                <th>Name</th>
				<th>Type</th>
			<th>Categorie</th>
				<th>Action</th>
            </tr>
        </tfoot>
    </table>
	</div>
	
	<script>$(document).ready(function () {
	    $('#example').DataTable();
	});</script>
	</table>
	
	<script>
function createHiddenInput1(value) {
    
	 document.getElementById("id_client").value = value; 
	
	
}
function createHiddenInput2(value) {
    
	 document.getElementById("id_produit").value = value;
	
	
}
</script>
	<button style="text-align:center" class="btn btn-primary" type="submit">Ajouter</button>
	
</form>
</div>
<div>
	<%@ include file="footer.jsp" %>
	</div>
	<style>
	h3{
	margin:20px 20px;}
	
	h4{
	margin:30px 30px;
	}
	</style>
</body>
</html>