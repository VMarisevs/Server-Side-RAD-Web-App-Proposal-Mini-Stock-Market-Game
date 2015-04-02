using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Authorised_EditUsers : System.Web.UI.Page
{


    static bool adminChecked;

    static bool userChecked;

    Guid AdminRoleId = Guid.Parse("014f909b-9864-45e1-9e74-99ea358b59d7");

    Guid UserRoleId = Guid.Parse("de7ea240-f93e-4a19-84d8-0466c4dcc289");

    protected void Page_Load(object sender, EventArgs e)
    {
        fvwUserShares.DataBind();
    }

    private void getNetWorth()
    {

    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        fvwUserShares.ChangeMode(FormViewMode.Edit);
        cbUser.Enabled = true;
        cbAdmin.Enabled = true;
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

    protected void btnCreate_Click(object sender, EventArgs e)
    {
        dsUserShares.Insert();
    }
    protected void btnCreateUser_Click(object sender, EventArgs e)
    {
        fvwUserShares.ChangeMode(FormViewMode.Insert);
    }
    protected void btnCreate_Click1(object sender, EventArgs e)
    {
        dsUserShares.Insert();
    }




    protected void btnUpdate_Click(object sender, EventArgs e)
    {

        Guid UserId = (Guid)gvwUsers.SelectedDataKey.Value;

        CheckBox cbViewAdmin = fvwUserShares.FindControl("cbEditAdmin") as CheckBox;

        CheckBox cbViewUser = fvwUserShares.FindControl("cbEditAdmin") as CheckBox;

        if (cbAdmin.Checked != adminChecked)
        {
            if (cbAdmin.Checked)
            {
                RoleDB.InsertRole(UserId, AdminRoleId);

            }
            else
            {
                RoleDB.DeleteRole(UserId, AdminRoleId);
                adminChecked = false;
            }
        }

        if (cbUser.Checked != userChecked)
        {
            if (cbUser.Checked)
            {
                RoleDB.InsertRole(UserId, UserRoleId);
            }
            else
            {
                RoleDB.DeleteRole(UserId, UserRoleId);          
            }
        }
        fvwUserShares.ChangeMode(FormViewMode.ReadOnly);
    }



    protected void gvwUsers_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<Role> listRole = new List<Role>();

        listRole = RoleDB.GetUserRoles((Guid)gvwUsers.SelectedDataKey.Value);
     


        listRole = RoleDB.GetUserRoles((Guid)gvwUsers.SelectedDataKey.Value);
        adminChecked = false;
        userChecked = false;

        foreach (Role role in listRole)
        {
            if (role.RoleName.Equals("Administrator"))
            {
                adminChecked = true;
            }

            if (role.RoleName.Equals("User"))
            {
                userChecked = true;
            }
        }

        cbAdmin.Checked = adminChecked;

        cbUser.Checked = userChecked;

    }

    protected void cbEditUser_CheckedChanged(object sender, EventArgs e)
    {
        if (userChecked)
            userChecked = false;
        else
            userChecked = true;
    }


    protected void btnCreateUser_Click1(object sender, EventArgs e)
    {
        cbAdmin.Enabled = true;
        cbUser.Enabled = true;
        fvwUserShares.ChangeMode(FormViewMode.Insert);
    }

    protected void dsUserShares_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (cbAdmin.Checked)
        {
            RoleDB.InsertRole(AdminRoleId);
        }
        else
        {
            RoleDB.InsertRole(UserRoleId);
        }
    }
    protected void dsUserShares_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        if (!cbAdmin.Checked && !cbUser.Checked)
        {
            e.Cancel = true;
        }
    }

 
}