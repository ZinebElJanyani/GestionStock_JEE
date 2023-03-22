<%@page import="entities.Categories"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% List<Categories> categories =(List<Categories>) request.getAttribute("categoriesTable"); %>
    <%
    Categories cl=(Categories) request.getAttribute("categoryValue");
%>
    
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="navBar.jsp" %>
<h3>Ajouter une nouvelle categorie</h3>
<div class="container">
<form action="CategoryServlet" method="POST">

	
	<input type="hidden" name="id" value="<%= (cl==null)? 0:cl.getId_Cat()%>"/>
	<div class="form-group">
	<label for="libelle">Libellé</label>
	<input class="form-control" type="text" name="libelle" id="libelle" required value="<%= (cl==null)? "":cl.getLibelle() %>"/>
	</div>
	<div class="form-group">
	<button class="btn btn-primary" class="form-control" type="submit" >Valider</button>
	</div>
</form>
</div>
</br>
<h3>La liste des categories</h3>
	<div class="container">
	<table id="example" class="table table-striped" style="width:100%">
        <thead>
            <tr>
              <th>Identifiant</th>
				<th>Libellé</th>
				<th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% for (Categories s : categories) {
		%>
		<tr>
			<td><%=s.getId_Cat() %></td>
			<td><%=s.getLibelle() %></td>
			
			<td><a class="btn btn-primary" href="CategoryServlet?id=<%= s.getId_Cat()%>&action=view">modifier</a><a class="btn btn-danger" href="CategoryServlet?id=<%= s.getId_Cat()%>&action=delete" onclick="alert('vous voulez vraiment supprimer !')">supprimer</a></td>
			
		</tr>
		<%
			}
			%>
            
            
        </tbody>
        <tfoot>
            <tr>
               <th>Identifiant</th>
			<th>Libellé</th>
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