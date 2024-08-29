<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Page1.aspx.cs" Inherits="Page1" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="MainContent">
    <asp:TextBox ID="usertext" runat="server" AutoPostBack="True"></asp:TextBox>
    <br />
    <asp:TextBox ID="passwordtext" runat="server" AutoPostBack="True"></asp:TextBox>
    <br />
    <asp:Button ID="btnnextpage" runat="server" Text="Nextpage" OnClientClick="btnnextpage_click" OnClick="btnnextpage_Click" />
</asp:Content>


