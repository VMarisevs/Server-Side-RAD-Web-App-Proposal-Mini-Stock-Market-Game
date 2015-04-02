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
        //fvwUserDetaileddd.DataBind();
    }

    private void getNetWorth()
    {

    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        fvwUserDetaileddd.ChangeMode(FormViewMode.Edit);
        rBtnAdmin.Enabled = true;
        rBtnUser.Enabled = true;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        fvwUserDetaileddd.ChangeMode(FormViewMode.ReadOnly);
        rBtnAdmin.Enabled = false;
        rBtnUser.Enabled = false;
    }

  
    protected void dsUserShares_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        dsUser.Select();
        gvwUsers.DataBind();

    }


    protected void gvwUsers_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<Role> listRole = new List<Role>();

        listRole = RoleDB.GetUserRoles((Guid)gvwUsers.SelectedDataKey.Value);
     


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

        rBtnAdmin.Visible = true;
        rBtnUser.Visible = true;


    }





    protected void btnEditUser_Click(object sender, EventArgs e)
    {
        fvwUserDetaileddd.ChangeMode(FormViewMode.Edit);
        rBtnAdmin.Enabled = true;
        rBtnUser.Enabled = true;
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        Guid UserId = (Guid)gvwUsers.SelectedDataKey.Value;

        CheckBox cbViewAdmin = fvwUserDetaileddd.FindControl("cbEditAdmin") as CheckBox;

        CheckBox cbViewUser = fvwUserDetaileddd.FindControl("cbEditAdmin") as CheckBox;

        if (rBtnAdmin.Checked && !isAdmin)
        {
            RoleDB.InsertRole(UserId, AdminRoleId);

            RoleDB.DeleteRole(UserId, UserRoleId);
        }

        if (rBtnUser.Checked && isAdmin)
        {

            RoleDB.InsertRole(UserId, UserRoleId);

            RoleDB.DeleteRole(UserId, AdminRoleId);
        }
        fvwUserDetaileddd.ChangeMode(FormViewMode.ReadOnly);
        fvwUserDetaileddd.DataBind();
        gvwUsers.DataBind();
        rBtnAdmin.Enabled = false;
        rBtnUser.Enabled = false;
    }
}