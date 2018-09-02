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
            <div class="col-md-6 center login-header alert alert-info">ACCESS DENIED TO THIS PAGE</div>
            <div class="col-md-3"></div>
        </div>
    </div>

</div>

</body>
</html>
