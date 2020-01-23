<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!"/>
    </jsp:include>
    <link rel="stylesheet" type="text/css" href="stylesheet.css">

</head>
<body>
<jsp:include page="partials/navbar.jsp"/>
<div class="container">
    <h1>Please fill in your information.</h1>
<%--    <script>--%>
<%--        alert("${lastPage}");--%>
<%--    </script>--%>
<%--    <form action="/register" method="post">--%>
    <form action="/register" class="needs-validation" method="post" novalidate>
        <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text"
                <c:if test="${reloadUser != null}"> value="${username}" </c:if>
                       required>
                <div class="invalid-feedback">Username is Required</div>
                <c:if test="${userFail}">
                <small id="usedUsernameError" class="form-text text-danger">ERROR: That username is not available. Please enter a new username.</small>
                </c:if>


        </div>
        <div class="form-group">
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control" type="text"
                <c:if test="${reloadUser != null}"> value="${email}" </c:if>
                       required>
                <div class="invalid-feedback">Email is Required</div>


        </div>
        <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password"
                <c:if test="${reloadUser != null}"> value="${password}" </c:if>
                       required>
                <div class="invalid-feedback">Password is Required</div>


        </div>
        <div class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <input id="confirm_password" name="confirm_password" class="form-control" type="password"
                <c:if test="${reloadUser != null}"> value="${confirm_password}" </c:if>
                       required>
                <div class="invalid-feedback">Must confirm password</div>
                <c:if test="${passwordFail}">
                    <small id="usedUsernameError" class="form-text text-danger">ERROR: passwords do not match.</small>
                </c:if>


        </div>
        <input type="submit" class="btn btn-primary btn-block">
    </form>
</div>
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
