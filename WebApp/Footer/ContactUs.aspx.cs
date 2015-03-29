using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Footer_ContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("https://www.google.ie/maps/place/GMIT/@53.278671,-9.010464,17z/data=!3m1!4b1!4m2!3m1!1s0x485b9132cb2e133f:0x5a81260c20e02143");
    }
}