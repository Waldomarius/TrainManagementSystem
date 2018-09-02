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

<div class="container">
    <div class="container toplabel">
        <div class="center header alert alert-info">Edit train</div>
    </div>
</div>

<div class="container">
    <div class="container correction">
        <table class="table table-bordered table-edit roles">


            <table class="table table-bordered trains">

                <tr class="warning">
                    <th>id</th>
                    <th>number</th>
                    <th>date</th>
                    <th>departure</th>
                    <th>arrival</th>
                    <th class='btn-width'>save</th>
                </tr>

                <tr class="warning">
                    <form id="editTrain">

                        <td><input id="idEdit" class="input-width-id" type="text" value="${trainId}" disabled/></td>
                        <td><input id="numberEdit" class="input-width" type="text" value=""/></td>
                        <td><input type="text" class="input-width" id="dateEdit" value=""/>
                            <i class="glyphicon glyphicon-calendar"></i>
                        </td>
                        <td><input id="departureEdit" class="input-width" type="text" value=""/></td>
                        <td><input id="arrivalEdit" class="input-width" type="text" value=""/></td>

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
    $(function () {
        $("#dateEdit").datepicker({
            dateFormat: "dd.mm.yy"
        });
    });
</script>

<script>
var sell;

    $.ajax("/api/allPassengerTrains", {
        type: "GET",
        contentType: "application/json",
        success: function (data) {
            $.each(data, function (index, value) {
                if (value.id == <c:out value="${trainId}"/>) {
                    document.getElementById("idEdit").value = value.id;
                    document.getElementById("numberEdit").value = value.number;
                    document.getElementById("dateEdit").value = value.date;
                    document.getElementById("departureEdit").value = value.departure;
                    document.getElementById("arrivalEdit").value = value.arrival;
                    sell = value.sell;
                }
            });
        }
    });

</script>
<script>
    $('#editTrain').submit(function (event) {

        var json = {
            'id':$('#idEdit').val(),
            'number': $('#numberEdit').val(),
            'date': $('#dateEdit').val(),
            'departure': $('#departureEdit').val(),
            'arrival': $('#arrivalEdit').val(),
            'sell': sell
        };

        $.ajax({
            url: '/api/saveTrain',
            data: JSON.stringify(json),
            type: 'POST',
            beforeSend: function (xhr) {
                xhr.setRequestHeader('Accept', 'application/json');
                xhr.setRequestHeader('Content-Type', 'application/json');
            },
            success: function () {
                location.replace('/trains/passenger-trains');
            }
        });
        event.preventDefault();

    });
</script>
