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
    protected void gvwUserShares_SelectedIndexChanged(object sender, EventArgs e)
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
    protected void gvwUserShares_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
}