<%@ page title="" language="C#" masterpagefile="~/Counsellor/Counsellor.master" autoeventwireup="true" inherits="Counsellor_AddBatchSchedule, App_Web_irxfy1jz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">

        $(document).ready(function () {


            function RoomsInfo(centerid, days) {
                var ddl;
                $.ajax({
                    type: "POST",
                    url: "AddBatchSchedule.aspx/getRooms",
                    data: "{centerId:'" + centerid + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        ddl = "<select id='ddlRoom'><option>Select</option>";
                        $.each(data.d, function (item) {
                            ddl += "<option value='" + data.d[item].roomId + "'>" + data.d[item].roomName + "</option>";
                        });
                        ddl += "</select>";
                        $.each(days.d, function (item) {
                            $("#tblBatch").append("<tr><td>" + days.d[item] + " </td><td><input type='time' size='5' id='txtTimeStart" + item + "'/></td><td><input type='time' size='5' id='txtTimeEnd" + item + "' width='50px' ></td> <td>" + ddl + "</td></tr>");
                        });
                        $("#tblBatch").append("<tr><td colspan='4' align='right'><input type='submit' id='btnSave' value='Add'/></td></tr> ");
                    }


                });


            }

            $("#ContentPlaceHolder1_ddlBatch").change(function () {

                var batchID = $(this).val();
                var centerId = $("#ContentPlaceHolder1_hdCenterId").val();

                if (batchID != "0") {


                    $.ajax({
                        type: "POST",
                        url: "AddBatchSchedule.aspx/batchInfo",
                        data: "{batchid:'" + batchID + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            $("#tblBatch").empty().append("<tr><th>Day</th><th>Start Time</th><th>End Time</th><th>Room</th></tr>");
                            RoomsInfo(centerId, data);

                        }


                    });//ajax call complete
                }
                else {
                    $("#tblBatch").empty().append("<tr><th>Please select a Batch</th></tr>");
                }
            });//ddlBatch Change complete


           
        });//document ready complete


        function postData(result)
        {
           // alert(result);
            var batch = "abc";
            $.ajax({
                type: "POST",
                url: "AddBatchSchedule.aspx/SaveData",
                data: "{batchData:" + JSON.stringify(result) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                   
                    alert("Schedule is set..<br/>Now change batch status by Continue");
                    window.location.href = "Batches.aspx";
                }


            });
        }
        $(document).on('click', 'input[type=submit]', function () {
            
                var rowCount = $('#tblBatch >tbody >tr').length;
                var i = rowCount - 2;
                var rows = $("#tblBatch tr");
                var batchid = $("#ContentPlaceHolder1_ddlBatch").val();
                var data = "[";
                for (var j = 0; j < i; j++) {
                    var timeStart = $("#txtTimeStart" + j).val();
                    var timeEnd = $("#txtTimeEnd" + j).val();
                    var roomid = $(rows[j + 1]).find("#ddlRoom").val();
                    var day = $(rows[j + 1]).find("td").html();

                    data += "{'batchId':" + batchid + ",'day':'" + day + "','startTime':'" + timeStart + "','endTime':'" + timeEnd + "','roomId':'" + roomid + "'},";
                }

                var result = data.substring(0, data.length - 1);
                result += "]";

                postData(result);
            
            return false;
        });

        $(document).on('change', '#ddlRoom', function () {
           
            var index = $(this).parent("td").parent("tr").index();
            index--;
            var sTime = $(this).parent("td").parent("tr").find("#txtTimeStart" + index).val();
           
            var eTime = $(this).parent("td").parent("tr").find("#txtTimeEnd" + index).val();
            if (sTime != "" || eTime != "") {
                if (sTime < eTime) {
                    var day = $(this).parent("td").parent("tr").find("td").html();
                    var roomid = $(this).val();
                    var batchId = $("#ContentPlaceHolder1_ddlBatch").val();
                   // alert(sTime + " " + eTime + " " + day);
                    var batch = "{batchId:" + batchId + ",day:'" + day + "',startTime:'" + sTime + "',endTime:'" + eTime + "',roomId:" + roomid + "}";
                    $.ajax({
                        type: "POST",
                        url: "AddBatchSchedule.aspx/CheckBatchSchdule",
                        data: "{batchInfo:" + JSON.stringify(batch) + "}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            if (data.d == "No") {
                                
                                alert("Sorry! A batch allready arranged for " + day + " at this time.");
                              
                            }

                        }


                    });
                }
                else {
                    $(this).val("Select");
                    alert("Batch Start time and End time is Not correct");
                }
            }
            else {
                alert("please select Batch time");
            }
            return false;
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <ul class="top-nav">
        <li><a href="CounsellorHome.aspx" class="scroll">Home </a></li>
        <li><a href="Faculties.aspx" class="scroll">Trainer</a></li>
        <li><a href="Batches.aspx" class="scroll">Batches</a></li>
        <li><a href="Room.aspx" class="scroll">Room</a></li>

    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <center><h1>Add Batch Schedule</h1></center>
    </div>

    <h3>
        </h3>
    <div id="batchEntryDiv" style="width: 62%; height: 5%; margin-left: 20%; padding: 1%; background-color: #c1baba; vertical-align: middle; font-family: Verdana; font-size: large;">

        <%--<table align="Center">
            <tr>
                <td>Batch</td>
                <td>
                    <asp:DropDownList ID="ddlBatch" runat="server" OnSelectedIndexChanged="ddlBatch_SelectedIndexChanged">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td>Day :</td>
                <td>
                    <asp:DropDownList ID="ddlDay" runat="server">
                    </asp:DropDownList>

                </td>
            </tr>
            <tr><td>Room :</td><td>
                <asp:DropDownList ID="ddlRoom" runat="server">
                    
                </asp:DropDownList></td></tr>
            <tr>
                <td>Batch Time :</td>
                <td>
                    <asp:TextBox ID="txtTime" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnSave" Text="Save" runat="server" OnClick="btnSave_Click" /></td>
            </tr>
        </table>--%>
        <p><asp:Label ID="Label1" runat="server" Visible="False" Style="font-size: large;" ForeColor="Black"></asp:Label>
            <br /><asp:CheckBox ID="CHK1" runat="server" Text="Set New Schedule" AutoPostBack="True" OnCheckedChanged="CHK1_CheckedChanged" /></p>
        <p>
            <asp:DropDownList ID="ddlBatch" AutoPostBack="false" runat="server" OnSelectedIndexChanged="ddlBatch_SelectedIndexChanged">
            </asp:DropDownList><asp:HiddenField ID="hdCenterId" runat="server" />
        </p>
        <table id="tblBatch">
            <tr>
                <th>Time</th>
                <th>Room</th>
            </tr>
        </table>

    </div>
    <br />

</asp:Content>
