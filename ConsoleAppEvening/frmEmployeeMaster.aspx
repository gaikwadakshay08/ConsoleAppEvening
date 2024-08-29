<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="frmEmployeeMaster.aspx.cs" Inherits="frmEmployeeMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
  <script type="text/javascript">
        function ValidateCtrls() {
            var Isvalid = true;
            var Ctrls = document.getElementsByTagName('input');
            for (var i = 0; i < Ctrls.length; i++) {
                Ctrls[i].style.backgroundColor = 'white';
                if (Ctrls[i].type == 'text' && Ctrls[i].getAttribute('Required') == 'true' && Ctrls[i].value == '') {
                    Isvalid = false;
                    Ctrls[i].style.backgroundColor = 'Yellow';
                    alert(Ctrls[i].getAttribute('Msg'));
                    Ctrls[i].focus();
                    break;
                }
            }
            if (Isvalid)
                Isvalid = confirm('do you Really Want to Save Record?');

            return Isvalid;
        }
        function keypress(Ctrl, e, DataType) {
            if (DataType == 'int') {
                var ValidIntegers = "0123456789";
                if (ValidIntegers.indexOf(e.key) == -1)
                    return false;
            }
            else if (DataType == 'string') {
                var Validstring = "abcdefghijklmnopqrstuvwxyz.-_()@ ";
                if (Validstring.indexOf(e.key.toLowerCase()) == -1)
                    return false;
                if (Ctrl.value.split(' ').length >= 3 && e.key==' ') 
                    return false;
            }
            else if (DataType == 'double') {
                var ValidDouble = "0123456789";
                if (ValidDouble.indexOf(e.key) == -1)
                    return false;
                if (Ctrl.valu.indexOf('.') >= 0 && e.key == '.')
                    return false;
            }
           
        }
        function CalculateTotal(CtrlSalary) {
            debugger;
            var salary = CtrlSalary.value;
            var deduction = salary * .10;
            var netsalary = salary - deduction;
            //alert(netsalary);
            document.getElementById('MainContent_txtdeduction').value = deduction;
            document.getElementById('MainContent_txtnetsalary').value = netsalary;
      }
      function ShowRecord(Row) {
         // alert(Row.innerHTML);
          document.getElementById('MainContent_txtempid').value = Row.children[0].innerHTML; //value exchange
          document.getElementById('MainContent_txtempname').value = Row.children[1].innerHTML;
          document.getElementById('MainContent_ddldesignation').value = Row.children[2].innerHTML;
          document.getElementById('MainContent_txtgrosssalary').value = Row.children[3].innerHTML;
          document.getElementById('MainContent_txtdeduction').value = Row.children[4].innerHTML;
          document.getElementById('MainContent_txtnetsalary').value = Row.children[5].innerHTML;
          if (Row.children[6].innerText=="Y")
              document.getElementById('MainContent_chkisactive').checked = true;
          else
              document.getElementById('MainContent_chkisactive').checked = false;

          document.forms[0].submit();// subit karne par valu update ki
      }
      //function setColor(Row, Color){ //eror handle
      //    Row.style.backgroundColor = Color;
      //}
      function ShowHelp(HelpType) {
          sessionStorage.setItem('HelpType', HelpType);
          window.open('Help.aspx?'+HelpType,'top=50,left=100px,height=400px,width=500px');

      }
         
  </script>
    Employee Master
    <table id="tblemp" style="width:100%" border="1">
        <tr>
            <th>EmployeeID</th>
            <td> <asp:TextBox ID="txtempid" runat="server" Required="true" Msg="EmployeeId is Mandatory"
                OnkeyPress="return keypress(this,event,'int');" OnTextChanged="txtempid_TextChanged" AutoPostBack="True"
               
                 ></asp:TextBox>
                <input id="btnEmpHelp" style="width: 43px" type="button" value="?" onclick="ShowHelp('employee');"/>

            </td>
        </tr>
         <tr>
            <th>EmployeeName</th>
            <td><asp:TextBox ID="txtempname" runat="server" Width="300px"
                Required="true" Msg="EmployeeName is Mandatory"
                OnkeyPress="return keypress(this,event,'string');"
                ></asp:TextBox></td>

        </tr>
         <tr>
               
            <th>Designation</th>
            <td>
                <asp:DropDownList ID="ddldesignation" runat="server" Width="300px">
                    <asp:ListItem Selected="True" Value="0">Project Manager</asp:ListItem>
                    <asp:ListItem Value="1">Project Lead</asp:ListItem>
                    <asp:ListItem Value="2">Team Lead</asp:ListItem>
                    <asp:ListItem Value="3">Senior Developer</asp:ListItem>
                    <asp:ListItem Value="4">junior Devleloper</asp:ListItem>
                    
                </asp:DropDownList>
                <input id="btdesigHelp" style="width: 43px" type="button" value="?" onclick="ShowHelp('designation');"/>
            </td>
        </tr>
         <tr>
            <th>Gross Salary</th>
            <td><asp:TextBox ID="txtgrosssalary" runat="server"
                Required="true" Msg="Gross Salary is Mandatory"
                  onkeyPress="return keypress(this,event,'double');"
                    onKeyup="CalculateTotal(this);"
                ></asp:TextBox></td>
        </tr>
         <tr>
            <th>Deduction</th>
            <td><asp:TextBox ID="txtdeduction" runat="server"
                  Required="true" Msg="Deduction is Mandatory"
                  OnkeyPress="return keypress(this,event,'double');"
                
                ></asp:TextBox></td>
        </tr>
         <tr>
            <th>Net Salary</th>
            <td><asp:TextBox ID="txtnetsalary" runat="server"
                 Required="true" Msg="Net Salary is Mandatory"
                  OnkeyPress="return keypress(this,event,'double');"
                
                ></asp:TextBox></td>
        </tr>
         <tr>
            <th>IsActive</th>
            <td>
                <asp:CheckBox ID="chkisactive" runat="server" /></td>
        </tr>
         <tr>
            <td colspan="2">
                <asp:Button ID="btnsave" runat="server" Text="Save" 
                    OnClick="btnsave_Click" 
                    OnClientClick="return ValidateCtrls();"
                    />
                &nbsp<asp:Button ID="btndelete" runat="server" Text="Delete" OnClick="btndelete_Click" 
                    OnClientClick="return confirm('do you really wants to delete record?)"
                    /> 
                
                &nbsp<asp:Button ID="btncancel" runat="server" Text="Cancel" />
                <br />
                <asp:GridView ID="grdEmp" runat="server" OnRowCreated="grd_RowCreated">
                </asp:GridView>
            </td>
        </tr>
        
    </table>
</asp:Content>

