<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="stylesheet.css">

<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <h1>Welcome, ${sessionScope.user.username}!</h1>
    <a href="/ads/create">create ad</a>
</div>


    <c:forEach var="ad" items="${ads}">
            <h1>${ad.title}</h1>
            <h2>${ad.categoryName}</h2>
            <p>${ad.description}</p>

            <%-- delete ad--%>
            <form action="deleteAd" method="post">
                <button name="adDelete" value="${ad.id}">Delete Ad</button>
            </form>

            <%--Edit ad--%>
            <form action="editAd" method="GET">
                <button name="adEdit" value="${ad.id}">Edit Ad</button>
            </form>

    </c:forEach>



</body>
</html>
