using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Page1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {   //1session
        //if (!IsPostBack)
        //{
        //    usertext.Text = Session["userid"].ToString();
        //    passwordtext.Text = Session["userpass"].ToString();
        //}
        //2.query string


        //3cookie
        /* if (!IsPostBack)
         {
             if (Request.Cookies["mydata"] != null)
             {
                 usertext.Text = Request.Cookies["mydata"]["userid"].ToString();
                 passwordtext.Text = Request.Cookies["mydata"]["userpass"].ToString();
             }
         }*/

    }

    protected void btnnextpage_Click(object sender, EventArgs e)
    {    //1.session
        // Session["userid"] = usertext.Text; //create session
        //  Session["userpass"] = passwordtext.Text;
        //Response.Redirect("Page2.aspx");
        // 2.query string
        // Response.Redirect("Page2.aspx?uid="+usertext.Text+"&pass="+ passwordtext.Text);//1st methode
       // var base64 = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(usertext.Text +
        //"#" + passwordtext.Text)); //2nd methode
         //Response.Redirect("Page2.aspx?"+base64);//2nd methode
        //3.cookie 1 page 2nd page data
        //HttpCookie mydata = new HttpCookie("mydata"); //Cookie object
        //mydata["userid"]=usertext.Text;
        //mydata["userpass"]=passwordtext.Text;//valu exchange
        //Response.Cookies.Add(mydata);
        //Response.Redirect("Page2.aspx");
    }
}