<%@page import="entities.Categories"%>
<%@page import="entities.Products"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <% List<Products> products =(List<Products>) request.getAttribute("productsTable"); %>
    <%
    Products cl=(Products) request.getAttribute("productValue");
%>
    <% List<Categories> categories =(List<Categories>) request.getAttribute("categoriesTable"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
  <link rel="shortcut icon" type="image/png" href="images/logo.png">
<link rel="stylesheet" href="https://cdn.datatables.net/v/dt/dt-1.13.4/datatables.min.css" rel="stylesheet"/>
 <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css"/>
 
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap4.min.js"></script>
</head>
<body>
<%@ include file="navBar.jsp" %>
<h3>Ajouter un nouveau produit</h3>
<div class="container">
<form action="ProductServlet" method="POST">

	
	<input type="hidden" name="id" value="<%= (cl==null)? 0:cl.getId_prod()%>"/>
	<div class="form-group">
	<label for="nom">Nom</label>
	<input  class="form-control" type="text" name="nom" id="nom" required value="<%= (cl==null)? "":cl.getName()%>"/>
	</div>
	
	<div class="form-group">
	<label for="type">Type</label>
	<input class="form-control" type="text" name="type" id="type" required value="<%= (cl==null)? "":cl.getType()%>"/>
	</div>
	
	<div class="form-group">
	<label for="nom">Categorie</label>
	<select class="form-control" name="categorie" id="categorie">
	<% for (Categories s : categories) {
		%>
		<option <%if(cl!=null && s.getId_Cat()==cl.getCategory().getId_Cat()){%> selected <%} %> value="<%= s.getId_Cat()%>"><%= s.getLibelle() %></option>
	<%
			}
			%>
	</select>
	</div>
	
	
	<button  class="form-control btn btn-primary" type="submit" width="50%" height="50%">Valider</button>

</form>
</div>
</br>
	<h3>La liste des produits</h3>
	<div class="container">
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
				<td><a href="ProductServlet?id=<%= p.getId_prod()%>&action=view" class="btn btn-primary">modifier</a><a href="ProductServlet?id=<%= p.getId_prod()%>&action=delete" class="btn btn-danger" onclick="alert('vous voulez vraiment supprimer !')">supprimer</a></td>
				
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
	

<div>
	<%@ include file="footer.jsp" %>
	</div>
	<style>
	h3{
	margin:15px 15px;}
	</style>
</body>
</html>