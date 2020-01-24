<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="../stylesheet.css">
<link href="https://fonts.googleapis.com/css?family=Ubuntu&display=swap" rel="stylesheet">

<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad"/>
    </jsp:include>

</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container" id="CreateCard">
        <h1 id="CreateNewAd">Create a new Ad</h1>
        <form action="/create" class="needs-validation" method="post" novalidate>
            <div class="form-group">
                <label for="title" class="CreateTitleCategory">Title</label>
                <input id="title" name="title" class="form-control" <c:if test="${title != null}">value="${title}"</c:if> type="text" required>
                <div class="invalid-feedback">Title is Required</div>
            </div>
          <div class="form-group">
            <label for="categories" class="CreateTitleCategory">Category</label>
            <select id="categories" name="categories" class="form-control" required>
                <c:forEach var="cat" items="${cats}">
                    <option value="${cat.category}"
                            <c:if test="${(categories != null) && (cat.category == categories)}">
                                selected
                            </c:if>>${cat.category}</option>
                </c:forEach>
            </select>
              <div class="invalid-feedback">Category is Required</div>
        </div>
<%--        <c:forEach var="cat" items="${cats}">--%>
<%--            <div class="form-check form-check-inline">--%>
<%--                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="category${cat.id}" value="${cat.category}">--%>
<%--                <label class="form-check-label" for="category${cat.id}">${cat.category}</label>--%>
<%--            </div>--%>
<%--        </c:forEach>--%>
            <div class="form-group">
                <label for="description" class="CreateTitleCategory">Description</label>
                <textarea id="description" name="description" class="form-control" <c:if test="${description != null}">
                    value="${description}"</c:if> type="text" required></textarea>
                <div class="invalid-feedback">Description is Required</div>
            </div>
            <input type="submit" class="btn btn-block " id="CreateButton">
        </form>
    </div>

<div id="CreateBrain"><img src="../images/brain.png"></div>


<script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function() {
        'use strict';
        window.addEventListener('load', function() {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function(form) {
                form.addEventListener('submit', function(event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>


</body>
</html>
