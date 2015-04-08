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
        // makes sure this page is not cached (solves the "back button problem")
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
        Response.Cache.SetNoStore();
        Response.AppendHeader("Pragma", "no-cache");
        // this technique works for most browsers to clear the cache (that way the page must be requested form the server again)

         //The next technique is more fool proof and uses time stamps (or random numbers)
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

    protected void dsBuySell_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["UserId"] = MySession.Current.UserId;
        e.InputParameters["companyId"] = gwBuyStocks.SelectedDataKey.Value;

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //lblConfirmation.Text = "buying...";

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

            lblConfirmation.Text = "The stock could not be purchased";
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

                   // lblConfirmation.Text = "";
                    return;
                }

                gwBuyStocks.DataBind();
                lblErrorMessage.Text = "";
                lblConfirmation.Text = "Share bought successfully";
            }
            //else inform the user of the lack of available shares
            else
            {
                lblConfirmation.Text = "";
                lblErrorMessage.Text = "Sorry no shares of that company are currently available for purchase";
            }
        }
        //else call the user poor
        else
        {
            lblErrorMessage.Text = "You are too poor";
            lblConfirmation.Text = "";
        }
    }


    protected void dsStocks_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        ////confirmation
        //if (e.Exception != null)
        //{
        //    lblConfirmation.Text = "Stock not purchased";
        //    e.ExceptionHandled = true;
        //}
        //else if (e.AffectedRows == 0)
        //{
        //    lblConfirmation.Text = "Stock not purchased";
        //}

        //lblConfirmation.Text = "Stock purchased";
    }
    protected void lblConfirmation_Load(object sender, EventArgs e)
    {
        //dialogUpdatePanel.Update();
        //lblConfirmation.Text = "";
        //lblErrorMessage.Text = "";

        //gwBuyStocks.DataBind();
        //gvwUpdatePanel.Update();
    }
    protected void gwBuyStocks_Load(object sender, EventArgs e)
    {
        //gwBuyStocks.DataBind();
        gvwUpdatePanel.Update();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //lblConfirmation.Text = "buying...";

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

    //protected void btnRefresh_Click(object sender, EventArgs e)
    //{
    //    //gvwScoreBoard.DataBind();
    //    //gvwUpdatePanel.Update();
    //    //gwBuyStocks.DataBind();
    //}

    protected void gwBuyStocks_PreRender(object sender, EventArgs e)
    {
        gwBuyStocks.DataBind();
    }


    protected void frmVwInfo_Load(object sender, EventArgs e)
    {
         frmVwInfo.DataBind();
         //gwBuyStocks.DataBind();

        //stocksUpdatePanel.Update();
        chartUpdatePanel.Update();
    }
}