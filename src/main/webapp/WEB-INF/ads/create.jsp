<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="../stylesheet.css">
<link href="https://fonts.googleapis.com/css?family=Ubuntu&display=swap" rel="stylesheet">

<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad"/>
    </jsp:include>

</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container" id="CreateCard">
        <h1 id="CreateNewAd">Create a new Ad</h1>
        <form action="/ads/create" method="post">
            <div class="form-group">
                <label for="title" class="CreateTitleCategory">Title</label>
                <input id="title" name="title" class="form-control" type="text">
            </div>
          <div class="form-group">
            <label for="categories" class="CreateTitleCategory">Category</label>
            <select id="categories" name="categories" class="form-control">
                <c:forEach var="cat" items="${cats}">
                    <option value="${cat.category}">${cat.category}</option>
                </c:forEach>
            </select>
        </div>
<%--        <c:forEach var="cat" items="${cats}">--%>
<%--            <div class="form-check form-check-inline">--%>
<%--                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="category${cat.id}" value="${cat.category}">--%>
<%--                <label class="form-check-label" for="category${cat.id}">${cat.category}</label>--%>
<%--            </div>--%>
<%--        </c:forEach>--%>
            <div class="form-group">
                <label for="description"class="CreateTitleCategory">Description</label>
                <textarea id="description" name="description" class="form-control" type="text" ></textarea>
            </div>
            <input type="submit" class="btn btn-block " id="CreateButton">
        </form>
    </div>


<div id="CreateBrain"><img src="../images/brain.png"></div>






</body>
</html>
