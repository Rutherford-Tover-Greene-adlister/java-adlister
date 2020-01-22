<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
    </jsp:include>
<%--    <link rel="stylesheet" type="text/css" href="stylesheet.css">--%>

</head>

<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <h1>Here Are all the ads!</h1>
    <div class="row">
        <form action="/ads" method="post">
            <h4>Search</h4>
            <label for="catSort">Category</label>
            <select id="catSort" name="catSort" class="form-control">
                <c:forEach var="cat" items="${catSelects}">
                    <option value="${cat.category}">${cat.category}</option>
                </c:forEach>
                <option selected value="all">All</option>
            </select>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </div>
    <div class="row">
        <c:forEach var="ad" items="${ads}">
            <div class="col-md-6">
                <h2>${ad.title}</h2>
                <h3>${ad.categoryName}</h3>
                <p>${ad.description}</p>
                    <%-- View Ad Button --%>
                <form action="/ads/singleAd" method="get">
                    <input type="hidden" name="adId" value="${ad.id}" >
                    <input type="submit" value="View">
                </form>
            </div>
        </c:forEach>
    </div>

</div>

</body>
</html>
