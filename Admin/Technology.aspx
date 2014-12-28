<%@ page title="" language="C#" masterpagefile="~/Admin/Administrator.master" autoeventwireup="true" inherits="Admin_Default, App_Web_djc0knrs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%--<script type="text/ecmascript">
        function abc()
        {
            alert("hello");
            var lbl = document.getElementById("ContentPlaceHolder1_Label3");
            lbl.style.display = "block";
        }

    </script>--%>
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
         .lbl
         {width: 120px;
            height: 33px;
            background-color: white;
            border-radius: 10px;
            text-align: center;
            font-size: large;
            vertical-align: top;

             display:none;
         }
         </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center><h1 style="margin-top:-3%;">Technologies Details</h1></center>

    <h3>
        <asp:Label ID="Label1" runat="server" Text="" Visible="false" Style="font-size: medium; color: green;"></asp:Label></h3>
    <div style="width: 36%; height: 5%; margin-left: 29%; padding: 1%; background-color: #c1baba; vertical-align: middle; font-family: Verdana; font-size: large;">
        <asp:TextBox ID="txttech" runat="server" placeholder="Technology Name" Style="text-align: center; margin-left:5%;" required CssClass="txtBox" />&nbsp;&nbsp;
         
        <asp:Button Text="Add" runat="server" ID="btnAdd" CssClass="btn" Font-Bold="True" Font-Size="Medium" OnClick="btnAdd_Click" />
         
    </div>
    <br />

     <div style="width: 36%; height: auto; margin-left:29%; padding: 1%; vertical-align: middle; font-family: Verdana; font-size: large;">

         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" HeaderStyle-CssClass="gridHeader" style="width:100%; height:auto;">
             <Columns>
                 <asp:TemplateField HeaderText="Technology Name">
                     <ItemTemplate>
                         <asp:Label ID="Label2" runat="server" Text='<%# bind("techName") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:CommandField ShowSelectButton="True" />
             </Columns>

<HeaderStyle CssClass="gridHeader"></HeaderStyle>
             <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
         </asp:GridView>
    </div>
</asp:Content>

