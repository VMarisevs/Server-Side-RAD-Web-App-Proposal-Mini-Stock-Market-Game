using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Guest_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void cuwCreateUserAccount_CreatedUser(object sender, EventArgs e)
    {
        //// assigning the role for created user, and by default it will be user
        //// administrators can be added through ASP.NET configuration page
        //CreateUserWizard cuw = (CreateUserWizard)sender;
        //string RoleToJoin = "User";
        //if (!Roles.IsUserInRole(cuw.UserName, RoleToJoin))
        //{
        //    Roles.AddUserToRole(cuw.UserName, RoleToJoin);
        //}
    }
}