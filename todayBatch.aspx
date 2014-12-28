
<%@ page title="" language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="todayBatch, App_Web_mf2jd1va" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        var numberOfRoom = 0;

        function getRooms(centerid) {
            //function for getting rooms names from given center id
            $.ajax({
                type: "POST",
                url: "todayBatch.aspx/getRooms",
                data: "{centerId:'" + centerid + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    $.each(data.d, function (i) {
                        numberOfRoom++;
                        $("#ScheduleTbl thead").find("tr").append("<th class='hder'>" + data.d[i].roomName + "</th>");
                    });
                    setTime(numberOfRoom, centerid);

                }

            });
        }//END getRooms

        //function for set time columns in html table adding at this page
        function setTime(rooms, centerid) {
            for (var i = 8; i < 21; i++) {
                var toTime = i + 1;
                var str = "<tr><th class='timeTd'>" + i + ":00 - " + toTime + ":00</th>";
                for (var j = 0; j < rooms; j++) {
                    str += "<td>-</td>"
                }
                str += "</tr>";
                $("#ScheduleTbl").append(str);
            }
            var d = new Date();
            var day = d.getDay();
            
            GetSchedule(centerid, day);
        }
        //function for get today's batch schedule for given center
        function GetSchedule(centerid,day) {
            var arrStime = [];
            var arrEtime = [];
            var rooms = [];
            var batchNames = [];
            $.ajax({
                type: "POST",
                url: "todayBatch.aspx/GetTodaysSchedule",
                data: "{cid:'" + centerid + "',day:'"+day+"'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $.each(data.d, function (i) {

                        var stime = data.d[i].startTime;
                        var eTime = data.d[i].endTime;
                        var room = data.d[i].roomName;
                        var batchName = data.d[i].batchName;
                        arrStime.push(stime);
                        arrEtime.push(eTime);
                        rooms.push(room);
                        batchNames.push(batchName);


                    });

                    setSchedule(arrStime, arrEtime, batchNames, rooms);
                }


            });


        }//end GetSchedule

        //function for set getting batch schedule at this page
        function setSchedule(stime, etime, batchname, rooms) {

            var rows = $("#ScheduleTbl tr"); //number of rows in html table
            var headerRowCells = $("#ScheduleTbl thead tr th"); //header columns from html table for room name

            var numberOfCell = headerRowCells.length;

            $.each(stime, function (key, value) {
                

                for (var row = 1; row < 14; row++) {
                   
                    var time = $(rows[row]).find("th").html();
                    var times = time.split('-');
                    var tableSTime = new Date("1/1/1900 " + times[0]); //html table's row start time
                    var tableETime = new Date("1/1/1900 " + times[1]); //html table's row end time
                    var batchStime = new Date("1/1/1900 " + stime[key]);  //batch actually start time
                    var batchEtime = new Date("1/1/1900 " + etime[key]);//batch actually end time

                    if (batchStime >= tableSTime && batchStime < tableETime) {
                        var columns = $(rows[row]).find("td");//number of rooms columns

                        for (var k = 0; k < columns.length; k++) {
                            var cellIndex = k + 1;
                            var tdValue = $(columns[k]).html();

                            var headerCellValue = $(headerRowCells[cellIndex]).html();

                            if (headerCellValue == rooms[key]) {

                                $(columns[k]).css("background-color", "#25172c");
                                $(columns[k]).css("color", "white");
                                $(columns[k]).css("border-color", "#25172c");
                                $(columns[k]).empty().append(batchname[key]);

                            }
                        }


                    }
                    if (batchEtime > tableETime) {
                        if (row < 14) {
                            var rowIndex = row + 1;
                            var nextTime = $(rows[rowIndex]).find("th").html();
                            var nextTimes = nextTime.split('-');
                            //alert("next "+nextTimes+"    --- "+rowIndex);
                            var nextStime = new Date("1/1/1900 " + nextTimes[0]);
                            var nextEtime = new Date("1/1/1900 " + nextTimes[1]);
                            //alert("row= " + row + " rowindex= " + rowIndex);
                            if (batchEtime <= nextEtime) {
                                var columns = $(rows[rowIndex]).find("td");
                                for (var k = 0; k < columns.length; k++) {
                                    var cellIndex = k + 1;
                                    var tdValue = $(columns[k]).html();

                                    var headerCellValue = $(headerRowCells[cellIndex]).html();

                                    if (headerCellValue == rooms[key]) {

                                        $(columns[k]).css("background-color", "#25172c");
                                        $(columns[k]).css("color", "white");
                                        $(columns[k]).css("border-color", "#25172c");
                                        $(columns[k]).css("border-bottom-color", "white");
                                        $(columns[k]).empty().append("<span style='color:yellow'> " + stime[key] + "</span> - <span style='color:yellow'>" + etime[key] + "</span>");

                                    }
                                }

                            }
                        }
                    }
                }
            });

        }//end setSchedule

        $(window).load(function () {
            var centerid = $("#ContentPlaceHolder1_centerHd").val();
            getRooms(centerid);
            $("#timelbl").html(new Date().toDateString());
            $("#timelbl").css("color", "yellow");

        });

        function resetTable()
        {
            var rows = $("#ScheduleTbl tr"); //number of rows in html table
            for (var row = 1; row < 14; row++) {
                var columns = $(rows[row]).find("td");//number of rooms columns
                for (var col = 0; col < columns.length; col++)
                {
                    $(columns[col]).empty().css("background-color", "white");
                    $(columns[col]).css("border-color", "#25172c");
                }
            }
        }
        $(document).ready(function () {
            $(".span").click(function () {

                var day = $(this).attr("id");
                var centerid = $("#ContentPlaceHolder1_centerHd").val();
               // alert(centerid + " " + day);
                resetTable();
                GetSchedule(centerid, day);
                var v = $(this).html();

                $("#lblMessage").empty().append(v + "'s Batch Schedule");
              
            });

        });
    </script>
    <style type="text/css">
        .tbl1 {
            margin-left: 10%;
            border-color:#25172c;
            
        }

        .hder {
            width: 150px;
            background-color: #282137;
            color: white;
            height: 35px;
            text-align: center;
        }

        .timeTd {
            background-color: #19142b;
            text-align: center;
            color: white;
            width: 15%;
            height: 35px;
        }
        .span {
        background-color: white;
        padding:5px;
        border:1px;
        color:#282137;
        width:200px;
        border-spacing:2px;
        font-weight:bold;
        }
            .span:hover{
            color:white;
             background-color: #282137;
            }
        .timeSpan {
             background-color: #19142b;
        padding:5px;
        border:1px;
        color:white;
        width:200px;
        border-spacing:2px;
        
        }
        .span:visited {
        background-color:red;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="ScheduleDiv">
        <asp:HiddenField ID="centerHd" runat="server" />
        <div class="tbl1">
            <span class="timeSpan" id="timelbl"></span> <span class="span" id="1">Monday</span> <span class="span" id="2">Tuesday</span> <span class="span" id="3">Wednesday</span> <span class="span" id="4">Thursday</span> <span class="span" id="5">Friday</span> <span class="span" id="6">Saturday</span> <span class="span" id="0">Sunday</span>
 
            <span id="lblMessage" style="color:yellow" class="timeSpan">Today's Batches</span>       </div>
        <table id="ScheduleTbl" border="1" class="tbl1">
            <thead>

                <tr>
                    <th class="timeTd">Time</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
        <div>
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        </div>
    </div>
</asp:Content>

