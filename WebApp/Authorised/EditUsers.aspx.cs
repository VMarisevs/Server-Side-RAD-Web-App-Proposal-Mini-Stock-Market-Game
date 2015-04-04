using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Authorised_EditUsers : System.Web.UI.Page
{


    static bool isAdmin;


    Guid AdminRoleId = Guid.Parse("014f909b-9864-45e1-9e74-99ea358b59d7");

    Guid UserRoleId = Guid.Parse("de7ea240-f93e-4a19-84d8-0466c4dcc289");

    protected void Page_Load(object sender, EventArgs e)
    {
      
    }


    protected void gvwUsers_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvwEditStocks.Visible = false;
        rBtnAdmin.Visible = true;
        rBtnUser.Visible = true;
        fvwUser.Visible = true;
        List<Role> listRole = new List<Role>();

        listRole = RoleDB.GetUserRoles((Guid)gvwUsers.SelectedDataKey.Value);

        foreach (Role role in listRole)
        {
            if (role.RoleName.Equals("Administrator"))
            {
                rBtnAdmin.Checked = true;
                rBtnUser.Checked = false;
                isAdmin = true;
                break;
            }
            if (role.RoleName.Equals("User"))
            {
                rBtnUser.Checked = true;
                rBtnAdmin.Checked = false;
                isAdmin = false;
            }
        }
     
        rBtnAdmin.Enabled = false;
        rBtnUser.Enabled = false;
    }


    protected void UpdateButton_Click(object sender, EventArgs e)
    {
         TextBox txtName = (TextBox)fvwUser.FindControl("txtName");
         Label lblLoweredName = (Label)fvwUser.FindControl("lblNameLower");

         lblLoweredName.Text = txtName.Text.ToLower();

         rBtnAdmin.Enabled = false;
         rBtnUser.Enabled = false;
   
    }

    protected void btnCancelUpdate_Click(object sender, EventArgs e)
    {
        rBtnAdmin.Enabled = false;
        rBtnUser.Enabled = false;
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        gvwEditStocks.Visible = false;
        rBtnAdmin.Enabled = true;
        rBtnUser.Enabled = true;
    }

    protected void dsUser_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        Guid UserId = (Guid)gvwUsers.SelectedDataKey.Value;

        if (rBtnAdmin.Checked != isAdmin)
        {
            RoleDB.DeleteUserRole(UserId, AdminRoleId);
            RoleDB.DeleteUserRole(UserId, UserRoleId);

            if (rBtnAdmin.Checked)
            {
                RoleDB.InsertUserRole(UserId, AdminRoleId);
            }
            else
            {
                RoleDB.InsertUserRole(UserId, UserRoleId);
            }
        }

    }

    protected void btnEditUserStocks_Click(object sender, EventArgs e)
    {
        gvwEditStocks.Visible = true;
    }


    protected void dsUserStocks_Updating(object sender, ObjectDataSourceMethodEventArgs e)
    {
        if (Convert.ToInt32(e.InputParameters["Shares"]) <= 0)
        {
            SharesDB.DeleteUserShares((Guid)e.InputParameters["UserId"], (int)e.InputParameters["CompanyId"]);
        }
    }
}