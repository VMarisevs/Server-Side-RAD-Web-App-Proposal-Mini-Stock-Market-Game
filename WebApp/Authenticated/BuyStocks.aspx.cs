using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Authenticated_BuyStocks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }


    protected void dsBuySell_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["UserId"] = MySession.Current.UserId;
        e.InputParameters["companyId"] = gwBuyStocks.SelectedDataKey.Value;

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        int RowId = ((GridViewRow)((Button)sender).Parent.Parent).RowIndex;
        int CompanyId = (int)gwBuyStocks.DataKeys[RowId].Value;
        int ammount = 0;

        if (txtAmmount != null)
        {
            if (!int.TryParse(txtAmmount.Text, out ammount))
            {
                lblErrorMessage.Text = "Must enter a number";
                return;
            }
            else if (ammount < 1)
            {
                lblErrorMessage.Text = "Must enter a number more than zero";
                return;
            }
        }
        Buy(ammount, CompanyId);
    }


    protected void Buy(int ammount, int companyId)
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


        //if the user has enough money 
        if (user.cash - company.sharePrice * ammount >= 0 )
        {
            //if the company has enough shares 
            if (company.shares - ammount >= 0)
            {
                user.cash -= company.sharePrice * ammount;
                company.shares -= ammount;
                try
                {
                    if (userShares > 0)
                    {
                        SharesDB.UpdateUserShares(UserId, companyId, userShares + ammount);
                    }
                    else
                    {
                        SharesDB.InsertUserShares(UserId, companyId, ammount, userShares + ammount);
                    }
                    SharesDB.UpdateCash(UserId, user.cash);
                    CompanyDB.UpdateCompanyShares(companyId, company.shares);
                }
                catch (SqlException sqlEx)
                {
                    lblErrorMessage.Text = "A database error has occurred.<br /><br />" +
                        sqlEx.Message;
                    return;
                }

                gwBuyStocks.DataBind();
                lblErrorMessage.Text = "";
            }
            //else inform the user of the lack of available shares
            else
            {
                lblErrorMessage.Text = "Sorry no shares of that company are currently available for purchase";
            }
        }
        //else call the user poor
        else
        {
            lblErrorMessage.Text = "You are too poor.";
        }
    }


}