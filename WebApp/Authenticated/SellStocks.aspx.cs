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
        // makes sure this page is not cached (solves the "back button problem")
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
        Response.Cache.SetNoStore();
        Response.AppendHeader("Pragma", "no-cache");
        // this technique works for most browsers to clear the cache (that way the page must be requested form the server again)

        // The next technique is more fool proof and uses time stamps (or random numbers)
        if (IsExpired())
            Response.Redirect("~/Errors/Expired.aspx");
        else
            this.SaveTimeStamps();

        //if (!IsPostBack) { 
        //// execute more code
        //}
    }

    private bool IsExpired()
    {
        if (Session["Cart_TimeStamp"] == null)
            return false;
        else if (ViewState["TimeStamp"] == null)
            return false;
        else if (ViewState["TimeStamp"].ToString() == Session["Cart_TimeStamp"].ToString())
            return false;
        else
            return true;
    }

    private void SaveTimeStamps()
    {
        DateTime dtm = DateTime.Now;

        // this view
        ViewState.Add("TimeStamp", dtm);
        // this session
        Session.Add("Cart_TimeStamp", dtm);
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
                return;
            }
            else if (ammount < 1)
            {
                lblErrorMessage.Text = "Must enter a number more than zero";
                return;
            }
        }

        Sell(ammount, CompanyId);
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
            lblErrorMessage.Text = "";
            lblConfirmation.Text = "Share sold successfully";
        }
        else
        {
            lblConfirmation.Text = "";
            lblErrorMessage.Text = "You can not sell that many shares";
        }
    }

    protected void gvwUserStocks_PreRender(object sender, EventArgs e)
    {
        dsUserStocks.SelectParameters["UserId"].DefaultValue = MySession.Current.UserId;
        gvwUserStocks.DataBind();
        //lblErrorMessage.Text = "";
    }


    protected void lblConfirmation_Load(object sender, EventArgs e)
    {
        //dialogUpdatePanel.Update();
       // lblConfirmation.Text = "";
       // lblErrorMessage.Text = "";
    }
    protected void gvwUserStocks_Load(object sender, EventArgs e)
    {
        //gvwUserStocks.DataBind();
        gvwUpdatePanel.Update();
    }

    protected void frmVwInfo_Load(object sender, EventArgs e)
    {
        frmVwInfo.DataBind();
        //gwBuyStocks.DataBind();

        //stocksUpdatePanel.Update();
        chartUpdatePanel.Update();
    }
}