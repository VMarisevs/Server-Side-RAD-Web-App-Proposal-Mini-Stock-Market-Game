﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    public string UserId
    {
        get
        {
            return lblUserId.Text;
        }
        set
        {
            lblUserId.Text = value;
        }
    }
    
    public string userId, email;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
        
        if (HttpContext.Current.User.Identity.IsAuthenticated)
        {
            txtBalloon.Visible = true;
            // action for authenticated users.
            try
            {
                userId = MySession.Current.UserId;
                lblUserId.Text = userId;


                email = MySession.Current.Email;
                txtBalloon.Text = email;

            }
            catch
            {
                lblUserId.Text = "";
            }
        }

        else
        {
            txtBalloon.Visible = false;
            // action for non-authenticated users.
            userId = "";
            lblUserId.Text = "";

        } 


    }
    protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
    {
        userId = "";
        lblUserId.Text = "";
        //MySession.Current.UserId = "";

        // need to abandon the session in order to remove use data (MySession) from cache
        // without this, only one users data (1st to log in) will be shown, until the cache expires (could be weeks)
        Session.Abandon();
    }
    protected void LoginStatus1_LoggedOut(object sender, EventArgs e)
    {
        userId = "";
        lblUserId.Text = "";
        //MySession.Current.UserId = "";
        Session.Abandon();
    }
}
