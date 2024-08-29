using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Session.Clear();    
        }
    }

    protected void btnlogin(object sender, EventArgs e)
    {
        DAL dal= new DAL();
        dal.ClearParameters();
        dal.IsProcedureCall= false;
        SqlDataReader rdr = dal.GetReader("select * from Login_user_Mar where LoginName='" + txtloginname.Text + "'");
        if(rdr!=null && rdr.HasRows) 
        { 
            rdr.Read();
            if (txtpassword.Text == rdr["LoginPassword"].ToString())
            {
                rdr.Close();
                LoadRights();
                Response.Redirect("about.aspx");
            }
            else
            {
                Response.Write("Invalid password entered");
                txtpassword.Focus();   

            }
        }
        else
        {
            Response.Write("Invalid password entered");
            txtloginname.Focus();
        }
        if(rdr.IsClosed) rdr.Close();
            
    }
    protected void LoadRights()
    {
        List<Login_Rights_Mar> rightslist = new List<Login_Rights_Mar>();

        DAL dAL = new DAL();
        dAL.ClearParameters();
        dAL.IsProcedureCall = false;
        SqlDataReader rdr = dAL.GetReader("select * from Login_Rights_Mar where LoginName='" + txtloginname.Text + "'");
        if (rdr != null && rdr.HasRows)
        {
            while(rdr.Read())
            {
                Login_Rights_Mar l=new Login_Rights_Mar();
                l.LoginName = txtloginname.Text;    
                l.PageName= rdr["PageName"].ToString();
                rightslist.Add(l);

            }
          
        }
        rdr.Close();
        Session["UserRights"] = rightslist; 


    }
        

    protected void btncancel1(object sender, EventArgs e)
    {

    }
}
