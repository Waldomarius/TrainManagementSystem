<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>
    <c:url var="head" value="/pages/header.jsp"/>
    <jsp:include page='${head}'/>

    <c:url var="style" value="/resources/css/admin/trains/passenger-new.css"/>
    <link href='${style}' rel='stylesheet' type='text/css'/>

</head>

<body>
<div class="container">
    <div class="container toplabel">
        <div class="center header alert alert-info">Create train panel</div>
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

        <form id="newTrain">

            <table class='table form-text table-edit'>

                <tr class="warning">
                    <td colspan="2" class='table-label'><label>Enter train information</label></td>
                </tr>

                <tr class="warning">
                    <td class='td-width1'><label>Enter number</label></td>
                    <td class='td-width2'><input class='input-width-new' type="text" id="number"/></td>
                </tr>

                <tr class="warning">
                    <td><label>Enter date</label></td>
                    <td>

                        <input type="text" class="input-width-new" id="date" value=""/>
                        <i class="glyphicon glyphicon-calendar"></i>

                    </td>
                </tr>

                <tr class="warning">
                    <td><label>Enter departure</label></td>
                    <td><input class='input-width-new' type="text" id="departure"/></td>
                </tr>
                <tr class="warning">
                    <td><label>Enter arrival</label></td>
                    <td><input class='input-width-new' type="text" id="arrival"/></td>
                </tr>
                <tr class="warning">
                    <td><label>Enter sell</label></td>
                    <td><input class='input-width-new' type="text" id="sell" value="0"disabled/></td>
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
    $(function () {
        $("#date").datepicker({
            dateFormat: "dd.mm.yy"
        });
    });
</script>
<script>

    $('.back').on('click', function () {
        location.assign('/trains/passenger-trains');
    });

    $('#newTrain').submit(function (event) {

        var json = {
            'number': $('#number').val(),
            'date': $('#date').val(),
            'departure': $('#departure').val(),
            'arrival': $('#arrival').val(),
            'sell': $('#sell').val()
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
