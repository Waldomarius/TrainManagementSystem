<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>

    <c:url var="head" value="/pages/header.jsp"/>
    <jsp:include page='${head}'/>

    <c:url var="style" value="/resources/css/login.css"/>
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

                <div class="alert alert-info">
                    Please login with your Username and Password.
                </div>

                <form class="form-horizontal" action="/j_spring_security_check" method="post">
                    <fieldset>
                        <div class="input-group input-group-lg">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user red"></i></span>
                            <input type="text" class="form-control" name="j_spring_security_username" placeholder="Username">
                        </div>
                        <div class="clearfix"></div>
                        <br>

                        <div class="input-group input-group-lg">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock red"></i></span>
                            <input type="password" class="form-control"  name="j_spring_security_password" placeholder="Password">
                        </div>
                        <div class="clearfix"></div>

                        <br/>
                        <p class="center col-md-12">
                            <button type="submit" class="btn btn-info  btn-sign">Login</button>
                        </p>

                    </fieldset>
                </form>
            </div>

            <div class="col-md-3"></div>

        </div>
    </div>
</div>

</body>
</html>
