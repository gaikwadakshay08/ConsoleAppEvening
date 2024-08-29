using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Repeter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            ShowGrid();

        }
    }

    protected void ShowGrid()
    {   
        DAL daL= new DAL();
        daL.ClearParameters();
        daL.AddParameter("employeeid", "0");
        daL.AddParameter("action", "select");
        daL.IsProcedureCall = true;
        DataTable dt = daL.GetTable("Procedure");
        Rpt.DataSource = dt;
        Rpt.DataBind();
    }
}