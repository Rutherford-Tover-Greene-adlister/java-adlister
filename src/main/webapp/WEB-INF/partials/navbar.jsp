
<link href="https://fonts.googleapis.com/css?family=Khand&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Concert+One&display=swap" rel="stylesheet">

<nav class="navbar">

<!-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> -->
<!-- <nav class="navbar navbar-default"> -->

    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" id="fontNavAd" href="/ads"><img id="NavIcon" src="images/idea (1).png"></a>
        </div>
        <div id="navBrain"> LESSON</div>
        <ul class="nav navbar-nav navbar-right">

         <div id="NavLoginLogoutContainer">
            <c:if test="${empty user}">
            <div id="NavLoginContainer">
             <li><a href="/register"id="NavRegister" class="NavFontLoginLogout">
                 <div id="WordRegister">
                     Register
                 </div></a></li>
                </div><hr>
                <div id="NavLogoutContainer">
                    <li><a href="/login" id="NavLogin" class="NavFontLoginLogout">Login</a></li>
                </div>
            </c:if>
            <c:if test="${not empty user}">
                <div id="NavLoginContainer">
                <li><a href="/profile"id="NavProfile" class="NavFontLoginLogout">
                <div id="WordProfile">
                Profile
                </div></a></li>
                </div><hr>
             <div id="NavLogoutContainer">
             <li><a href="/logout" id="NavLogout" class="NavFontLoginLogout">Logout</a></li>
             </div>
            </c:if>
         </div>

<%--                        <jsp:useBean id="user" scope="request" type=""/>--%>
<%--           <c:if test="${not empty user}">--%>
<%--                <li><a href="/profile">Profile</a></li>--%>
<%--                <li><a href="/logout">Logout</a></li>--%>
<%--            </c:if>--%>
<%--            <c:if test="${empty user}">--%>
<%--                <li><a href="/register">Register</a></li>--%>
<%--                <li><a href="/login">Login</a></li>--%>
<%--            </c:if>--%>

        </ul>
    </div><!-- /.navbar-collapse -->
<%--    </div><!-- /.container-fluid -->--%>
</nav>
<div id="navLister"> LISTER </div>
