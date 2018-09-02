<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>
    <c:url var="head" value="/pages/header.jsp"/>
    <jsp:include page='${head}'/>

    <c:url var="style" value="/resources/css/admin/trains/passenger-trains.css"/>
    <link href='${style}' rel='stylesheet' type='text/css'/>
</head>

<body>

<div class="container toplabel">
    <div class="center header alert alert-info">Passenger trains</div>
</div>

<div class="container topselect">
    <div class="col-md-1">
        <button class="btn btn-info btn-width back">
            <i class="glyphicon glyphicon-arrow-left"></i>
        </button>
    </div>
    <div class="col-md-9"></div>
    <div class="col-md-2">
        <button class="btn btn-info btn-width newTrain">
            <i class="glyphicon glyphicon-pencil"></i>&nbsp;  Create train</button>
    </div>
</div></br>

<div class="container">

            <table class="table table-bordered trains">

                <tr class="warning">
                    <th>id</th>
                    <th>number</th>
                    <th>date</th>
                    <th>departure</th>
                    <th>arrival</th>
                    <th>sell</th>
                    <th class='btn-width'>edit</th>
                    <th class='btn-width'>delete</th>
                </tr>

            </table>

</div>

</body>
</html>

<script type='text/javascript'>

    $('.back').on('click', function () {
        location.assign('/admin/type');
    });

    $('.newTrain').on('click', function () {
        location.assign('/trains/passenger-new');
    });

</script>

<script>

    $.ajax("/api/allPassengerTrains", {
        type: "GET",
        contentType: "application/json",
        success: function (data) {
            $.each(data, function (index, value) {

                var tr = $("<tr>" +
                        "<td>" + value.id + "</td>" +
                        "<td>" + value.number + "</td>" +
                        "<td>" + value.date + "</td>" +
                        "<td>" + value.departure + "</td>" +
                        "<td>" + value.arrival + "</td>" +
                        "<td>" + value.sell + "</td>" +
                        "</tr>"
                );

                tr.addClass('warning textinfo');

                var editButton = $("<td><button type='button' class='btn btn-info btn-sm btn-width' id='editTrain"+value.id+"'>Edit</button></td>");
                var deleteButton = $("<td><button type='button' class='btn btn-info btn-sm btn-width' id='deleteTrain"+value.id+"'>Delete</button></td>");

                editButton.appendTo(tr);
                deleteButton.appendTo(tr);

                $(".trains").append(tr);

                deleteButton.click(function(events) {
                    $.ajax({
                        url: '/api/deleteTrain/' + value.id,
                        type: 'DELETE',
                        success:function () {
                            location.reload();
                        }
                    });
                    events.preventDefault();
                });

                $('#editTrain' + value.id).on('click', function () {
                    location.assign('/trains/passenger-edit/' + value.id);
                });


            });
        }
    });

</script>
