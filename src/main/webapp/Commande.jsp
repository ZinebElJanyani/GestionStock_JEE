<%@page import="entities.Commande"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% List<Commande> commandes =(List<Commande>) request.getAttribute("commandesTable"); %>
    
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

	<h3>La liste des commandes</h3>
	
	<div class="container">
	<table id="example" class="table table-striped" style="width:100%">
        <thead>
            <tr>
            <th>Identifiant</th>
			<th>Date</th>
			<th>Client</th>
			<th>Produit</th>
			<th>Action</th>
            </tr>
        </thead>
        <tbody>
           
			<% for (Commande s : commandes) {
		%>
		<tr>
			<td><%=s.getId_com() %></td>
			<td><%=s.getDate() %></td>
			<td><%=s.getClient().getPrenom() %></td>
			<td><%=s.getProduit().getName() %></td>
			<td><a href="CommandeServlet?id=<%= s.getId_com()%>&action=view" class="btn btn-primary">afficher</a><a href="CommandeServlet?id=<%= s.getId_com()%>&action=delete" class="btn btn-danger" onclick="alert('vous voulez vraiment supprimer !')">supprimer</a></td>
			
		</tr>
		<%
			}
			%>
            
            
        </tbody>
        <tfoot>
            <tr>
             <th>Identifiant</th>
			<th>Date</th>
			<th>Client</th>
			<th>Produit</th>
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