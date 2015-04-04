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
        List<Role> listRole = new List<Role>();

        listRole = RoleDB.GetUserRoles((Guid)gvwUsers.SelectedDataKey.Value);
     
        foreach (Role role in listRole)
        {
            if (role.RoleName.Equals("Administrator"))
            {
                rBtnAdmin.Checked = true;
                isAdmin = true;
                break;
            }
            if (role.RoleName.Equals("User"))
            {
                rBtnUser.Checked = true;
                isAdmin = false;
            }
        }
        fvwUser.Visible = true;
        rBtnAdmin.Visible = true;
        rBtnUser.Visible = true;

    }


    protected void UpdateButton_Click(object sender, EventArgs e)
    {
         TextBox txtName = (TextBox)fvwUser.FindControl("txtName");
         Label lblLoweredName = (Label)fvwUser.FindControl("lblNameLower");

         lblLoweredName.Text = txtName.Text.ToLower();


    
    }

    protected void btnCancelUpdate_Click(object sender, EventArgs e)
    {
        rBtnAdmin.Enabled = false;
        rBtnUser.Enabled = false;
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        rBtnAdmin.Enabled = true;
        rBtnUser.Enabled = true;
    }

    protected void dsUser_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        Guid UserId = (Guid)gvwUsers.SelectedDataKey.Value;

        if (rBtnAdmin.Checked && !isAdmin)
        {
            RoleDB.InsertUserRole(UserId, AdminRoleId);

            RoleDB.DeleteUserRole(UserId, UserRoleId);
        }

        if (rBtnUser.Checked && isAdmin)
        {

            RoleDB.InsertUserRole(UserId, UserRoleId);

            RoleDB.DeleteUserRole(UserId, AdminRoleId);
        }

        rBtnAdmin.Enabled = false;
        rBtnUser.Enabled = false;
    }

}