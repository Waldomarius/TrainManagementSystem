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
        <div class="center alert alert-info">Create roles panel</div>
    </div>
</div>

<div class="container correction">
    <div class="col-md-1">
        <button class="btn btn-info btn-width back">
            <i class="glyphicon glyphicon-arrow-left"></i>
        </button>
    </div>
    <div class="col-md-11"></div>
</div>

<div class="container">
    <div class="container correction">
        <form id="newRole">
            <table class="table form-text table-edit">
                <tr class="warning">
                    <td>
                        <label>Enter role</label>
                    </td>
                    <td>
                        <input class='input-width' type="text" name="newRole" id="newRoleForm"/>
                    </td>
                    <td>
                        <button class="btn btn-info btn-width-create" type="submit">Create</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

<div class="container">
    <div class="container correction">
        <table class="table table-bordered table-edit roles">
            <tr class="warning">
                <th>id</th>
                <th>role</th>
                <th class='btn-width'>edit</th>
                <th class='btn-width'>delete</th>
            </tr>
        </table>
    </div>
</div>

</body>
</html>

<script>

    $('.back').on('click', function () {
        location.assign('/admin/accounts');
    });

</script>
<script>

    $.ajax('/api/allRoles', {
        type: 'GET',
        contentType: 'application/json',
        success: function (data) {
            $.each(data, function (index, value) {
                var tr = $("<tr class='warning'>" +
                        "<td>" + value.id + "</td>" +
                        "<td>" + value.role + "</td>" +
                        "</tr>"
                );
                var editButton = $("<td><button type='button' class='btn btn-info btn-sm btn-width'  id='editRole" + value.id + "'>Edit</button></td>");
                var deleteButton = $("<td><button type='button' class='btn btn-info btn-sm btn-width' id='deleteRole" + value.id + "'>Delete</button></td>");
                editButton.appendTo(tr);
                deleteButton.appendTo(tr);
                $('.roles').append(tr);

                deleteButton.click(function (events) {
                    $.ajax({
                        url: '/api/deleteRole/' + value.id,
                        type: 'DELETE',
                        success: function () {
                            location.reload();
                        }
                    });
                    events.preventDefault();
                });

                $('#editRole' + value.id).on('click', function () {
                    location.assign('/accounts/edit-role/' + value.id);
                });

            });
        }
    });

</script>

<script>
    $('#newRole').submit(function (event) {

        if ($('#newRoleForm').val() != '') {

            var json = {
                'role': $('#newRoleForm').val()
            };

            $.ajax({
                url: '/api/saveRole',
                data: JSON.stringify(json),
                type: 'POST',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader('Accept', 'application/json');
                    xhr.setRequestHeader('Content-Type', 'application/json');
                },
                success: function () {
                    location.replace('/accounts/new-role');
                }
            });
            event.preventDefault();

        } else {
            alert('Enter role');
        }
    });
</script>