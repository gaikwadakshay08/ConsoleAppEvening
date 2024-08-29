<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PartialPage.aspx.cs" Inherits="PartialPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
        <asp:ScriptManager ID="scrmgr" runat="server" EnablePartialRendering="true">

        </asp:ScriptManager>
            Panel 1 Controls
            <asp:UpdatePanel ID="pnl1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:TextBox ID="text_pnl1_1" runat="server" AutoPostBack="True" OnTextChanged="text_pnl1_1_TextChanged"></asp:TextBox>
                     <asp:TextBox ID="text_pnl1_2" runat="server"></asp:TextBox>
                    <asp:Button ID="btnpnl1_1" runat="server" Text="pnl1" OnClick="btnpnl1_1_Click" />
                    <asp:Label ID="lbl_pnl_1" runat="server" Text="Label"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
            Panel 2 Controls
             <asp:UpdatePanel ID="pnl2" runat="server" UpdateMode="Conditional">
                 <ContentTemplate>
                    <asp:TextBox ID="text_pnl2_1" runat="server"></asp:TextBox>
                     <asp:TextBox ID="text_pnl2_2" runat="server"></asp:TextBox>
                    <asp:Button ID="btnpnl2_1" runat="server" Text="pnl2" OnClick="btnpnl2_1_Click" />
                     <asp:Label ID="lbl_pnl_2" runat="server" Text="Label"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:Button ID="btnsave" runat="server" Text="save" OnClick="btnsave_Click"/>
        </div>
        
    </form>
</body>
</html>
