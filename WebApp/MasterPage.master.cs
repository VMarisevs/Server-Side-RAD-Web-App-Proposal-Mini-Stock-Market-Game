using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    string userId;

    protected void Page_Load(object sender, EventArgs e)
    {
        

        if (HttpContext.Current.User.Identity.IsAuthenticated)
        {

            // action for authenticated users.
            try
            {
                userId = MySession.Current.UserId;
                lblUserId.Text = userId;

            }
            catch
            {
                lblUserId.Text = "";
            }
        }

        else
        {

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
