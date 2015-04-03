using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    public int seshHitCount;

    protected void Page_Load(object sender, EventArgs e)
    {
        // application counter displayed
        lblAppHitCount.Text = "Total Hitcount: " + Application["appHitCount"].ToString();

        // session counter displayed
        //seshHitCount = MySession.Current.HitCount;
        lblSeshHitCount.Text = "Session Hit Count: " + Session["seshHitCount"].ToString();       //seshHitCount.ToString() + "  ";
    }
}