using System;
using System.Activities.Statements;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GrodViewPaging : System.Web.UI.Page
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
        DAL daL = new DAL();
        List<DesignationMaster> desiglist = new List<DesignationMaster>();
        daL.ClearParameters();
        daL.IsProcedureCall = false;
        SqlDataReader rdr = daL.GetReader("select * from DesignationMaster");
        if (rdr != null && rdr.HasRows)
        {
            while (rdr.Read())
            {
                DesignationMaster d = new DesignationMaster();
                d.DesignationId = Convert.ToInt32(rdr["DesignationId"].ToString());
                d.Designation = rdr["Designation"].ToString();
                desiglist.Add(d);
            }
        }
        rdr.Close();
        ViewState["dataDesig"] = desiglist;

       
        daL.ClearParameters();


        daL.AddParameter("employeeid", "0");
        daL.AddParameter("action", "select");
        daL.IsProcedureCall = true;
        DataTable dt = daL.GetTable("Procedure");
        grdEmp.DataSource = dt;
        grdEmp.DataBind();

        if (grdEmp.Rows.Count > 0)
        {


            grdEmp.HeaderRow.Cells[0].Text = "Empid"; //heder name chage
            grdEmp.HeaderRow.Cells[1].Text = "Empname";
            grdEmp.HeaderRow.Cells[2].Text = "Designation";
            

            grdEmp.HeaderRow.Cells[1].Visible= false; //colum not disply

        }

        
    }

    protected void grdEmp_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if(e.Row.RowType== DataControlRowType.DataRow) 
        {
            e.Row.Cells[7].Visible=false; //colum hiding
             
        }
    }

    protected void grdEmp_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {


            List<DesignationMaster> desiglist = (List<DesignationMaster>)ViewState["dataDesig"];
            string DesigId = (((System.Data.DataRowView)e.Row.DataItem).Row.ItemArray[2]).ToString();
            e.Row.Cells[2].Text = desiglist.Find(x => x.DesignationId.ToString() == DesigId).Designation;
        }
    }





  
    protected void grdEmp_PageIndexChanging(object sender, GridViewPageEventArgs e) 
    {
        grdEmp.PageIndex = e.NewPageIndex;
        ShowGrid();
    }
}
[Serializable]
public class DesignationMaster
{
    public int DesignationId { get; set; }
    public string Designation { get; set; }    
}