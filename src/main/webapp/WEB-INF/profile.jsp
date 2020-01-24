<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="stylesheet.css">
<link href="https://fonts.googleapis.com/css?family=Ubuntu&display=swap" rel="stylesheet">

<html>

<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="card" id="ProfileCard">


    <h1 id="ProfileWelcome">Welcome, ${sessionScope.user.username}!</h1>

        <img src="images/man.jpeg" class="card-img-top" alt="..." id="ProfileImage">
    <div class="card-body" id=""ProfileCardBody>
<%--        <h5 class="card-title">Card title</h5>--%>
     <div class="container">

<%--    <p class="ProfileCard">User Information: </p>--%>
    <p class="ProfileCard"><img src="images/email.png" id="ProfileEmailLogo"><div id="ProfileEmail">${user.email} </p> </div>
    <a href="/create"><button class="ProfileCreateAdButton">Create Ad</button></a>
    <a href="/editProfile"><button class="ProfileCreateAdButton">Edit Profile</button></a>

        </div>
    </div>


<%--<div class="container">--%>
<%--    <h1>Welcome, ${sessionScope.user.username}!</h1>--%>
<%--    <p>User Information: </p>--%>
<%--    <p>Email: ${user.email}</p>--%>
<%--&lt;%&ndash;    <a href="/ads/create"><button>Create Ad</button></a>&ndash;%&gt;--%>
<%--    <a href="/create"><button>Create Ad</button></a>--%>



<%--<div><img src="images/brain.png" id="ProfileBrain"> </div>--%>


<div class="card " id="ProfileAdsCard">
    <div class="ProfileC card-body " class="ProfileCardFont" id="ProfileCardBody">
    <c:forEach var="ad" items="${ads}">
            <h1 class="ProfileCardFont">Title:${ad.title}</h1>
            <h2 class="ProfileCardFont"> Category:${ad.categoryName}</h2>
            <p class="ProfileCardFont">Descripition:${ad.description}</p>

            <%-- delete ad--%>
            <form action="deleteAd" method="post">
                <button name="adDelete" value="${ad.id}" class="ProfileDeleteEditButton">Delete Ad</button>
            </form>

            <%--Edit ad--%>
            <form action="editAd" method="GET">
                <button name="adEdit" value="${ad.id}"class="ProfileDeleteEditButton">Edit Ad</button>
            </form>
<%--        <img src="images/brain.png" id="ProfileSmallBrain">--%>

        <div id="gap"> </div>

<%--        <hr id="AdsHrLine">--%>

    </c:forEach>


         </div>

    </div>







</body>
</html>
