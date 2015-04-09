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
        if (Application["appHitCount"] == null){
            Application.Lock();
            Application["appHitCount"] = 1;
            Application.UnLock();
        }

        lblAppHitCount.Text = "Total Hitcount: " + Application["appHitCount"].ToString();

        // session counter displayed
        //seshHitCount = MySession.Current.HitCount;
        if (Session["seshHitCount"] == null)
        {
            Session["seshHitCount"] = 1;
            
        }
        else
        {
            // Session hitcount increment
            Session["seshHitCount"] = Convert.ToInt32(Session["seshHitCount"]) + 1;
            //MySession.Current.HitCount++;
        }

        lblSeshHitCount.Text = "Session Hit Count: " + Session["seshHitCount"].ToString();       //seshHitCount.ToString() + "  ";
    }
    protected void gwActivity_Load(object sender, EventArgs e)
    {
        gwActivity.DataBind();
        activityUpdatePanel.Update();
    }
}