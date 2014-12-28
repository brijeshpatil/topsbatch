<%@ page title="" language="C#" masterpagefile="~/Admin/Administrator.master" autoeventwireup="true" inherits="Admin_Centers, App_Web_4idr34fo" %>

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
        .txtBox
        {
             border-radius: 10px;
             border:hidden;
             height:35px;
        }
        .gridHeader th
        {
            text-align: center;
            background-color: #c1baba;
            color: white;
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



    <center><h1 style="margin-top:-3%;">Center Details</h1></center>

    <h3>
        <asp:Label ID="Label1" runat="server" Text="" Visible="false" Style="font-size: medium; color: green;"></asp:Label></h3>
    <div style="width: 80%; height: 5%; margin-left: 7%; padding: 1%; background-color: #c1baba; vertical-align: middle; font-family: Verdana; font-size: large;">
        <asp:TextBox ID="txtCenterName" runat="server" placeholder="Center Name" Style="text-align: center;" required CssClass="txtBox" />&nbsp;&nbsp;
         <asp:TextBox ID="txtCity" runat="server" placeholder="City Name" Style="text-align: center;" required CssClass="txtBox" />&nbsp;&nbsp;
        <asp:TextBox ID="txtContactNo" runat="server" placeholder="Contact Number" Style="text-align: center;" required CssClass="txtBox" />
        <asp:Button Text="Add" runat="server" ID="btnAdd" CssClass="btn" Font-Bold="True" Font-Size="Medium" OnClick="btnAdd_Click" />

    </div>
    <br />
    <div style="width: 84%; height: auto; margin-left:7%; padding: 1%; vertical-align: middle; font-family: Verdana; font-size: large;">

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Style="width: 83%; height: auto; text-align: center;" HorizontalAlign="Center">
            <Columns>
                <asp:TemplateField HeaderText="Center Name">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# bind("Center_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Center City">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# bind("Center_City") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Contact Info">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# bind("Contact_info") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField SelectText="Edit" ShowSelectButton="True" />
            </Columns>
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="gridHeader" />
            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:GridView>
    </div>


</asp:Content>

