<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginForm.aspx.cs" Inherits="LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 77px;
        }
        .auto-style4 {
            height: 34px;
        }
        .auto-style5 {
            width: 77px;
            height: 34px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="4" cellspacing="4" class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblloginname" runat="server" Text="LoginName"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtloginname" runat="server" Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="lblpassword" runat="server" Text="password"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtpassword" runat="server" Width="147px" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4" colspan="2">
                        <asp:Button ID="btnLogin" runat="server" OnClick="btnlogin" Text="Login"  />
                        <asp:Button ID="btncancel" runat="server" Text="Cancel" OnClick="btncancel1" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
