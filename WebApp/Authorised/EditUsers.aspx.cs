using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Authorised_EditUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private void getNetWorth()
    {
        
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        fvwUserShares.ChangeMode(FormViewMode.Edit);
           
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        fvwUserShares.ChangeMode(FormViewMode.ReadOnly);
    }

    protected void dsUserShares_Updating(object sender, ObjectDataSourceMethodEventArgs e)
    {
        DropDownList list = fvwUserShares.FindControl("ddlCompanies") as DropDownList;
        e.InputParameters["companyId"] = list.SelectedValue;
    }
    protected void dsUserShares_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        dsUser.Select();
        gvwUsers.DataBind();
        
    }
}