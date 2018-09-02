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

<div class="container">
    <div class="container toplabel">
        <div class="center header alert alert-info">Sell freight</div>
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

        <table class="table table-bordered trains">

            <tr class="warning">
                <th>volume_available</th>
                <th>weight_available</th>
                <th>volume</th>
                <th>weight</th>
                <th class='btn-width'>sell</th>
            </tr>

            <tr class="warning">
                <form id="editTrain">

                    <td><input id="volume_limit" class="input-width-freight" type="text" value="" disabled/></td>
                    <td><input id="weight_limit" class="input-width-freight" type="text" value="" disabled/></td>


                    <td><input id="volumeSell" class="input-width-freight" type="text" value="0"/><br/></td>
                    <td><input id="weightSell" class="input-width-freight" type="text" value="0"/></td>

                    <td>
                        <button type='button' class='btn btn-info btn-sm btn-width' id="sell">
                            <i class='glyphicon glyphicon-shopping-cart'></i>
                        </button>
                    </td>

                </form>
            </tr>
        </table>
    </div>
</div>


</body>
</html>

<script>
    $('.back').on('click', function () {
        location.assign('/user/freight');
    });
</script>

<script>

    var volumeAll;
    var weightAll;
    var volumeAvailable;
    var weightAvailable;

    $.ajax("/api/allFreightTrains", {
        type: "GET",
        contentType: "application/json",
        success: function (data) {
            $.each(data, function (index, value) {

                if (value.id == <c:out value="${trainId}"/>) {

                    volumeAvailable = value.volumeLimit - value.volume;
                    weightAvailable = value.weightLimit - value.weight;

                    document.getElementById("volume_limit").value = volumeAvailable;
                    document.getElementById("weight_limit").value = weightAvailable;

                    volumeAll = value.volume;
                    weightAll = value.weight;

                }
            });
        }
    });

</script>

<script>


    $('#sell').on('click', function () {

        var volumeCurrent = parseInt($('#volumeSell').val());
        var weightCurrent = parseInt($('#weightSell').val());

        var volume = volumeAll + volumeCurrent;
        var weight = weightAll + weightCurrent;


        if (volumeCurrent <= volumeAvailable && weightCurrent <= weightAvailable) {

            $.ajax({
                url: '/api/updateFreightSell/' + ${trainId} +'/' + volume + '/' + weight,
                type: 'GET',
                success: function () {
                    alert("You sell success");
                    location.replace('/user/freight');
                }
            });

        } else {
            alert("Too much volume or weight");
        }

    });
</script>


<%--<script>--%>


    <%--$('#volumeSell').on({--%>
        <%--keypress: function () {--%>


            <%--alert("dfggdgdfg");--%>
            <%--var volume = parseInt($('#volumeSell').val());--%>
            <%--var limit = parseInt($('#volume_limit').val());--%>
            <%--var result = limit - volume;--%>

<%--//        if (result > 0) {--%>
            <%--document.getElementById("alertVolume").value = result;--%>
<%--//        } else {--%>
<%--//            document.getElementById("alertVolume").value = "Too much volume";--%>
<%--//        }--%>

        <%--}--%>
    <%--});--%>
<%--</script>--%>