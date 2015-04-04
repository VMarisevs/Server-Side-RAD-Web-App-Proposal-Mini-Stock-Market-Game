using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Authenticated_beg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.User.Identity.IsAuthenticated)
        {
            //Label labelControl = Master.FindControl("lblUserId") as Label;
           // lblBeg.Text = labelControl.Text;

            lblBeg.Text = Session["userId"].ToString();
        }

    }
    protected void imgButBeg_Click(object sender, ImageClickEventArgs e)
    {
        dsBeg.Update();
    }
}