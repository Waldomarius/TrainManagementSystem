<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>

    <c:url var="head" value="/pages/header.jsp"/>
    <jsp:include page='${head}'/>

    <c:url var="style" value="/resources/css/indexadmin.css"/>
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
                    Administrator panel
                </div>

                <fieldset>

                    <br/>
                        <p class="center col-md-12  info">
                            <button type="button" class="btn btn-info btn-lg btn-sign sales">Sales management</button>
                        </p>

                        <p class="center col-md-12 info">
                            <button type="button" class="btn btn-info btn-lg btn-sign trains">Trains management</button>
                        </p>

                        <p class="center col-md-12 info">
                            <button type="button" class="btn btn-info btn-lg btn-sign accounts">Accounts management</button>
                        </p>

                    <form class="form-horizontal" action="/logout" method="get">
                        <p class="center col-md-12 info">
                            <button type="submit" class="btn btn-info btn-lg btn-sign"><i class="glyphicon glyphicon-log-out"></i>&nbsp; Log out</button>
                        </p>
                    </form>

                    <br/>
                </fieldset>
            </div>

            <div class="col-md-3"></div>

        </div>
    </div>
</div>

</body>
</html>

<script type='text/javascript'>
    $(document).ready(function(){

        $('.sales').on('click', function () {
            location.assign('/user/index');
        });

        $('.trains').on('click', function () {
            location.assign('/admin/type');
        });

        $('.accounts').on('click', function () {
            location.assign('/admin/accounts');
        });

    });
</script>