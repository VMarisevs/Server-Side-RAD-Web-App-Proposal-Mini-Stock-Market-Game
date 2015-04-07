using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Footer_Feedback : System.Web.UI.Page
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

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        if (ValidateForm())
        {
            // creating new instance and adding values
            Feedback feedback = new Feedback();

            feedback.LearnAboutWebsiteID = ddlLearnAbout.SelectedValue;
            feedback.AccessMediumID = lstbAccessMedium.SelectedValue;
            feedback.ResonID = rbtnlstReasonVisiting.SelectedValue;
            feedback.Experience = txtExperience.Text;

            // for single check box the boolean value is represented in 1 = true 0 = false as int in database and string in application
            if (chkbxComeBack.Checked)
            {
                feedback.WouldYouComeBackInt = "1";
            }
            else
            {
                feedback.WouldYouComeBackInt = "0";
            }

            // this is a list of strings that will be held in separate table to make many to many relationship
            feedback.Devices = new List<string>();
            foreach (ListItem selectedDevice in cblstWebsiteAccess.Items)
            {
                if (selectedDevice.Selected)
                {
                    feedback.Devices.Add(selectedDevice.Value);
                }
            }

            // using connection to connect to a database
            FeedbackDB.InsertFeedback(feedback);

            Server.Transfer("FeedbackSuccessful.aspx", true);
        }

    }

    private bool ValidateForm()
    {
        if (ddlLearnAbout.SelectedValue == "" ||
            lstbAccessMedium.SelectedValue == "" ||
            rbtnlstReasonVisiting.SelectedValue == "")
        {
            return false;
        }

        return true;
    }
}