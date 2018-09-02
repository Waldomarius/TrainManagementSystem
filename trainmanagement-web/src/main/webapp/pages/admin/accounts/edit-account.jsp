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
        <div class="center header alert alert-info">Edit role</div>
    </div>
</div>

<div class="container">
    <div class="container correction">
        <table class="table table-bordered table-edit roles">

            <table class="table table-bordered accounts">

                <tr class="warning">
                    <th>id</th>
                    <th>Name</th>
                    <th>Login</th>
                    <th>Password</th>
                    <th>Enabled</th>
                    <th>Role</th>
                    <th>Save</th>
                </tr>

                <tr class="warning">
                    <form id="editUser">
                        <td><input id="idEdit" class="input-width-id" type="text" value="${userId}" disabled/></td>
                        <td><input id="nameEdit" class="input-width" type="text" value=""/></td>
                        <td><input id="loginEdit" class="input-width" type="text" value=""/></td>
                        <td><input id="passwordEdit" class="input-width" type="text" value=""/></td>
                        <td><input id="enabledEdit" class="input-width" type="text" value=""/></td>
                        <td>
                            <select class='roleEdit' id="role"></select>
                        </td>
                        <td>
                            <button type='submit' class='btn btn-info btn-sm btn-width'>Save</button>
                        </td>
                    </form>
                </tr>
            </table>
        </table>
    </div>
</div>

</body>
</html>

<script>

    $.ajax("/api/allUsers", {
        type: "GET",
        contentType: "application/json",
        success: function (data) {
            $.each(data, function (index, value) {
                if (value.id == <c:out value="${userId}"/>) {
                    document.getElementById("idEdit").value = value.id;
                    document.getElementById("nameEdit").value = value.name;
                    document.getElementById("loginEdit").value = value.login;
                    document.getElementById("passwordEdit").value = value.password;
                    document.getElementById("enabledEdit").value = value.enabled;
                }
            });
        }
    });

    $.ajax("/api/allRoles", {
        type: "GET",
        contentType: "application/json",
        success: function (data) {
            $.each(data, function (index, value) {
                $(".roleEdit").append(
                        "<option value='" + value.id + "'>" + value.role + "</option>"
                );
            });
        }
    });

</script>
<script>
    $('#editUser').submit(function (event) {

            var json = {
                'id': $('#idEdit').val(),
                'name': $('#nameEdit').val(),
                'login': $('#loginEdit').val(),
                'password': $('#passwordEdit').val(),
                'enabled': $('#enabledEdit').val(),
                "role": {"id": $('#role').val()}
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

    });
</script>