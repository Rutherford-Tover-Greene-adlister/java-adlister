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

<div class="container" id="AdsCard">
    <h1 id="AdsTitle">Here Are all the ads!</h1>
    <div class="row">
        <form action="/ads" method="post" id="AdsSubmitForm" class="mx-auto">
            <h4 id="AdsSearchTitle">Search</h4>
<%--            <label for="catSort">Category</label>--%>
            <div id="AdOption">
            <select id="catSort" name="catSort" class="form-control">
                <c:forEach var="cat" items="${catSelects}">
                    <option value="${cat.category}">${cat.category}</option>
                </c:forEach>
                <option selected value="all" class="AdOption">All</option>
            </select>
            <input type="submit" class="btn  " id="AdsSubmitButton" >
            </div>
        </form>
    </div>
    <div class="row" id="AdsListed">

        <img src="../images/brain.png" id="AdsBrain">

        <c:forEach var="ad" items="${ads}">
            <div class="col-md-6">

                <h2>Title: ${ad.title}</h2>
                <h3>Category:${ad.categoryName}</h3>
                <p>Description:${ad.description}</p>
                    <%-- View single Ad Button --%>
<%--            <form action="/ads/singleAd" method="get">--%>
                <form action="/singleAd" method="get">
                    <input type="hidden" name="adId" value="${ad.id}" >
                    <input type="submit" value="View" id="AdViewButton">
                </form>
            </div>


        </c:forEach>



</div>


</div>


</body>
</html>
