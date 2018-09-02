<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>
    <c:url var="head" value="/pages/header.jsp"/>
    <jsp:include page='${head}'/>

    <c:url var="style" value="/resources/css/admin/accounts/new-role.css"/>
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

            <tr class="warning">
                <th>id</th>
                <th>role</th>
                <th class='btn-width'>Save</th>
            </tr>

            <tr class="warning">
                <form id="editRole">
                    <td><input id="idEdit"  type="text"  value="${roleId}" disabled/></td>
                    <td><input id="roleEdit"  type="text"  value="" /></td>
                    <td>
                        <button type='submit' class='btn btn-info btn-sm btn-width' id='saveRole'>Save</button>
                    </td>
                </form>
            </tr>

        </table>
    </div>
</div>

</body>
</html>

<script>

    $.ajax("/api/allRoles", {
        type: "GET",
        contentType: "application/json",
        success: function (data) {
            $.each(data, function (index, value) {
                if (value.id == <c:out value="${roleId}"/>) {
                        document.getElementById("idEdit").value = value.id;
                        document.getElementById("roleEdit").value = value.role;
                }
            });
        }
    });

</script>

<script>

    $('#editRole').submit(function (event) {

        var json = {
            'id': $('#idEdit').val(),
            'role': $('#roleEdit').val()
        };

        $.ajax({
            url: "/api/saveRole",
            data: JSON.stringify(json),
            type: "POST",
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");
            },
            success: function () {
                location.replace("/accounts/new-role");
            }
        });
        event.preventDefault();
    });

</script>