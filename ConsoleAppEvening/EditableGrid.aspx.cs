using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditableGrid : System.Web.UI.Page
{   
    DataTable dt = new DataTable(); //data add
    private object dtDesig;
    private int i;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ShowGrid();
        }
    }
    protected void ShowGrid()
    {
        DAL dal = new DAL();

        dal.IsProcedureCall = false;  //database se dropdownlist
        DataTable dtdesig = dal.GetTable("select * from designationmaster");  
        if (ViewState["datadesig"] == null)
            ViewState.Add("datadesig", dtdesig);
        else
            ViewState["datadesig"] = dtdesig; //d s d



        dal.AddParameter("employeeid", "0");
        dal.AddParameter("action", "select");
        dal.IsProcedureCall = true;
        dt = dal.GetTable("Procedure"); //datatable to replace add data and if else viewstste
        if (ViewState["data"] == null)
            ViewState.Add("data", dt);
        else
            ViewState["data"] = dt;

        grdEmp.DataSource = dt;
        grdEmp.DataBind();

       
    }


    protected void grdEmp_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if(e.Row.RowType == DataControlRowType.DataRow)
        {
            DropDownList ddldesignation = (DropDownList)e.Row.FindControl("ddldesignation"); //drop down to database
            DataTable dtdesig = (DataTable)ViewState["datadesig"];   

            ddldesignation.DataSource = dtdesig;
            ddldesignation.DataTextField = "designation";
            ddldesignation.DataValueField = "designationid";
            if(e.Row.DataItem!=null)
            ddldesignation.SelectedValue= (((System.Data.DataRowView)e.Row.DataItem).Row.ItemArray[2]).ToString();//ddtd
            e.Row.Attributes.Add("onkeyup", "CalculateHTotal(this);");
        }
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        for(int i=0; i < grdEmp.Rows.Count; i++) 
        {
            CheckBox Chkselect = (CheckBox)grdEmp.Rows[i].FindControl("Chkselect");
            if (Chkselect.Checked)
            {
                TextBox textempid = (TextBox)grdEmp.Rows[i].FindControl("textempid");
              
                TextBox textempname = (TextBox)grdEmp.Rows[i].FindControl("textempname");
                DropDownList ddldesignation = (DropDownList)grdEmp.Rows[i].FindControl("ddldesignation");        
                TextBox textgrosssalary = (TextBox)grdEmp.Rows[i].FindControl("textgrosssalary");
                TextBox textdeductions = (TextBox)grdEmp.Rows[i].FindControl("textdeductions");
                TextBox textnetsalary = (TextBox)grdEmp.Rows[i].FindControl("textnetsalary");
                CheckBox chkisactive = (CheckBox)grdEmp.Rows[i].FindControl("chkisactive");

                DAL dal = new DAL();
                dal.AddParameter("employeeid", textempid.Text);
                dal.AddParameter("employeename", textempname.Text);
                dal.AddParameter("designationid", ddldesignation.SelectedValue);
                dal.AddParameter("grosssalary", textgrosssalary.Text);
                dal.AddParameter("deductions", textdeductions.Text);
                dal.AddParameter("netsalary", textnetsalary.Text);
                dal.AddParameter("IsActive", chkisactive.Checked == true ? "Y" : "N");

                HiddenField hdnemployeeid = (HiddenField)grdEmp.Rows[i].FindControl("hdnemployeeid"); //hiden field to add data
                if (hdnemployeeid.Value=="0")            /// add data if else condition insert update
                dal.AddParameter("action", "insert");
                else
                    dal.AddParameter("action", "update");
                dal.IsProcedureCall = true; //add data


                int result = dal.ExecuteQuery("Procedure");
                if (result > 0)
                    Response.Write("Record Succesfully update");
                else
                    Response.Write("Record does not  update");
            }
        }
        ShowGrid();

    }


    protected void bntdelete_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < grdEmp.Rows.Count; i++)
        {

            CheckBox Chkselect = (CheckBox)grdEmp.Rows[i].FindControl("Chkselect");
            if (Chkselect.Checked)
            {
                DAL dal = new DAL();
                TextBox textempid = (TextBox)grdEmp.Rows[i].FindControl("textempid");
                dal.AddParameter("@employeeid", textempid.Text);
                dal.AddParameter("action", "delete");
                dal.IsProcedureCall = true;
                int result = dal.ExecuteQuery("Procedure");
                if (result > 0)
                    Response.Write("Record Successfully Deleted");
                else

                    Response.Write("Unable to Delete record");
            }
        }
        ShowGrid();
    }



    protected void bntsave_Click(object sender, EventArgs e)// data add
    {
        dt = (DataTable)ViewState["data"];
        DataRow rw= dt.NewRow();
        rw["employeeid"] = 0;
        rw["designationid"] = 1;
        dt.Rows.Add(rw);
        grdEmp.DataSource = dt;     
        grdEmp.DataBind();
    }

    protected void grdEmp_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}

