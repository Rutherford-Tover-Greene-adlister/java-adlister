<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
<head>


    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!"/>
    </jsp:include>



</head>


<body>



<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<%--DESKTOP VIEW--%>

<div class="bd">
    <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
               <div class="container"> <img src="images/letter-blocks-247819.jpg" class="d-block w-100" alt="...">
               </div>
                <div class="carousel-caption d-none d-md-block">
<%--                    <h5></h5>--%>
                    <p  class="carouselBox">LessonLister, is a place to find or teach lessons on topics your passionate about. </p>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container"><img src="images/camera.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-caption d-none d-md-block">
<%--                    <h5></h5>--%>
                    <p class="carouselBox">Do you have a skill or topic you'd be good at teaching at? On LessonLister you can create that experience and get paid while teaching something you love. </p>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container"><img src="images/man-beside-flat-screen-television-with-photos-background-716276.jpg" class="d-block w-100" alt="...">
            </div>
                <div class="carousel-caption d-none d-md-block">
<%--                    <h5></h5>--%>
                    <p  class="carouselBox">Tutors can be expensive and hard to work with your schedule, LessonLister provides plenty of options to choose from to meet your tutoring needs.</p>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

</div>
</div>

<%--END OF DESKTOP VIEW --%>

<%--MOBILE VIEW--%>

<div id="Mainpic"><img src="images/camera.jpg"></div>


<div class="accordion" id="accordionExample">
    <div class="card" id="HomeCard">
        <div class="card-header" id="headingOne">
            <h2 class="mb-0">
                <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                   <div class="arrow"> <img src="images/up-arrow.png">
                      What is Lesson Lister?
                      </div>
                </button>
            </h2>
        </div>

        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
            <div class="card-body">
                LessonLister, is a place to find or teach lessons on topics your passionate about.
            </div>
        </div>
    </div>
    <div class="card" id="HomeCard">
        <div class="card-header" id="headingTwo">
            <h2 class="mb-0">
                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    <div class="arrow"> <img src="images/up-arrow.png">
                        Have a skill ?
                    </div>
                </button>
            </h2>
        </div>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
            <div class="card-body">
                On LessonLister you can create that experience and get paid while teaching something you love.
            </div>
        </div>
    </div>
    <div class="card" id="HomeCard">
        <div class="card-header" id="headingThree">
            <h2 class="mb-0">
                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    <div class="arrow"> <img src="images/up-arrow.png"> Need to find a tutor? </div>
                </button>
            </h2>
        </div>
        <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
            <div class="card-body">
                Tutors can be expensive and hard to work with your schedule, LessonLister provides plenty of options to choose from to accommodate your schedule.
            </div>
        </div>
    </div>
</div>


<%--END OF MOBILE VIEW--%>








<%--CIRCLE SHAPE--%>

<%--<div id="circle"></div>--%>
<div id="circleBrain"><img src="images/brain.png"></div>


<div id="iglogo"><img src="images/instagram.png"></div>

<div id="twitlogo"><img src="images/twitter.png"></div>

<div id="facelogo"><img src="images/facebook.png"></div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<%--<!-- <jsp:include page="/WEB-INF/partials/navbar.jsp"/>--%>
<%--<div class="container">--%>
<%--    <h1>Welcome to the Adlister!</h1>--%>

<%--</div> -->--%>

<div id="bottomB">Copyright © 2020 | Contact Us | Careers | Development </div>

</body>
</html>
