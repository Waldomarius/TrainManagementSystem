<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>

    <c:url var="head" value="/pages/header.jsp"/>
    <jsp:include page='${head}'/>

    <c:url var="style" value="/resources/css/indexuser.css"/>
    <link href='${style}' rel='stylesheet' type='text/css'/>
</head>

<body>

<div class="container input-form">

    <div class="row">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6 center login-header alert alert-info">Train Management System</div>
            <div class="col-md-3"></div>
        </div>

        <div class="row ">

            <div class="col-md-3"></div>

            <div class="well col-md-6 center">

                <div class="alert alert-info login-header">
                    Sales panel
                </div>

                <fieldset>

                    <br/>
                    <form class="form-horizontal" action="/user/passenger" method="get">
                        <p class="center col-md-12 info">
                            <button type="submit" class="btn btn-info btn-lg btn-sign">Passenger's trains</button>
                        </p>
                    </form>

                    <form class="form-horizontal" action="/user/freight" method="get">
                        <p class="center col-md-12 info">
                            <button type="submit" class="btn btn-info btn-lg btn-sign">Freight trains</button>
                        </p>
                    </form>

                    <c:if test="${admin}">

                        <form class="form-horizontal" action="/admin/index" method="get">
                            <p class="center col-md-12 info">
                                <button type="submit" class="btn btn-info btn-lg btn-sign"><i class="glyphicon glyphicon-arrow-left"></i></button>
                            </p>
                        </form>

                    </c:if>

                    <c:if test="${admin !=true}">

                        <form class="form-horizontal" action="/logout" method="get">
                            <p class="center col-md-12 info">
                                <button type="submit" class="btn btn-info btn-lg btn-sign"><i class="glyphicon glyphicon-log-out"></i>&nbsp; Log out</button>
                            </p>
                        </form>

                    </c:if>

                    <br/>

                </fieldset>
            </div>

            <div class="col-md-3"></div>

        </div>
    </div>
</div>


</body>
</html>
