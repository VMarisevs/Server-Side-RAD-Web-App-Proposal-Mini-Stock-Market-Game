using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class Errors_ErrorPage : System.Web.UI.Page
{
    // need email set up on server to use this page
    protected void Page_Load(object sender, EventArgs e)
    {
        //// this page is used by the redirect method
        //if (!IsPostBack)
        //{
        //    Exception ex = (Exception)Session["Exception"];
        //    this.SendEmail(ex);
        //    Session.Remove("Exception");
        //}
    }

    protected void btnReturnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }

    //private void SendEmail(Exception ex)
    //{
    //    string body = "An exception occurred at "
    //                    + DateTime.Now.ToLongTimeString()
    //                    + " on " + DateTime.Now.ToLongDateString()
    //                    + "<br />" + ex.Message;

    //    MailMessage msg = new MailMessage("hi@ronanconnolly.ie", "rolo45@gmail.com");
    //    msg.Subject = "Exception in Stock Street application";
    //    msg.Body = body;
    //    msg.IsBodyHtml = true;
    //    SmtpClient client = new SmtpClient("localhost");
    //    client.Send(msg);

    //}
}