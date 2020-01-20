<%--
  Created by IntelliJ IDEA.
  User: laurentovar
  Date: 1/19/20
  Time: 6:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="View a single Ad" />

    </jsp:include>

    <title>Single Ad</title>
</head>
<body>

<p> TestAofoasijfoasjdfoasif </p>
    <div class="container">
            <div class="col-md-6">
                <h2>${ad.title}</h2>
                <p>${ad.description}</p>

<%--                Delete Button --%>
                <form action="/ads/deleteAd" method="post">
                    <input type="hidden" name="adId" value="${ad.id}" >
<%--                 <input type="button" value="click here to open modal window" id="loader"/>--%>
                    <input type="submit" value="Delete">
                </form>


            </div>
    </div>
<script>
        $(document).ready(function(){
            $("#loader").click(function(){
                // Load the page into the div
                $("#resultreturn").load("b.html");
                // Show the modal dialog
                $("#resultreturn").dialog({ modal: true });
            });
        });
</script>



</body>
</html>
