<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
    <title>edit ad</title>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>


<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<form method="post" action="editAd" id="EditAdContainer">
    <div class="form-group">


        <label for="title" class="EditFont" id="EditTitle">Title</label>
        <input id="title" value="${ad.title}" name="title" class="form-control" type="text">
    </div>

<%--    Catergory dropdown--%>
    <div class="form-group">
        <label for="categories"class="EditFont" id="EditCat">Category</label>
        <select id="categories" name="categories" class="form-control">
            <c:forEach var="cat" items="${cats}">
                <c:if test="${ad.categoryName == cat.category}">
                    <option value="${cat.id}" selected>${cat.category}</option>
                </c:if>
                <c:if test="${ad.categoryName != cat.category}">
                    <option value="${cat.id}">${cat.category}</option>
                </c:if>
            </c:forEach>
        </select>
    </div>

<%--    Description field--%>
    <div class="form-group">
        <label for="description"class="EditFont" id="EditDescrp" >Description</label>
        <input id="description" value="${ad.description}" name="description" class="form-control" type="text">
    </div>

    <button name="id" value="${ad.id}" class="EditButtonCancel">Update</button>
    <button class="EditButtonCancel" id="EditCancelButton" name="id" value="Cancel">Cancel</button>
</form>

<form method="get" action="profile">


</form>
<div id="CreateBrain"><img src="../images/brain.png"></div>

</body>
</html>