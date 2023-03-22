<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
  <link rel="shortcut icon" type="image/png" href="images/ventes.png">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light"  style="background-color: darkslateblue">
  <a class="navbar-brand" href="#"><img alt="" src="images/logo.png" width="50" height="50"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="home.jsp" style="color: rgb(214, 212, 212);">Accueil <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a style="color: rgb(214, 212, 212);" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        	Gestion des clients
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="ClientServlet?id=0&action=view ">Ajouter un client</a>
        
          <a class="dropdown-item" href="ClientServlet?id=-1&action=view">Gestion clients</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a style="color: rgb(214, 212, 212);" class="nav-link dropdown-toggle" href="CategoryServlet?id=-1&action=view" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        	Gestion des Commandes
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="CommandeServlet?id=0&action=view">Ajouter une commande</a>
        
          <a class="dropdown-item" href="CommandeServlet?id=-1&action=view">Gestion commandes</a>
        </div>
      </li>
      
      
      
      <li class="nav-item active">
        <a class="nav-link" href="CategoryServlet?id=-1&action=view" style="color: rgb(214, 212, 212);">Gestion des categories <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="ProductServlet?id=-1&action=view" style="color: rgb(214, 212, 212);">Gestion des produits</a>
      </li>
      

      
    </ul>
   
  </div>
</nav>
</body>
</html>