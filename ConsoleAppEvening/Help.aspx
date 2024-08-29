<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Help.aspx.cs" Inherits="Help" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <script type="text/javascript">
        function ShowData(CtrlValue) {
           // alert(document.location.search);
            PageMethods.set_path('Help.aspx');
           // PageMethods.GetHelpData(document.location.search, CtrlValue, ShowResult, ShowError);
            PageMethods.GetHelpData(sessionStorage.getItem('HelpType'), CtrlValue, ShowResult, ShowError);
        }
        function ShowResult(result) {
           // alert(result);
            document.getElementById('dvData').innerHTML = result;
            //MainContent_txtempid
        }
        function ShowError(error) {
            alert(error);
        }
        function SelectRecord(Row) {
            // if (document.location.search.indexof('employee') >= 0)
            if(sessionStorage.getItem('HelpType').indexOf('employee') >= 0)
            { 
                window.opener.document.getElementById('MainContent_txtempid').value = Row.children[0].innerText;
                window.opener.document.forms[0].submit();
            }
            else
                alert(Row.innerHTML)
            this.close();
        }
    </script>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="srcmgr" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        search : <input type="text" id="textsearch" onkeyup="ShowData(this.value);" />
        <div id="dvData">
        </div>
    </form>
</body>
</html>
