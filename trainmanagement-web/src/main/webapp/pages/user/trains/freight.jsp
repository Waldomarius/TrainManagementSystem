<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>
    <c:url var="head" value="/pages/header.jsp"/>
    <jsp:include page='${head}'/>

    <c:url var="style" value="/resources/css/user/freight.css"/>
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
            <th style="width: 50px;">№ train</th>
            <th style="width: 120px;">Departure</th>
            <th style="width: 50px;"></th>
            <th style="width: 120px;">Arrival</th>

            <th style="width: 50px;">Volume_limit</th>
            <th style="width: 50px;">Weight_limit</th>
            <th style="width: 50px;">Volume</th>
            <th style="width: 50px;">Weight</th>

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

    $.ajax("/api/allFreightTrains", {
        type: "GET",
        contentType: "application/json",
        success: function (data) {
            $.each(data, function (index, value) {

                var tr = $("<tr>" +
                        "<td>" + value.number + "</td>" +
                        "<td>" + value.departure + "</td>" +
                        "<td><i class='glyphicon glyphicon-arrow-right'></i></td>" +
                        "<td>" + value.arrival + "</td>" +
                        "<td>" + value.volumeLimit + "</td>" +
                        "<td>" + value.weightLimit + "</td>" +
                        "<td>" + value.volume + "</td>" +
                        "<td>" + value.weight + "</td>" +
                        "</tr>"
                );
                tr.addClass('warning textinfo');

                var sellButton = $("<td style='width: 100px;'>" +
                        "<button class='btn btn-info sellwidth' type='button' id='sell" + value.id+"'>" +
                        "<i class='glyphicon glyphicon-shopping-cart'></i>" +
                        "</button>" +
                        "</td>");

                sellButton.appendTo(tr);

                $(".trains").append(tr);


                $('#sell'+ value.id).on('click', function () {
                    location.assign('/user/freight-sell/' + value.id);
                });

            });
        }
    });

</script>