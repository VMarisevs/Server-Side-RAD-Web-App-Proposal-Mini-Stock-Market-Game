using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GravatarControl;

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

    public string Email
    {
        get
        {
            return this.email;
        }
        set
        {
            this.email = value;
        }
    }

    //public int HitCount
    //{
    //    get
    //    {
    //        return this.hitCount;
    //    }
    //    set
    //    {
    //        this.hitCount = value;
    //    }
    //}

    public string userId, email;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        // Application (total) hitcount increment (with concurrency)
        Application.Lock();
        Application["appHitCount"] = (int)Application["appHitCount"] + 1;
        Application.UnLock();

        if (Session["seshHitCount"] == null)
        {
            Session["seshHitCount"] = 1;
        } else
        {
            // Session hitcount increment
            Session["seshHitCount"] = Convert.ToInt32(Session["seshHitCount"]) + 1;
            //MySession.Current.HitCount++;
        }

        // default page shows these counters


        // this teaches about FindControl: http://www.asp.net/web-forms/overview/older-versions-getting-started/master-pages/control-id-naming-in-content-pages-cs (My savior :))
        LoginView loginControl = FindControl("LoginView1") as LoginView;
        Gravatar gravatarControl = loginControl.FindControl("UserGravatar") as Gravatar;

        try
        {
            gravatarControl.Email = Email;
        }
        catch
        {
            //gravatarControl.Email = "";
        }

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
    protected void dsCash_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {


    }
    protected void dsCash_Load(object sender, EventArgs e)
    {
        //Gravatar myGrav = (Gravatar)this.Master.FindControl("UserGravatar");
        //myGrav.Email = "rolo45@gmail.com";  

        //Email = "WOW";
        //TextBox myEmail = (TextBox)this.Master.FindControl("lblEmail");
        //myEmail.Text = "Wow";


        //Table myTable = (Table)this.Master.FindControl("myTable");
        //Gravatar myGrav = (Gravatar)myTable.FindControl("TestGravatar");

        //myGrav.Email = "rolo45@gmail.com";




        //Table tblForm = this.Master.FindControl("Container").FindControl("myTable") as Table; 

       
    }
    
    protected void btnTest_Click(object sender, EventArgs e)
    {
        // TEST FOR FINDCONTROL

        // must be a control (div/table are not controls)   

        //LoginView loginControl = FindControl("LoginView1") as LoginView;
        //loginControl.Visible = true;

        //Gravatar gravatarControl = loginControl .FindControl("TestGravatar") as Gravatar;
        //gravatarControl.Email = "rolo45@gmail.com";
    }
}
