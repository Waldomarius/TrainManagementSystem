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
                    Types train
                </div>

                <fieldset>

                    <br/>
                    <p class="center col-md-12  info">
                        <button type="button" class="btn btn-info btn-lg btn-sign passenger">Passenger's trains</button>
                    </p>

                    <p class="center col-md-12 info">
                        <button type="button" class="btn btn-info btn-lg btn-sign freight">Freight trains</button>
                    </p>

                    <p class="center col-md-12 info">
                        <button type="button" class="btn btn-info btn-lg btn-sign back"><i class="glyphicon glyphicon-arrow-left"></i></button>
                    </p>

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

        $('.passenger').on('click', function () {
            location.assign('/trains/passenger-trains');
        });

        $('.freight').on('click', function () {
            location.assign('/trains/freight-trains');
        });

        $('.back').on('click', function () {
            location.assign('/admin/index');
        });

    });
</script>
