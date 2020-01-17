<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad"/>
    </jsp:include>
</head>
<body>
<div class="container">
    <h1>Create a new Ad</h1>
    <form action="/ads/create" method="post">
        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="categories">Category</label>
            <select multiple id="categories" class="form-control">
                <c:forEach var="cat" items="${cats}">
                    <option>${cat.category}</option>
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
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control" type="text"></textarea>
        </div>
        <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>
</body>
</html>
