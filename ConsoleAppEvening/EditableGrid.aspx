<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="EditableGrid.aspx.cs" Inherits="EditableGrid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <script type="text/javascript">
         function CheckUnCheck(CtrlChkall) {
             debugger;
             var tbl = document.getElementById('MainContent_grdEmp');
             for (var i = 0; i < tbl.rows.length; i++) {
                 tbl.rows[i].children[6].children[0].children[0].checked = CtrlChkall.checked;
             }

         }
         function ClearAll() {
             var Ctrls = document.getElementsByTagName('INPUT');
             for (var i = 0; i < Ctrls.length; i++) {
                 if (Ctrls[i].type == 'text')
                     Ctrls[i].value = '';
                 Ctrls = confirm('Do you Really want to Save Record');
             }
             return false;
             
         }
         function CalculateTotal(CtrlGrossSalary) {
             var GrossSalary = parseFloat(CtrlGrossSalary.value);
             
             var Deductions = GrossSalary * .10;
             var NetTotal = GrossSalary - Deductions;
             var CurrentRow = parseInt(CtrlGrossSalary.id.split('-')[3]) + 1;
             //alert(CurrentRow);
             debugger;
             var tbl = document.getElementById('MainContent_grdEmp');
             tbl.rows[CurrentRow].children[4].children[0].value = Deductions;
             tbl.rows[CurrentRow].children[5].children[0].value = NetTotal;
         }
         function CalculateHTotal(Row) {
             var GrossSalary = parseFloat(Row.children[3].children[0].value);
             var Deductions = GrossSalary * .10;
             Row.children[4].children[0].value = Deductions;
             Row.children[5].children[0].value = GrossSalary - Deductions;
             Row.children[6].children[1].children[0].checked = true;
             CalculateFinalTotal();
             
         }
         function CalculateFinalTotal() {
             var GrossSalary = 0;
             var Deductions = 0;

             var tbl = document.getElementById('MainContent_grdEmp');
             for (var i = 1; i < tbl.rows.length - 1; i++) {
                 GrossSalary += parseFloat(tbl.rows[i].children[3].children[0].value);
                 Deductions += parseFloat(tbl.rows[i].children[4].children[0].value);
             }
             tbl.rows[tbl.rows.length - 1].children[3].innerHTML = GrossSalary;
             tbl.rows[tbl.rows.length - 1].children[4].innerHTML = Deductions;
             tbl.rows[tbl.rows.length - 1].children[5].innerHTML = GrossSalary - Deductions;
         }
         
         

     </script>
    <asp:GridView ID="grdEmp" runat="server" AutoGenerateColumns="false" OnRowCreated="grdEmp_RowCreated" CellPadding="4" ShowFooter="True" OnSelectedIndexChanged="grdEmp_SelectedIndexChanged"> 
       
        <Columns>
            <asp:TemplateField HeaderText="EmployeeId">
                <ItemTemplate>
                    <asp:TextBox ID="textempid" runat="server" Text='<%# Eval("employeeid") %>' Width="80px"></asp:TextBox>
                      <asp:HiddenField ID="hdnemployeeid" runat="server" Value='<%# Eval("employeeid") %>'></asp:HiddenField>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="EmployeeName">
                <ItemTemplate>
                    <asp:TextBox ID="textempname" runat="server" Text='<%# Eval("employeename") %>' Width="200px"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DesignationID">
                <ItemTemplate>
                    <asp:DropDownList ID="ddldesignation" runat="server" Width="150px">
                        
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="GrossSalary">
                 <ItemTemplate>
                    <asp:TextBox ID="textgrosssalary" runat="server"
                        Text='<%# Eval("grosssalary") %>' Width="100px"></asp:TextBox>
                </ItemTemplate>
                 <%--onkeyup="CalculateTotal(this);"--%>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Deductions">
                <ItemTemplate>
                    <asp:TextBox ID="textdeductions" runat="server" Text='<%# Eval("deductions") %>' Width="100px"></asp:TextBox>
                </ItemTemplate>
               
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NetSalary">
                 <ItemTemplate>
                    <asp:TextBox ID="textnetsalary" runat="server" Text='<%# Eval("netsalary") %>' Width="100px"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="IsActive">
                <HeaderTemplate>
                     
                    <asp:Checkbox ID="chkall" runat="server" text="SelectAll"  Checked="true" onclick=" CheckUnCheck(this);"
                        Width="100px"></asp:Checkbox>
                
                </HeaderTemplate>
                 <ItemTemplate>
                    <asp:Checkbox ID="chkisactive" runat="server" Checked='<%# Eval("IsActive").ToString()=="Y" ? true:false %>' Width="75px"></asp:Checkbox>
                     <asp:CheckBox ID="Chkselect" runat="server" Checked="false" Width="75px" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Button runat="server" ID="bntsave" Text="Save" OnClick="bntsave_Click" />
    <asp:Button ID="btnupdate" runat="server" Text="update" OnClick="btnupdate_Click" 
        OnClientClick =" return confirm('Do you Really Want Update Record?');"/>
    <asp:Button runat="server" ID="bntdelete" Text="Delete" OnClick="bntdelete_Click"
        OnClientClick =" return confirm('Do you Really Want Update Record?');"/>
    <asp:Button runat="server" ID="bntclear" Text="Clear" OnClientClick="return ClearAll();"/>
    <script type="text/javascript">
        CalculateFinalTotal();
    </script>
</asp:Content>
<%-- <asp:Checkbox ID="chkall" runat="server" text="SelectAll" AutoPostBack="true" 
                        OnCheckedChanged="chkall_CheckedChanged"

                        Checked="true" Width="100px"></asp:Checkbox>--%>

