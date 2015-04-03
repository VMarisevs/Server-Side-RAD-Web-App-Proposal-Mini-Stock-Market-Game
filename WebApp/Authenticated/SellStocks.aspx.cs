using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
        user = UserDB.GetUser(UserId);
        company = CompanyDB.GetCompanyShares(companyId);
        userShares = SharesDB.GetUserShares(UserId, companyId);

        if (userShares - ammount > 0)
        {
            user.cash += company.sharePrice * ammount;
            company.shares += ammount;
            userShares -= ammount;

            SharesDB.UpdateUserShares(UserId, companyId, userShares);
            SharesDB.UpdateCash(UserId, user.cash);
            CompanyDB.UpdateCompanyShares(companyId, company.shares);
            dsUserStocks.SelectParameters["UserId"].DefaultValue = MySession.Current.UserId;
            gvwUserStocks.DataBind();
        }
        else
        {


        }
    }

    protected void gvwUserStocks_PreRender(object sender, EventArgs e)
    {
        dsUserStocks.SelectParameters["UserId"].DefaultValue = MySession.Current.UserId;
        gvwUserStocks.DataBind();
    }
    protected void btnSell_Click(object sender, EventArgs e)
    {
        int RowId = ((GridViewRow)((Button)sender).Parent.Parent).RowIndex;
        int CompanyId = (int)gvwUserStocks.DataKeys[RowId].Value;
        Sell(1, CompanyId);
    }
}