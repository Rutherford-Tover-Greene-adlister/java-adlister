<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit Profile"/>
    </jsp:include>
    <style>
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container" id="LoginContainer">
    <h1 id="LoginPlease">Update Profile</h1>

<%--    <form action="update?user=${sessionScope.user.username}" method="post" >--%>
    <form action="editProfile" method="post" >


        <div class="form-group">
            <label for="username" class="LoginUserPassword">Username</label>
            <input id="username" value="${sessionScope.user.username}" name="username" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="email" class="LoginUserPassword">Email</label>
            <input id="email" value="${sessionScope.user.email}" name="email" class="form-control" type="email">
        </div>

        <input type="submit" class=" btn btn-block" id="Loginbutton" value="Submit Changes">

    </form>
</div>
<div id="LoginBrain"><img src="../images/brain.png"></div>


</body>
</html>