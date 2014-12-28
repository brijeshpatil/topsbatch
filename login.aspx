<%@ page title="" language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="Default2, App_Web_mf2jd1va" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
            
            padding: 0px;
            margin: 0px;
        }
        #mainDiv {
            width:80%;
            color:white;
            border:0px solid black;
            border-radius:10px 10px 10px 10px;
            box-shadow:0px 0px 20px black;
            background-color:gray;
            
        }
        .txt {
            width:300px;
            height:35px;
            border-radius:10px 0px 10px 0px;
            color:black;
        }
        input[type='submit'] {
            color:black;
            width:150px;
            height:35px;
            border-radius:0px 10px 0px 10px;
        }
            input[type='submit']:hover {
                 color:black;
            width:150px;
            height:35px;
            border-radius:0px 10px 0px 10px;
            }
        fieldset {
            padding:2%;
            border:0px;
        }
        legend {
            font-size:x-large;
            color:white;
            text-decoration:none;
            border:0px;
            margin-top:50px;
            text-align:left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div align="center">
        <div  id="mainDiv">
            <fieldset>
                <legend>Login Here...</legend>
                <table>
                    <tr><td colspan="2">
                        <asp:Label Text="text" ID="lblError" Visible="false" ForeColor="Red" runat="server" /></td></tr>
                    <tr>
                        <td>UserName</td>
                        <td>
                            <asp:TextBox ID="txtUserName" CssClass="txt" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr><td colspan="2">&nbsp;</td></tr>
                    <tr>
                        <td>
                            Password
                        </td>
                        <td>
                            <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="txt" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr><td colspan="2">&nbsp;</td></tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="BtnLogin" runat="server" CssClass="btn" Text="Login Me.." OnClick="BtnLogin_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td align="right">
                            <asp:LinkButton ID="LinkButton1" runat="server">Forget password</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </fieldset>

        </div>
    </div>
</asp:Content>

