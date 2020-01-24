<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="stylesheet.css">


<html>
<head>
    <title>Single Ad</title>

    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="view an Ad"/>
    </jsp:include>

</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />


<div class="card mx-auto" id= "singleAd" style="width: 40rem;">
<img class="card-img-top" src="${image}" alt="Card image cap">

    <div class="card-body">
        <h4 class="card-title">${ad.title}</h4>
        <h5>${ad.categoryName}</h5>

        <p class="card-text">${ad.description}</p>

        <%--User who posted the ad information--%>
        <p class="card-text">Contact user for more information:</p>
        <p class="card-text"><small><p>Email: ${user.email}</p> </small></p>
        <p class="card-text"><small class="text-muted"> Created by: ${user.username}</small></p>
    </div>
</div>
<form method="post">
    <a href="/singleAd"><button id="backBtn" class="backBtn mx-auto" name="id" value="Back">Back</button></a>
</form>





</body>
</html>
