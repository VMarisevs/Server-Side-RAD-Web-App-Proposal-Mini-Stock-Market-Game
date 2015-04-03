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