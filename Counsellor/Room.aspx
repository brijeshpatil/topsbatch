<%@ page title="" language="C#" masterpagefile="~/Counsellor/Counsellor.master" autoeventwireup="true" inherits="Counsellor_Default, App_Web_irxfy1jz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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


        #ContentPlaceHolder1_tech td
        {
            padding-left:15px;
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <ul class="top-nav">
								<li ><a href="CounsellorHome.aspx" class="scroll">Home</a></li>
								<li ><a href="Faculties.aspx" class="scroll">Faculties</a></li>
								<li><a href="Batches.aspx" class="scroll">Batches</a></li>
								<li class="active"><a href="Room.aspx" class="scroll">Room</a></li>
								<li><a href="AddBatch.aspx" class="scroll">Add Batch</a></li>
							</ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <center><h1 style="margin-top:-3%;">Room Details</h1></center>

    <h3>
        <asp:Label ID="Label1" runat="server" Text="" Visible="false" Style="font-size: medium; color: green;"></asp:Label></h3>
    <div style="width: 62%; height: 5%; margin-left: 20%; padding: 1%; background-color: #c1baba; vertical-align: middle; font-family: Verdana; font-size: large;">

        <table align="Center">
            <tr>
                <td>Room Name</td>
                <td><asp:TextBox ID="txtrname" runat="server" placeholder="Room Name" Style="text-align: center;" required CssClass="txtBox" /></td>

            </tr>
             <tr>
               <td>&nbsp;</td>
               <td>&nbsp;</td>
           </tr>
            <tr>
                <td>Student Strength</td>
                <td><asp:TextBox ID="txtrstr" runat="server" placeholder="Strength" Style="text-align: center;" required CssClass="txtBox" /></td>

            </tr>
           <tr>
               <td>&nbsp;</td>
               <td>&nbsp;</td>
           </tr>
            <tr>
                <td>Select Technologies &nbsp;</td>
                <td>
                    <asp:CheckBoxList runat="server" ID="tech" style="height:30px; margin-top:1%;font-size:large;" RepeatDirection="Vertical" RepeatColumns="3">
         </asp:CheckBoxList>
                </td>
            </tr>
             <tr>
               <td>&nbsp;</td>
               <td>&nbsp;</td>
           </tr>
            <tr>
                <td>&nbsp;</td>
                <td><asp:Button Text="Add" runat="server" ID="btnAdd" CssClass="btn" Font-Bold="True" Font-Size="Medium" OnClick="btnAdd_Click" /></td>
            </tr>

        </table>



    </div>
    <br />
    <div style="width: 62%; height:auto; margin-left: 20%; padding: 1%; background-color: #c1baba; vertical-align: middle; font-family: Verdana; font-size: large;">

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" style="width:90%; margin-left:5%;" HeaderStyle-CssClass="gridHeader">
            <Columns>
                <asp:TemplateField HeaderText="Room Name">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("roomName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Strength">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Strenght") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Supported Technologies">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%#Eval("RoomTech")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
               <center> No Rooms Added...</center>
            </EmptyDataTemplate>
            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:GridView>
        </div>


</asp:Content>

