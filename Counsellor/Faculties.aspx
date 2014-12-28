<%@ page title="" language="C#" masterpagefile="~/Counsellor/Counsellor.master" autoeventwireup="true" inherits="Counsellor_Default, App_Web_rww0c5jb" %>

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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <ul class="top-nav">
        <li><a href="CounsellorHome.aspx" class="scroll">Home </a></li>
        <li class="active"><a href="Faculties.aspx" class="scroll">Trainer</a></li>
        <li><a href="Batches.aspx" class="scroll">Batches</a></li>
        <li><a href="Room.aspx" class="scroll">Room</a></li>
        <li><a href="AddBatch.aspx" class="scroll">Add Batch</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <center><h1 style="margin-top:-3%;">Trainer`s Details</h1></center>

    <h3>
        <asp:Label ID="Label1" runat="server" Text="" Visible="false" Style="font-size: medium; color: green;"></asp:Label></h3>
    <div style="width: 55%; height: 5%; margin-left: 23%; padding: 1%; background-color: #c1baba; vertical-align: middle; font-family: Verdana; font-size: large;">
        <table align="Center">
            <tr>
                <td>Trainer Name</td>
                <td>
                    <asp:TextBox ID="txtfname" runat="server" placeholder="Trainer Name" Style="text-align: center;" required CssClass="txtBox" /></td>

            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>User Name</td>
                <td>
                    <asp:TextBox ID="txtuname" runat="server" placeholder="User Name" Style="text-align: center;" required CssClass="txtBox" /></td>

            </tr>
            
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Select Technologies &nbsp;</td>
                <td>
                    <asp:CheckBoxList runat="server" ID="tech" Style="height: 30px; margin-top: 1%; font-size: large;" RepeatDirection="Vertical" RepeatColumns="3">
                    </asp:CheckBoxList>
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
     <div style="width: 55%; height: 5%; margin-left: 23%; padding: 1%; background-color: #c1baba; vertical-align: middle; font-family: Verdana; font-size: large;">
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" style="width:100%;" PageSize="30">
             <Columns>
                 <asp:TemplateField HeaderText="Trainer Name">
                     <ItemTemplate>
                         <asp:Label ID="Label2" runat="server" Text='<%# Eval("FacName") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="User Name">
                     <ItemTemplate>
                         <asp:Label ID="Label3" runat="server" Text='<%# Eval("FacUname") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                
                 <asp:TemplateField HeaderText="Technologies">
                     <ItemTemplate>
                         <asp:Label ID="Label5" runat="server" Text='<%# Eval("FacTech") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
             </Columns>
             <EmptyDataTemplate>
                 No Faculty Added...
             </EmptyDataTemplate>
             <HeaderStyle CssClass="gridHeader" />
             <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
         </asp:GridView>
         </div>

</asp:Content>

