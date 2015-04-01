using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

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


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        dsBuySell.Select();
    }


    protected void gwBuyStocks_SelectedIndexChanged(object sender, EventArgs e)
    {
        dsBuySell.Select();
    }



    protected void dsBuySell_Selected(object sender, ObjectDataSourceStatusEventArgs e)
    {
        BuySell stock = new BuySell();

        stock = (BuySell)e.ReturnValue;

        stock.userShares++;
        stock.companyShares--;
        stock.cash -= stock.price;

         
  
        SharesDB.UpdateCash(MySession.Current.UserId,stock.cash);

        SharesDB.UpdateUserShares(MySession.Current.UserId, (int)gwBuyStocks.SelectedDataKey.Value, stock.userShares);

        if (stock.companyShares != 0)
        {
            SharesDB.UpdateCompanyShares((int)gwBuyStocks.SelectedDataKey.Value, stock.companyShares);
        }
       // dsStocks.Select();

        
        gwBuyStocks.DataBind();
    }
}