using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Page2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {    //sesion state
        //if (!IsPostBack)
        //{
        //    usertext.Text = Session["userid"].ToString();
        //     passwordtext.Text= Session["userpass"].ToString();
        //}

       //2.query string
      /* if (!IsPostBack)
       {
            if (Request.QueryString.Count > 0)
            {   //2nd methode
                byte[] data = Convert.FromBase64String(Request.QueryString[0]);
                string decodedString = Encoding.UTF8.GetString(data);
                usertext.Text = decodedString.Split('#')[0];
                passwordtext.Text = decodedString.Split('#')[1];

                //1st methode
                // usertext.Text = Request.QueryString["uid"];
                //passwordtext.Text = Request.QueryString["pass"];

            }
        }*/
       //3 cookie 1 page 2 nd page
       /*if(!IsPostBack)
       {
            usertext.Text = Request.Cookies["mydata"]["userid"].ToString();
            passwordtext.Text = Request.Cookies["mydata"]["userpass"].ToString(); 
       }*/
        
    }

    protected void btnpreviouspage_click(object sender, EventArgs e)
    {
       // Session["userid"] = usertext.Text; //session create
         //Session["userpass"] = passwordtext;//session create
         //Response.Redirect("Page1.aspx");

        //2.query string
       // Response.Redirect("Page1.aspx?uid="+usertext.Text+"&pass="+ passwordtext.Text);

        //3.Cookies
        //Response.Redirect("Page1.aspx");
    }
}