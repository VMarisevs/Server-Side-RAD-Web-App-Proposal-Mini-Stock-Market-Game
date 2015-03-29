using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Authorised_AddStocks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void dvwCompanies_ItemUpdated1(object sender, DetailsViewUpdatedEventArgs e)
    {

        if (e.Exception != null)
        {
            lblError.Text = "A database error has occurred.<br /><br />" +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else if (e.AffectedRows == 0)
            lblError.Text = "Another user may have updated that product."
                + "<br />Please try again.";
        else
            gvwCompanies.DataBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {

    }


}