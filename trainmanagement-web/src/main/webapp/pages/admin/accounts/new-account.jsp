<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>
    <c:url var="head" value="/pages/header.jsp"/>
    <jsp:include page='${head}'/>

    <c:url var="style" value="/resources/css/admin/accounts/new-account.css"/>
    <link href='${style}' rel='stylesheet' type='text/css'/>
</head>


<body>
<div class="container">
    <div class="container toplabel">
        <div class="center header alert alert-info">Create account panel</div>
    </div>
</div>

<div class="container correction">
    <div class="col-md-1">
        <form action="/admin/accounts" method="get">
            <button class="btn btn-info btn-width" type="submit" value='15'><i class="glyphicon glyphicon-arrow-left"></i></button>
        </form>
    </div>
    <div class="col-md-11"></div>

</div>



<div class="container">
    <div class="container correction">

        <form id="newUser">

            <table class='table form-text table-edit'>

                <tr class="warning">
                    <td  colspan="2" class='table-label'><label>Enter account information</label></td>
                </tr>

                <tr class="warning" >
                    <td class='td-width1'><label>Enter name</label></td>
                    <td class='td-width2'><input class='input-width-new' type="text" id="name"/></td>
                </tr>
                <tr class="warning">
                    <td><label>Enter login</label></td>
                    <td><input class='input-width-new' type="text" id="login"/></td>
                </tr>
                <tr class="warning">
                    <td><label>Enter password</label></td>
                    <td><input class='input-width-new' type="password" id="password"/></td>
                </tr>
                <tr class="warning">
                    <td><label>Repeat password</label></td>
                    <td><input class='input-width-new' type="password" id="repeatPassword"/></td>
                </tr>
                <tr class="warning">
                    <td><label>Choice role</label></td>
                    <td>
                        <select class='selectrole' id="role"></select>
                    </td>
                </tr>

                <tr class="warning">
                    <td></td>
                    <td>
                        <button class="btn btn-info btn-width-create" type="submit">Create</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

</body>
</html>

<script>

    $.ajax("/api/allRoles", {
        type: "get",
        contentType: "application/json",
        success: function (data) {
            $.each(data, function (index, value) {
                $(".selectrole").append(
                        "<option value='" + value.id + "'>" + value.role + "</option>"
                );
            });
        }
    });
</script>

<script>
    $('#newUser').submit(function (event) {

        if($('#name').val()!='' & $('#login').val()!='' &
                $('#password').val()!=''&  $('#password').val()==$('#repeatPassword').val()) {

            var json = {
                'name': $('#name').val(),
                'login': $('#login').val(),
                'password': $('#password').val(),
                'enabled': "1",
                "role": {  "id" : $('#role').val()  }
                };

                $.ajax({
                    url: '/api/saveUser',
                    data: JSON.stringify(json),
                    type: 'POST',
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader('Accept', 'application/json');
                        xhr.setRequestHeader('Content-Type', 'application/json');
                    },
                    success: function () {
                        location.replace('/admin/accounts');
                    }
                });
                event.preventDefault();

        }else{
            alert('Enter account field');
        }
    });
</script>












<%--<script>--%>
    <%--$('#newUser').submit(function (event) {--%>
        <%--var json = {--%>
            <%--"name": "sffgfg",--%>
            <%--"login": "fdff",--%>
            <%--"password": "dhgd",--%>
            <%--"role": {--%>
                <%--"id" : 1--%>
            <%--}--%>
        <%--};--%>

        <%--$.ajax({--%>
            <%--url: "/accounts/saveUser",--%>
            <%--data: JSON.stringify(json),--%>
            <%--type: "POST",--%>
            <%--beforeSend: function (xhr) {--%>
                <%--xhr.setRequestHeader("Accept", "application/json");--%>
                <%--xhr.setRequestHeader("Content-Type", "application/json");--%>
            <%--},--%>
            <%--success: function () {--%>
                <%--location.reload();--%>
            <%--}--%>
        <%--});--%>
        <%--event.preventDefault();--%>
    <%--});--%>
<%--</script>--%>

<%--<script>--%>
    <%--$('#newRole').submit(function (event) {--%>
        <%--var json = {--%>
            <%--"role": $('#newRoleForm').val()--%>
        <%--};--%>

        <%--$.ajax({--%>
            <%--url: "/api/saveRole",--%>
            <%--data: JSON.stringify(json),--%>
            <%--type: "POST",--%>
            <%--beforeSend: function (xhr) {--%>
                <%--xhr.setRequestHeader("Accept", "application/json");--%>
                <%--xhr.setRequestHeader("Content-Type", "application/json");--%>
            <%--},--%>
            <%--success: function () {--%>
                <%--location.replace("/accounts/new");--%>
                <%--qqqqq();--%>

            <%--}--%>
        <%--});--%>
        <%--event.preventDefault();--%>
    <%--});--%>
<%--</script>--%>

<%--<script>--%>
    <%--function alert(content,afterFunction){--%>
        <%--$('<div class="alertm_overlay"></div>').appendTo('body');--%>
        <%--$('<div class="alertm_all"><a href="#" onclick="alert_close('+afterFunction+'); return false" class="alertm_close">x</a><div class="alertm_wrapper">'+content+'</div><div class="alertm_but" onclick="alert_close('+afterFunction+'); return false">OK</div></div>').appendTo('body');--%>
        <%--$(".alertm_overlay, .alertm_all").fadeIn("slow");--%>
        <%--$('.alertm_all').css('margin-top', (-1)*($('.alertm_all').height())+'px');--%>
    <%--}--%>
    <%--function alert_close(afterFunctionClouse){--%>
        <%--$(".alertm_overlay, .alertm_all").remove();--%>
        <%--afterFunctionClouse;--%>
    <%--}--%>
<%--//    $(document).ready(--%>
            <%--function qqqqq(){--%>
                 <%--alert('Role saved      cdcdcdcdcdcdcd');--%>
            <%--};--%>
<%--//    );--%>

<%--</script>--%>