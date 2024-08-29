<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MultiView.aspx.cs" Inherits="MultiView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:MultiView ID="mv" runat="server" ActiveViewIndex="0">
        <asp:View runat="server" ID="v1">
            
        <table border="1" style="width:100%">
            <tr>
                 <th colspan="2"> Employee and Department info</th>
             </tr>
            <tr>
                <td>EmpId</td>
                <td>
                    <asp:TextBox ID="textempid" runat="server"></asp:TextBox></td>
               
            </tr>
            <tr>
                <td>EmpName</td>
                <td>
                    <asp:TextBox ID="textname" runat="server"></asp:TextBox></td>
               
            </tr>
            <tr>
                <td>Department</td>
                <td>
                    <asp:TextBox ID="textdepartment" runat="server"></asp:TextBox></td>
               
            </tr>
             <tr>
                <td colspan="2">
                    <asp:Button ID="btnnext" runat="server" Text="Next" OnClick="btnnext_Click" /></td>
               
            </tr>
            
        </table>
    </asp:View>
     <asp:View runat="server" ID="V2">
       
         <table border="1" style="width:100%">
             <tr>
                 <th colspan="2">  Salary Structure and wfh info</th>
             </tr>
            <tr>
                <td>Salary Structure</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
               
            </tr>
            <tr>
                <td>Other Facilites</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
               
            </tr>
            <tr>
                <td>Is Work From Home</td>
                <td>
                    <asp:CheckBox ID="chk" runat="server"></asp:CheckBox></td>
               
            </tr>
             <tr>
                <td colspan="2">

                    <asp:Button ID="btnprv" runat="server" Text="Privious" OnClick="btnprv_Click" />
                     <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_Click" />
                </td>
               
            </tr>
            
        </table>
    </asp:View>
    </asp:MultiView>
    
</asp:Content>

