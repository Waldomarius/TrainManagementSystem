<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>

    <c:url var="head" value="/pages/header.jsp"/>
    <jsp:include page='${head}'/>

    <c:url var="style" value="/resources/css/admin/accounts.css"/>
    <link href='${style}' rel='stylesheet' type='text/css'/>
</head>

<body>

<div class="container toplabel">
    <div class="center header alert alert-info">Accounts table</div>
</div>

<div class="container topselect">
    <div class="col-md-1">
        <button class="btn btn-info btn-width back">
            <i class="glyphicon glyphicon-arrow-left"></i>
        </button>
    </div>
    <div class="col-md-7"></div>
    <div class="col-md-2">
            <button class="btn btn-info btn-width newRole">
                <i class="glyphicon glyphicon-pencil"></i>&nbsp; Create role
            </button>
    </div>
    <div class="col-md-2">
            <button class="btn btn-info btn-width newAccount">
                <i class="glyphicon glyphicon-user"></i>&nbsp; Create account
            </button>
    </div>
</div></br>

<div class="container">

    <table class="table table-bordered accounts">

        <tr class="warning">
            <th>id</th>
            <th>Name</th>
            <th>Login</th>
            <th>Password</th>
            <th>enabled</th>
            <th>role</th>
            <th class='btn-width'>edit</th>
            <th class='btn-width'>delete</th>
        </tr>

    </table>
</div>

</body>
</html>

<script>

    $('.back').on('click', function () {
        location.assign('/admin/index');
    });

    $('.newRole').on('click', function () {
        location.assign('/accounts/new-role');
    });

    $('.newAccount').on('click', function () {
        location.assign('/accounts/new-account');
    });

</script>

<script type='text/javascript'>

    $.ajax("/api/allUsers", {
        type: "GET",
        contentType: "application/json",
        success: function (data) {
            $.each(data, function (index, value) {

                var tr = $("<tr class='warning'>" +
                        "<td>" + value.id + "</td>" +
                        "<td>" + value.name + "</td>" +
                        "<td>" + value.login + "</td>" +
                        "<td>" + value.password + "</td>" +
                        "<td>" + value.enabled + "</td>" +
                        "<td>" + value.role + "</td>" +
                        "</tr>");

                var editButton = $("<td><button type='button' class='btn btn-info btn-sm btn-width'  id='editUser"+value.id+"'>Edit</button></td>");
                var deleteButton = $("<td><button type='button' class='btn btn-info btn-sm btn-width'  id='deleteUser"+value.id+"'>Delete</button></td>");

                editButton.appendTo(tr);
                deleteButton.appendTo(tr);

                $(".accounts").append(tr);

                deleteButton.click(function(events) {
                    $.ajax({
                        url: '/api/deleteUser/' + value.id,
                        type: 'DELETE',
                        success:function () {
                            location.reload();
                        }
                    });
                    events.preventDefault();
                });

                $('#editUser' + value.id).on('click', function () {
                    location.assign('/accounts/edit-account/' + value.id);
                });

            });
        }
    });
</script>