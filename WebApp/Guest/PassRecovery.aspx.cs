﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Guest_PassRecovery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // makes sure this page is not cached (solves the "back button problem")
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
        Response.Cache.SetNoStore();
        Response.AppendHeader("Pragma", "no-cache");
        // this technique works for most browsers to clear the cache (that way the page must be requested form the server again)

        // The next technique is more fool proof and uses time stamps (or random numbers)
        if (IsExpired())
            Response.Redirect("~/Errors/Expired.aspx");
        else
            this.SaveTimeStamps();

        //if (!IsPostBack) { 
        //// execute more code
        //}
    }

    private bool IsExpired()
    {
        if (Session["Cart_TimeStamp"] == null)
            return false;
        else if (ViewState["TimeStamp"] == null)
            return false;
        else if (ViewState["TimeStamp"].ToString() == Session["Cart_TimeStamp"].ToString())
            return false;
        else
            return true;
    }

    private void SaveTimeStamps()
    {
        DateTime dtm = DateTime.Now;

        // this view
        ViewState.Add("TimeStamp", dtm);
        // this session
        Session.Add("Cart_TimeStamp", dtm);
    }
}