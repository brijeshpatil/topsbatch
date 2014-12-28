<%@ page title="" language="C#" masterpagefile="~/Counsellor/Counsellor.master" autoeventwireup="true" inherits="Counsellor_Default, App_Web_no1r2oxk" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  
    <style type="text/css">
        .btn
        {
            width: 120px;
            height: 33px;
            background-color: white;
            border-radius: 10px;
            text-align: center;
            font-size: large;
            vertical-align: top;
        }

            .btn:hover
            {
                width: 120px;
                height: 33px;
                color: white;
                background-color: rgb(199, 223, 231);
                border-radius: 10px;
                text-align: center;
                font-size: large;
                vertical-align: top;
            }


        #ContentPlaceHolder1_chkDays td
        {
            padding-left: 15px;
        }

        .gridHeader th
        {
            text-align: center;
            background-color: #808080;
            color: white;
            font-size: large;
        }
    </style>
    
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <ul class="top-nav">
        <li><a href="CounsellorHome.aspx" class="scroll">Home </a></li>
        <li><a href="Faculties.aspx" class="scroll">Trainer</a></li>
        <li class="active"><a href="Batches.aspx" class="scroll">Batches</a></li>
        <li><a href="Room.aspx" class="scroll">Room</a></li>
        <li><a href="AddBatchSchedule.aspx" class="scroll">Add Schedule</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
    <center><h1 >Batch Details</h1></center></div>
   
    
    <div id="batchEntryDiv" style="width: 62%; height: 5%; margin-left: 20%; padding: 1%; background-color: #c1baba; vertical-align: middle; font-family: Verdana; font-size: large;">
      
                  <table align="Center">
            <tr><td colspan="2"> <h3>
        <asp:Label ID="Label1" runat="server" Text="" Visible="false" Style="font-size: medium; color: green;"></asp:Label></h3></td></tr>
            <tr>
                <td>Select Technology &nbsp;</td>
                <td>
                    <asp:DropDownList runat="server" ID="drpTech" CssClass="drp" Style="margin-top: 1%;" Width="250px">
                    </asp:DropDownList></td>

            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
             <tr>
                <td>Start Date</td>
                <td>
                   <asp:TextBox ID="txtsdate" TextMode="Date" runat="server" placeholder="Date" required CssClass="txtBox" />
                   
                </td>
            </tr>
            
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
           <tr>
                <td>Select Faculty &nbsp;</td>
                <td>
                    <asp:DropDownList runat="server" ID="drpFac" AutoPostBack="true" CssClass="drp" Style="margin-top: 1%;" OnSelectedIndexChanged="drpFac_SelectedIndexChanged" Width="250px">
                    </asp:DropDownList>

                </td>

            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Batch Name</td>
                <td>
                    <asp:TextBox ID="txtbatchname" runat="server" placeholder="Counsellor Name" required />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Batch Days</td>
                <td>
                    <asp:CheckBoxList runat="server" ID="chkDays" Style="height: 30px; margin-top: 1%; font-size: large;" RepeatDirection="Horizontal" RepeatColumns="4" CellPadding="5" CellSpacing="5">
                        <asp:ListItem>Mon</asp:ListItem>
                        <asp:ListItem>Tue</asp:ListItem>
                        <asp:ListItem>Wed</asp:ListItem>
                        <asp:ListItem>Thu</asp:ListItem>
                        <asp:ListItem>Fri</asp:ListItem>
                        <asp:ListItem>Sat</asp:ListItem>
                        <asp:ListItem>Sun</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
             <tr>
                <td>Batch Status</td>
                <td>
                     <asp:DropDownList runat="server" ID="drpStatus" CssClass="drp" Style="margin-top: 1%;" Width="250px">
                         <asp:ListItem>Select Status</asp:ListItem>
                         <asp:ListItem>Continue</asp:ListItem>
                         <asp:ListItem>On Hold</asp:ListItem>
                         <asp:ListItem>Completed</asp:ListItem>

                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button Text="Add" runat="server" ID="btnAdd" CssClass="btn" Font-Bold="True" Font-Size="Medium" OnClick="btnAdd_Click" /></td>
            </tr>

        </table>
           
      



    </div>
    <br />
    <div style="width: 62%; height: auto; margin-left:20%; padding: 1%; background-color: #c1baba; vertical-align: middle; font-family: Verdana; font-size: large;">

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Style="width: 100%; margin-left: 0%;" HeaderStyle-CssClass="gridHeader" PageSize="30">
            <Columns>
                <asp:TemplateField HeaderText="Batch Name">
                    <ItemTemplate>
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
                        <asp:Label ID="Label4" runat="server" Text='<%#Eval("batchStatus")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <center> No Batch Added...</center>
            </EmptyDataTemplate>
            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:GridView>
    </div>

  

</asp:Content>

