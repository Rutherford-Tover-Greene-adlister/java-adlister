<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <h1>Here Are all the ads!</h1>
    <div id="searchBar">
        <h4>search</h4>
        <label for="catSort">Category</label>
        <select id="catSort" name="catSort" class="form-control">
            <c:forEach var="cat" items="${catSelects}">
                <option value="${cat.category}">${cat.category}</option>
            </c:forEach>
        </select>
    </div>
    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <h3>${ad.categoryName}</h3>
            <p>${ad.description}</p>
        </div>
    </c:forEach>
</div>

</body>
</html>
