<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Page2.aspx.cs" Inherits="Page2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
      <asp:TextBox ID="usertext" runat="server"></asp:TextBox>
    <br />
    <asp:TextBox ID="passwordtext" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="btnpreviouspage" runat="server" Text="previouspage" OnClick="btnpreviouspage_click" />
</asp:Content>

