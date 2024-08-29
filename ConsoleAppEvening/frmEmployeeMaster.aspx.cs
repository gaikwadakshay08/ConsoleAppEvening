using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class frmEmployeeMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtempid.Focus();
            ViewState.Add("FoundFlag", false);
            ShowGrid(); //call kiya
        }

    }
    protected void ShowGrid() //javascript function banaya
    {
        return;

        DAL dal = new DAL();
        dal.AddParameter("employeeid", "0");
        dal.AddParameter("action", "select");
        dal.IsProcedureCall = true;
        DataTable dt = dal.GetTable("Procedure");
        grdEmp.DataSource = dt;
        grdEmp.DataBind();


    }
    protected void txtempid_TextChanged(object sender, EventArgs e)
    {
        DAL dal = new DAL();
        dal.AddParameter("@employeeid", txtempid.Text);
        dal.AddParameter("@action", "select");
        dal.IsProcedureCall = true;
       // DataTable dt = dal.GetTable("pr_employeemaster");
        SqlDataReader rdr = dal.GetReader("Procedure");
        if (rdr != null && rdr.HasRows)
        // if (dt !=null && dt.rows.Count>0)
        {
            ViewState["FoundFlag"] = true;
            rdr.Read();
            txtempname.Text = rdr["employeename"].ToString();
            ddldesignation.SelectedValue = rdr["designationid"].ToString();
            txtgrosssalary.Text = rdr["grosssalary"].ToString();
            txtdeduction.Text = rdr["deductions"].ToString();
            txtnetsalary.Text = rdr["netsalary"].ToString();
            chkisactive.Checked = rdr["IsActive"].ToString() == "Y" ? true : false;
        }
        else
        {
            txtempname.Text = "";
            ddldesignation.SelectedValue = "1";
            txtgrosssalary.Text = "";
            txtdeduction.Text = "";
            txtnetsalary.Text = "";
            chkisactive.Checked = true;
        }
        txtempname.Focus();
    }

    protected void btnsave_Click(object sender, EventArgs e )
    {
        DAL dal = new DAL();
        dal.AddParameter("employeeid", txtempid.Text);
        dal.AddParameter("employeename", txtempname.Text);
        dal.AddParameter("designationid", ddldesignation.SelectedValue);
        dal.AddParameter("grosssalary", txtgrosssalary.Text);
        dal.AddParameter("deductions", txtdeduction.Text);
        dal.AddParameter("netsalary", txtnetsalary.Text);
        dal.AddParameter("IsActive", chkisactive.Checked == true ? "Y" : "N");
        if (((bool)ViewState["FoundFlag"]))
        {
            dal.AddParameter("action", "update");
            dal.IsProcedureCall = true;
        }
          
        else
        {
            dal.AddParameter("action", "insert");
            dal.IsProcedureCall = true;
        }
          
        int result = dal.ExecuteQuery("Procedure");
        if (result > 0)
            Response.Write("Record Succesfully Saved");
        else
            Response.Write("Record does not saved");
        //(ViewState["FoundFlag"])

        ShowGrid(); //call kiya vapas rebind karne ke liye
    }



    protected void btndelete_Click(object sender, EventArgs e)
    {
        DAL dal = new DAL();
        dal.AddParameter("@employeeid", txtempid.Text);
        dal.AddParameter("@action", "delete");
        dal.IsProcedureCall = true;
        int result = dal.ExecuteQuery("Procedure");
        if (result > 0)
            Response.Write("Record Successfully Deleted");
        else
            Response.Write("Unable to Delete record");

        ShowGrid();//grid refresh 
    }

    protected void grd_RowCreated(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        if (e.Row.RowType == System.Web.UI.WebControls.DataControlRowType.DataRow)
        {


            e.Row.Attributes.Add("onclick", "ShowRecord(this);");
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='Yellow';"); //coler change
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='white';");
            //e.Row.Attributes.Add("onmouseover", "setColor(this,'Yellow');");
            //e.Row.Attributes.Add("onmouseout", "setColor(this,'white');");
            e.Row.Style.Add("cursor:hand;cursor:pointer;", ""); //hand ka cursor dikhega
        }
        e.Row.Cells[7].Visible = false;
    }
}