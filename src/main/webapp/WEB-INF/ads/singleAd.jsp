<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Single Ad</title>

    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="view an Ad"/>
    </jsp:include>

</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />


<div class="card mb-3" style="max-width: 540px;">
    <div class="row no-gutters">
        <div class="col-md-4">

    <%--Takes in the image from the singleAdServlet (that calls the switch case in AdDao --%>
            <img src="${image}" class="card-img" alt="...">
        </div>
        <div class="col-md-8">
            <div class="card-body">
                <h4 class="card-title">${ad.title}</h4>
                <h5>${ad.categoryName}</h5>

                <p class="card-text">${ad.description}</p>

                <%--User who posted the ad information--%>
                <p class="card-text">Contact user for more information:</p>
                <p class="card-text"><small><p>Email: ${user.email}</p> </small></p>
                <p class="card-text"><small class="text-muted"> Created by: ${user.username}</small></p>
            </div>
        </div>
    </div>
</div>




</body>
</html>
