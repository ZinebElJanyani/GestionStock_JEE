<%@page import="entities.Commande"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%
Commande commande=(Commande) request.getAttribute("commandeValue");
%>
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
</head>
<body>
<%@ include file="navBar.jsp" %>
 <h1>Commande Details</h1>
    <table>
     
      <tr>
        <td>Identifiant:</td>
        <td><%=commande.getId_com() %></td>
      </tr>
      <tr>
        <td>Date:</td>
        <td><%=commande.getDate() %></td>
      </tr>
      <tr>
        <td>Client:</td>
        
      </tr>
      <tr>
        <td>Nom:</td>
        <td><%= commande.getClient().getNom() %></td>
      </tr>
      <tr>
        <td>Prenom:</td>
        <td><%= commande.getClient().getPrenom() %></td>
      </tr>
       <tr>
        <td>Adresse</td>
        <td><%= commande.getClient().getInformation().getAdresse() %></td>
      </tr>
       <tr>
        <td>Email:</td>
        <td><%= commande.getClient().getInformation().getEmail() %></td>
      </tr>
       <tr>
        <td>Produit:</td>
        
      </tr>
      <tr>
        <td>Nom:</td>
        <td><%= commande.getProduit().getName() %></td>
      </tr>
       <tr>
        <td>Type:</td>
        <td><%= commande.getProduit().getType() %></td>
      </tr>
       <tr>
        <td>Categorie:</td>
        <td><%= commande.getProduit().getCategory().getLibelle() %></td>
      </tr>
    </table>
<div>
	<%@ include file="footer.jsp" %>
	</div>
</body>
</html>