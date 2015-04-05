using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Authenticated_SellStocks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Sell(int ammount, int companyId)
    {
        int userShares;
        Guid UserId;
        User user = new User();
        Comapny company = new Comapny();


        UserId = new Guid(MySession.Current.UserId);



        try
        {
            user = UserDB.GetUser(UserId);

            company = CompanyDB.GetCompanyShares(companyId);

            userShares = SharesDB.GetUserShares(UserId, companyId);
        }
        catch (SqlException sqlEx)
        {
            lblErrorMessage.Text = "A database error has occurred.<br /><br />" +
                sqlEx.Message;
            return;
        }


        if (userShares - ammount >= 0)
        {
            user.cash += company.sharePrice * ammount;
            company.shares += ammount;
            userShares -= ammount;

            try
            {
                SharesDB.UpdateCash(UserId, user.cash);

                if (userShares == 0)
                {
                    SharesDB.DeleteUserShares(UserId, companyId);
                }
                else
                {
                    SharesDB.UpdateUserShares(UserId, companyId, userShares);
                }

                CompanyDB.UpdateCompanyShares(companyId, company.shares);
                dsUserStocks.SelectParameters["UserId"].DefaultValue = MySession.Current.UserId;
            }
            catch (SqlException sqlEx)
            {
                lblErrorMessage.Text = "A database error has occurred.<br /><br />" +
                    sqlEx.Message;
                return;
            }

            gvwUserStocks.DataBind();
        }
        else
        {
            lblErrorMessage.Text="You can not sell that many shares";
        }
    }

    protected void gvwUserStocks_PreRender(object sender, EventArgs e)
    {
        dsUserStocks.SelectParameters["UserId"].DefaultValue = MySession.Current.UserId;
        gvwUserStocks.DataBind();
        lblErrorMessage.Text = "";
    }

    protected void btnSell_Click(object sender, EventArgs e)
    {
        int RowId = ((GridViewRow)((Button)sender).Parent.Parent).RowIndex;
        int CompanyId = (int)gvwUserStocks.DataKeys[RowId].Value;
        int ammount = 0;

        if (txtAmmount != null)
        {
            if (!int.TryParse(txtAmmount.Text, out ammount))
            {
                lblErrorMessage.Text = "Must enter a number";
            }
        }

        Sell(ammount, CompanyId);
    }
}