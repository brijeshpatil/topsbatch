<%@ page title="" language="C#" masterpagefile="~/Admin/Administrator.master" autoeventwireup="true" inherits="Admin_Default, App_Web_4idr34fo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .drp
        {
            width:250px;
            height:28px;
            border-radius:5px;
        }
         .btn
        {
            width: 120px;
            height: 33px;
            background-color: white;
            border-radius: 10px;
            text-align: center;
            font-size: large;
            vertical-align: top;
            margin-left:5%;
            margin-top:1%;
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
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <center><h1 style="margin-top:-3%;">Counsellor Details</h1></center>

    <h3>
        <asp:Label ID="Label1" runat="server" Text="" Visible="false" Style="font-size: medium; color: green; margin-left:7%;"></asp:Label></h3>
    <div style="width: 80%; height: 5%; margin-left: 10%; padding: 1%; background-color: #c1baba; vertical-align: middle; font-family: Verdana; font-size: large;">
        <asp:TextBox ID="txtConame" runat="server" placeholder="Counsellor Name" Style="text-align: center; margin-left:3%;" required CssClass="txtBox" />&nbsp;&nbsp;
         <asp:TextBox ID="txtcouname" runat="server" placeholder="User Name" Style="text-align: center;" required CssClass="txtBox" />&nbsp;&nbsp;
       
        
        <asp:DropDownList runat="server" ID="drpCenter" CssClass="drp" style="margin-top:1%;">
        </asp:DropDownList>
        <asp:Button Text="Add" runat="server" ID="btnAdd" CssClass="btn" Font-Bold="True" Font-Size="Medium" OnClick="btnAdd_Click" />

    </div>
    <br />
    <div style="width: 77%; height: 5%; margin-left: 10%; padding: 1%; background-color: #c1baba; vertical-align: middle; font-family: Verdana; font-size: large;">
        
    </div>

</asp:Content>

