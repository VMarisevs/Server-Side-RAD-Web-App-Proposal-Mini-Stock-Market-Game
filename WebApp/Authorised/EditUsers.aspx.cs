using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Authorised_EditUsers : System.Web.UI.Page
{
    static bool isAdmin;
    static bool isApproved;
    Guid adminRoleId;
    Guid userRoleId;


    protected void Page_Load(object sender, EventArgs e)
    {
        adminRoleId = RoleDB.GetRoleId("Administrator");

        userRoleId = RoleDB.GetRoleId("User");

       
    }


    protected void gvwUsers_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvwEditStocks.Visible = false;
        rBtnAdmin.Visible = true;
        rBtnUser.Visible = true;
        fvwUser.Visible = true;
        chkApproval.Visible = true;
        List<Role> listRole = new List<Role>();

        listRole = RoleDB.GetUserRoles((Guid)gvwUsers.SelectedDataKey.Value);
        isApproved = MembershipDB.GetRoleId((Guid)gvwUsers.SelectedDataKey.Value);

        chkApproval.Checked = isApproved;

        foreach (Role role in listRole)
        {
            if (role.id == adminRoleId)
            {
                rBtnAdmin.Checked = true;
                rBtnUser.Checked = false;
                isAdmin = true;
                break;
            }
            if (role.id == userRoleId)
            {
                rBtnUser.Checked = true;
                rBtnAdmin.Checked = false;
                isAdmin = false;
            }
        }

        rBtnAdmin.Enabled = false;
        rBtnUser.Enabled = false;
        chkApproval.Enabled = false;
    }


    protected void UpdateButton_Click(object sender, EventArgs e)
    {
        TextBox txtName = (TextBox)fvwUser.FindControl("txtName");
        Label lblLoweredName = (Label)fvwUser.FindControl("lblNameLower");

        lblLoweredName.Text = txtName.Text.ToLower();

        rBtnAdmin.Enabled = false;
        rBtnUser.Enabled = false;
        chkApproval.Enabled = false;

    }

    protected void btnCancelUpdate_Click(object sender, EventArgs e)
    {
        rBtnAdmin.Enabled = false;
        rBtnUser.Enabled = false;
        chkApproval.Enabled = false;
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        gvwEditStocks.Visible = false;
        rBtnAdmin.Enabled = true;
        rBtnUser.Enabled = true;
        chkApproval.Enabled = true;
    }

    protected void dsUser_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        Guid userId = (Guid)gvwUsers.SelectedDataKey.Value;
        Label lblUserErrorMessage = (Label)fvwUser.FindControl("lblUserErrorMessage");

        if (e.Exception != null)
        {
            lblUserErrorMessage.Text = "A database error has occurred.<br /><br />" +
                e.Exception.Message;
            if (e.Exception.InnerException != null)
                lblUserErrorMessage.Text += "<br />Message: "
                    + e.Exception.InnerException.Message;
            e.ExceptionHandled = true;
            return;
        }
        else if (e.AffectedRows == 0)
        {
            lblUserErrorMessage.Text = "Another user may have edited this user"
                + "<br />Please try again.";
            return;
        }

        //makes sure the user isn't given a role he allready has
        if (rBtnAdmin.Checked != isAdmin)
        {
            try
            {
                
                RoleDB.DeleteUserRole(userId, adminRoleId);
                RoleDB.DeleteUserRole(userId, userRoleId);
            }
            catch (SqlException sqlEx)
            {
                lblRoleErrorMessage.Text += "A database error has occurred.<br /><br />" +
                sqlEx.Message;
            }

            try
            {
                if (rBtnAdmin.Checked)
                {
                    RoleDB.InsertUserRole(userId, adminRoleId);
                }
                else
                {
                    RoleDB.InsertUserRole(userId, userRoleId);
                }
            }
            catch (SqlException sqlEx)
            {
                lblRoleErrorMessage.Text += "A database error has occurred.<br /><br />" +
                sqlEx.Message;
            }

        }

        if (chkApproval.Checked != isApproved)
        {
            try
            {
                MembershipDB.updateUserApproval(userId, chkApproval.Checked);
            }
            catch (SqlException sqlEx)
            {
                lblRoleErrorMessage.Text += "A database error has occurred.<br /><br />" +
                sqlEx.Message;
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
            try
            {
                SharesDB.DeleteUserShares((Guid)e.InputParameters["UserId"], (int)e.InputParameters["CompanyId"]);
            }
            catch (SqlException sqlEx)
            {
                lblStockErrorMessage.Text += "A database error has occurred.<br /><br />" +
                sqlEx.Message;
            }
            e.Cancel = true;
        }
    }


    protected void gvwEditStocks_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblStockErrorMessage.Text = "A database error has occurred.<br /><br />" +
                e.Exception.Message;
            if (e.Exception.InnerException != null)
                lblStockErrorMessage.Text += "<br />Message: "
                    + e.Exception.InnerException.Message;
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else if (e.AffectedRows == 0)
            lblStockErrorMessage.Text = "Another user may have updated that category."
                + "<br />Please try again.";
    }
}