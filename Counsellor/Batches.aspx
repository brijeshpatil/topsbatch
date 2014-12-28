<%@ page title="" language="C#" masterpagefile="~/Counsellor/Counsellor.master" autoeventwireup="true" inherits="Counsellor_Batches, App_Web_rww0c5jb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .gridHeader th {
            text-align: center;
            background-color: #808080;
            color: white;
            font-size: large;
        }

        .rowcss:hover {
            background-color: white;
        }

        #tblSearch th {
            width: 10%;
            text-align: center;
            background-color: #808080;
            color: white;
            font-size: large;
        }
    </style>
    <script src="../js/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#closeBtn").css("cursor", "pointer");
            var batchId = 0;
            var atag = null;
           // $("#ContentPlaceHolder1_GridView1 tr td a")
            $(".cngStatus").click(function () {
                var status = $(this).html();
                var bname = $(this).parent("td").parent("tr").find("td:first span").html();
                atag = $(this);
                $("#lblBatchName").html(bname);
                $("#ddlstatus").val(status);
                $("#divStatusChange").css("display", "block");
                batchId = $(this).parent("td").parent("tr").find("td:first input[type=hidden]").val();

                return false;
            });

            $("#btnChangeStatus").click(function () {
                // alert("hello");

                changeStatus(batchId, atag);
                return false;
            });
            $("#closeBtn").click(function () {
                $("#divStatusChange").css("display", "none");
            });


        });

        function changeStatus(batchid, atag) {
            var stats = $("#ddlstatus").val();
            
            var centerid = $("#ContentPlaceHolder1_centerHd").val();
            if (stats != "Continue") {
                result = confirm("Are you want to delete this batch's schedule ?");
                $.ajax({
                    url: "Batches.aspx/changeBatchStatus",
                    type: "POST",
                    data: JSON.stringify({ bid: batchid, status: stats, center: centerid, isSchedule: result }),
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        $("#divStatusChange").css("display", "none");
                        atag.html(stats);
                        if (stats == "Continue") {
                          var choice=  confirm("Batch Status is changed. Now you need to set schedule for this batch");
                          if (choice) {
                              window.location.href = "AddBatchSchedule.aspx?batchId=" + batchid;
                          }
                        }

                    }
                });
            }
            else {
                $.ajax({
                    url: "Batches.aspx/changeBatchStatusToContinue",
                    type: "POST",
                    data: JSON.stringify({ bid: batchid, status: stats }),
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        $("#divStatusChange").css("display", "none");
                        atag.html(stats);
                        if (stats == "Continue") {
                            var choice = confirm("Batch Status is changed. Now you need to set schedule for this batch");
                            if (choice) {
                                window.location.href = "AddBatchSchedule.aspx?batchId=" + batchid;
                            }
                        }

                    }
                });
            }


        }

        //function deleteSchedule(bathId)
        //{
        //    var result = confirm("Are you want to delete this batch's schedule ?");

        //        $.ajax({
        //            url: "Batches.aspx/deleteBatchSchedule",
        //            type:"POST",
        //            data: JSON.stringify({ bid: bathId, status:result }),
        //            contentType: "application/json; charset=utf-8",
        //            success: function (d) {

        //            }

        //        });

        //}
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <ul class="top-nav">
        <li><a href="../cgroad" class="scroll">Home </a></li>
        <li><a href="Faculties.aspx" class="scroll">Trainer</a></li>
        <li class="active"><a href="Batches.aspx" class="scroll">Batches</a></li>
        <li><a href="Room.aspx" class="scroll">Room</a></li>
        <li><a href="AddBatch.aspx" class="scroll">Add Batch</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="centerHd" runat="server" />
    <div style="width: 62%; height: auto; margin-left: 20%; padding: 1%; background-color: #c1baba; vertical-align: middle; font-family: Verdana; font-size: large;" id="messageDiv">

    </div>
    <div style="width: 62%; height: auto; margin-left: 20%; padding: 1%; background-color: #c1baba; vertical-align: middle; font-family: Verdana; font-size: large;">
        <table id="tblSearch" border="1">
            <tr>
                <th>Trainner Name</th>
                <th>Batch Status</th>
                <th></th>
            </tr>
            <tr>
                <td align="center">
                    <asp:DropDownList runat="server" ID="ddlTrainer">
                        <asp:ListItem Text="Select" />

                    </asp:DropDownList>
                </td>
                <td align="center">
                    <asp:DropDownList runat="server" ID="ddlStatus">
                        <asp:ListItem Text="Continue" />
                        <asp:ListItem Text="Hold" />
                        <asp:ListItem Text="Completed" />
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button Text="Search" ID="btnSearch" runat="server" /></td>
            </tr>

        </table>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Style="width: 100%; margin-left: 0%;" HeaderStyle-CssClass="gridHeader" PageSize="30" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="Batch Name">
                    <ItemTemplate>
                        <input type="hidden" id="hdBatchId" runat="server" value='<%#Eval("BatchId") %>' />
                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("bacthName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Batch Days">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("batchDays") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
               
               
                <asp:TemplateField HeaderText="Batch Status">
                    <ItemTemplate>
                        <asp:LinkButton ID="linkbuton2" runat="server" CssClass="cngStatus" CommandName="select" ToolTip="Change Status" Text='<%#Eval("batchStatus")%>'></asp:LinkButton>
                       
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Schedule Status">
                    <ItemTemplate>
                        
                        <asp:HyperLink ID="LinkButton1" CssClass="cngScheduleBtn" runat="server" NavigateUrl='<%# Eval("BatchId", "AddBatchSchedule.aspx?batchId={0}") %>' ToolTip="Change Schedule" Text='<%#Eval("isScheduled") %>'>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <center> No Batch Added...</center>
            </EmptyDataTemplate>

            <HeaderStyle CssClass="gridHeader"></HeaderStyle>

            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="rowcss" />
        </asp:GridView>
    </div>
    <div id="divStatusChange" style="width: 33%; border: 5px solid gray; display: none; background-color: white; color: black; height: 250px; box-shadow: 1px 1px 100px black; border-radius: 10px 10px 10px 10px; position: absolute; margin-top: -450px; margin-left: 30%; padding-left: 5%;">
        <div style="float: right; margin-right: 10px; position: relative;">
            <h3>
                <span id="closeBtn" style="color: red;">X</span></h3>
        </div>
        <table style="width: 100%">
            <caption><strong>Change Status</strong></caption>
            <tr>
                <th colspan="2">&nbsp;</th>
            </tr>
            <tr>
                <th nowrap>Batch Name :</th>
                <td style="text-align: left" nowrap><span id="lblBatchName">bname</span></td>
            </tr>
            <tr>
                <th>Status :</th>
                <td style="text-align: left">
                    <select id="ddlstatus" style="width: 150px; height: 25px;">
                        <option>Select</option>
                        <option>Continue</option>
                        <option>On Hold</option>
                        <option>Completed</option>
                    </select></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="Change" id="btnChangeStatus" style="margin-top: 20px; height: 30px; width: 80px; border: 1px double black;" /></td>
            </tr>
        </table>

    </div>
</asp:Content>

