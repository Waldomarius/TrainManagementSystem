<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>
    <c:url var="head" value="/pages/header.jsp"/>
    <jsp:include page='${head}'/>

    <c:url var="style" value="/resources/css/user/passenger.css"/>
    <link href='${style}' rel='stylesheet' type='text/css'/>
</head>

<body>

<div class="container topselect">


    <div class="col-md-1">
        <button class="btn btn-info back" type="button"><i class="glyphicon glyphicon-arrow-left"></i></button>
    </div>

    <div class="col-md-7"></div>
    <div class="col-md-2"><p class='textinfo'></p></div>
    <div class="col-md-2">
        <button class="btn btn-info logout" type="button"><i class="glyphicon glyphicon-log-out"></i>&nbsp; Log out
        </button>
    </div>


</div>

<div class="container topselect">

    <table class="table table-bordered trains">

        <tr class="warning textinfo">
            <th style="width: 50px;"></th>
            <th style="width: 150px;">Departure</th>
            <th style="width: 50px;"></th>
            <th style="width: 150px;">Arrival</th>
            <th style="width: 300px;">Sell tickets</th>
            <th style="width: 50px;">Tickets</th>
            <th style="width: 100px;">Sell</th>
        </tr>

    </table>

</div>

</body>
</html>

<script type='text/javascript'>

    $('.back').on('click', function () {
        location.assign('/user/index');
    });

    $('.logout').on('click', function () {
        location.assign('/logout');
    });

</script>

<script type='text/javascript'>

    $.ajax("/api/allPassengerTrains", {
        type: "GET",
        contentType: "application/json",
        success: function (data) {
            $.each(data, function (index, value) {

                var tr = $("<tr>" +
                        "<td>" + value.number + "</td>" +
                        "<td>" + value.departure + "</td>" +
                        "<td><i class='glyphicon glyphicon-arrow-right'></i></td>" +
                        "<td>" + value.arrival + "</td>" +
                        "<td>" + value.sell + "</td>" +
                        "<td><input type='number' class='selectnumber' id='sellTicket" + value.id + "' value='1' min='1' max='40' step='1'></td>" +
                        "</tr>"
                );
                tr.addClass('warning textinfo');

                var sellButton = $("<td style='width: 100px;'>" +
                        "<button class='btn btn-info back' type='button'>" +
                        "<i class='glyphicon glyphicon-shopping-cart'></i>" +
                        "</button>" +
                        "</td>");

                sellButton.appendTo(tr);

                $(".trains").append(tr);


                sellButton.click(function (events) {

                    var sell = value.sell + parseInt($('#sellTicket' + value.id).val());

                    $.ajax({
                        url: '/api/updateSell/' + value.id + '/' + sell,
                        type: 'GET',
                        success: function () {
                            alert("You sell " + $('#sellTicket' + value.id).val() + " tickets");
                            location.reload();
                        }
                    });
                    events.preventDefault();
                });


            });
        }
    });


</script>