using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Authorised_EditUsers : System.Web.UI.Page
{


    bool adminChecked;

    bool userChecked;

    string roleId, UserId;

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

    protected void dsRoles_Selected(object sender, ObjectDataSourceStatusEventArgs e)
    {
        List<Role> listRole = new List<Role>();

        listRole = (List<Role>)e.ReturnValue;

        foreach (Role role in listRole)
        {
            if (role.RoleName.Equals("Administrator"))
            {
                CheckBox cbViewAdmin = fvwUserShares.FindControl("cbViewAdmin") as CheckBox;
                if (cbViewAdmin != null)
                    cbViewAdmin.Checked = true;

                CheckBox cbEditAdmin = fvwUserShares.FindControl("cbEditAdmin") as CheckBox;
                if (cbEditAdmin != null)
                    cbEditAdmin.Checked = true;
                adminChecked = true;

            }
            else if (role.RoleName.Equals("User"))
            {
                CheckBox cbViewUser = fvwUserShares.FindControl("cbViewUser") as CheckBox;
                if (cbViewUser != null)
                    cbViewUser.Checked = true;

                CheckBox cbEditUser = fvwUserShares.FindControl("cbEditUser") as CheckBox;
                if (cbEditUser != null)
                    cbEditUser.Checked = true;
                userChecked = true;
            }


        }

    }

    protected void dsUserShares_Selected(object sender, ObjectDataSourceStatusEventArgs e)
    {
        dsRoles.Select();
    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        CheckBox cbViewAdmin = fvwUserShares.FindControl("cbEditAdmin") as CheckBox;

        CheckBox cbViewUser = fvwUserShares.FindControl("cbEditAdmin") as CheckBox;

        if (cbViewAdmin.Checked != adminChecked)
        {
            if (cbViewAdmin.Checked)
            {
                roleId = "014f909b-9864-45e1-9e74-99ea358b59d7";
                dsRoles.Insert();
            }
        }

        if (cbViewUser.Checked != userChecked)
        {
            if (cbViewAdmin.Checked)
            {
                roleId = "de7ea240-f93e-4a19-84d8-0466c4dcc289";
                dsRoles.Insert();
            }
        }

    }
    protected void dsRoles_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {

    }
    protected void dsRoles_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["UserId"] = "f3433288-7fc5-4012-a02c-f8c86b9340d8";
        e.InputParameters["RoleId"] = roleId;
    }
}