<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<link rel="stylesheet" type="text/css" href="stylesheet.css">--%>

<html>
<head>

    <title>single ad</title>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="single ad"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<%--    <c:forEach var="ad" items="${ads}">--%>
        <h1>${ad.title}</h1>
        <h2>${ad.categoryName}</h2>
        <p>${ad.description}</p>

        <p>Created by: ${user.username}</p>
        <p>Email: ${user.email}</p>
<%--    </c:forEach>--%>






</body>
</html>
