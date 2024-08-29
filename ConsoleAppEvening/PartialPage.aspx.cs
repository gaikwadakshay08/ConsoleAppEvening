using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PartialPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void text_pnl1_1_TextChanged(object sender, EventArgs e)
    {
        text_pnl1_2.Text=text_pnl1_1.Text; 
        text_pnl2_2.Text=text_pnl1_1.Text;
    }

    protected void btnpnl1_1_Click(object sender, EventArgs e)
    {
        lbl_pnl_1.Text = "panel one label updated";
        lbl_pnl_2.Text = "panel two label updated";
    }

    protected void btnpnl2_1_Click(object sender, EventArgs e)
    {
        lbl_pnl_1.Text = "panel one label updated";
        lbl_pnl_2.Text = "panel two label updated";
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        Response.Write(text_pnl1_1.Text + " " + text_pnl1_2.Text + " " + text_pnl2_1.Text + " " + text_pnl2_2.Text);

    }
}