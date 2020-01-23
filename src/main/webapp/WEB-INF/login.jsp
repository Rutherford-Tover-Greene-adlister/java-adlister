<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In"/>
    </jsp:include>
    <link rel="stylesheet" type="text/css" href="stylesheet.css">
    <link href="https://fonts.googleapis.com/css?family=Khand&display=swap" rel="stylesheet">


</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container" id="LoginContainer">
        <h1 id="LoginPlease">Please Log In</h1>
        <form action="/login" method="POST">
            <div class="form-group">
                <label for="username" class="LoginUserPassword">Username</label>
                <input id="username" name="username" class="form-control"
                <c:if test="${failLogin != null}">value="${failLogin}"</c:if>
                       type="text">
            </div>
            <div class="form-group">
                <label for="password" class="LoginUserPassword">Password</label>
                <input id="password" name="password" class="form-control" type="password">
                <c:if test="${failLogin != null}">
                    <small id="usedUsernameError" class="form-text text-danger">ERROR: Incorrect password</small>
                </c:if>
            </div>
            <input type="submit" class="btn  btn-block" value="Log In" id="Loginbutton">
        </form>
    </div>



    <div id="LoginBrain"><img src="images/brain.png"></div>


</body>
</html>
