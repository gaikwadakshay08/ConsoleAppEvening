using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MultiView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnnext_Click(object sender, EventArgs e)
    {
        mv.ActiveViewIndex = 1;

    }

    protected void btnprv_Click(object sender, EventArgs e)
    {
        mv.ActiveViewIndex = 0;
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        Response.Write(textempid.Text + " " + textname.Text + " " + textdepartment.Text + " " + TextBox1.Text + " " +
            TextBox2.Text + " " + chk.Checked.ToString());
    }
}