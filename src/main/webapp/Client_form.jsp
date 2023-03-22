<%@page import="entities.Client"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="navBar.jsp" %>
<%
Client cl=(Client) request.getAttribute("clientValue");
%>
<h2>Ajouter un nouveau client</h2>
<div class="container">
<form action="ClientServlet" method="POST">

	
	<input type="hidden" name="id" value="<%= (cl==null)? 0:cl.getId() %>"/>
	<div class="form-group">
	<label for="nom">Nom</label>
	<input class="form-control" type="text" name="nom" id="nom" required value="<%= (cl==null)? "":cl.getNom() %>"/>
	</div>
	
	<div class="form-group">
	<label for="prenom">Prenom</label>
	<input class="form-control" type="text" name="prenom" id="prenom" required value="<%= (cl==null)? "": cl.getPrenom() %>"/>
	</div>
	
	<div class="form-group">
	<label for="adresse">Adresse</label>
	<input class="form-control" type="text" name="adresse" id="adresse" value="<%= (cl==null)? "": cl.getInformation().getAdresse() %>"/>
	</div>
	
	<div class="form-group">
	<label for="email">Email</label>
	<input class="form-control" type="text" name="email" id="email" required value="<%= (cl==null)? "": cl.getInformation().getEmail() %>"/>
	</div>
	
	<button class="btn btn-primary" class="form-control " type="submit">Valider</button>
	</div>
	<div>
	<%@ include file="footer.jsp" %>
	</div>
</form>
</body>
</html>