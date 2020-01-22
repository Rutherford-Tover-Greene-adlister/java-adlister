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

<%--<p> TestAofoasijfoasjdfoasif </p>--%>
    <div class="container">
            <div class="col-md-6">
                <form action="/ads/editAd" method="post">
                    <input type="hidden"  name="adId" value="${ad.id}" >
                    <input id="title" name="title" type="text" disabled value="${ad.title}">
                    <input id="description"  name="description" type="text" disabled value="${ad.description}">
                    <input type="submit" id="submitButton" value="Save" style="display: none;">
                </form>

                    <%--  Delete Button --%>
                <form action="/ads/deleteAd" method="post">
                    <input type="hidden" id = "deleteButton" name="adId" value="${ad.id}" >
<%--                 <input type="button" value="click here to open modal window" id="loader"/>--%>
                    <input type="submit" value="Delete">
                </form>
                <%-- Edit Button --%>
                <button id ="editButton">Edit</button>





<%--                <form action="/ads/editAd" method="post">--%>
<%--                    <input type="hidden" name="editId" value="${ad.id}" >--%>
<%--                    &lt;%&ndash;                 <input type="button" value="click here to open modal window" id="loader"/>&ndash;%&gt;--%>
<%--                    <input type="submit" value="Edit">--%>
<%--                </form>--%>

            </div>
    </div>
<script>
        $(document).ready(function(){
            $('#editButton').click(function(){
                if ($('#title').attr('disabled'))
                    $('#title').removeAttr('disabled');
                else $('#title').attr('disabled', 'disabled');

                if ($('#description').attr('disabled'))
                    $('#description').removeAttr('disabled');
                else $('#description').attr('disabled', 'disabled');

            });
        });

        $(document).ready(function () {
            $('#editButton').click(function () {
                $("#submitButton").show();
            })
        });
        $(document).ready(function () {
            $('#editButton').click(function () {
                $("#deleteButton").hide();
            })
        });


</script>



</body>
</html>
