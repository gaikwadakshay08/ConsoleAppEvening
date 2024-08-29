<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Repeter.aspx.cs" Inherits="Repeter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <script type="text/javascript">
        function CalculateTotal(Row) {
            debugger;
            var GrossSalary = Row.children[3].children[0].value;
            var Deductions = GrossSalary * .10;
            Row.children[4].innerHTML = Deductions;
            Row.children[5].innerHTML = GrossSalary - Deductions;
        }
    </script>
    <table id="tblRpt" style="width:100%" border="1">
        <tr >
            <th>EmpId</th>
            <th>EmpName</th>
            <th>Designation</th>
            <th>GrossSalary</th>
            <th>Deductions</th>
            <th>NetSalary</th>
            <th>IsActive</th>
        </tr>
<asp:Repeater ID="Rpt" runat="server">
    <ItemTemplate>
        <tr onmouseover="this.style.backgroundColor='Yellow';"  onmouseout="this.style.backgroundColor='white';"
            onkeyup="CalculateTotal(this);">
            <td><%# Eval("employeeid") %></td>
            <td><%# Eval("employeename") %></td>
            <td><%# Eval("designationid") %></td>
            <td>
                <asp:TextBox ID="txtgrosssalary" runat="server" Text='<%# Eval("grosssalary") %>'>
                </asp:TextBox>
            </td>
            <td><%# Eval("deductions") %></td>
            <td><%# Eval("netsalary") %></td>
            <td>IsActive</td>
        </tr>
    </ItemTemplate>
</asp:Repeater>
</table>
</asp:Content>

