using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Footer_FeedbackSuccessful : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
        //Response.Cache.SetNoStore();
        //Response.AppendHeader("Pragma", "no-cache");

        //if (IsExpired())
        //    Response.Redirect("~/Errors/Expired.aspx");
        //else
        //    this.SaveTimeStamps();
    }


    //private bool IsExpired()
    //{
    //    if (Session["Cart_TimeStamp"] == null)
    //        return false;
    //    else if (ViewState["TimeStamp"] == null)
    //        return false;
    //    else if (ViewState["TimeStamp"].ToString() == Session["Cart_TimeStamp"].ToString())
    //        return false;
    //    else
    //        return true;
    //}

    //private void SaveTimeStamps()
    //{
    //    DateTime dtm = DateTime.Now;

    //    // this view
    //    ViewState.Add("TimeStamp", dtm);
    //    // this session
    //    Session.Add("Cart_TimeStamp", dtm);
    //}
}