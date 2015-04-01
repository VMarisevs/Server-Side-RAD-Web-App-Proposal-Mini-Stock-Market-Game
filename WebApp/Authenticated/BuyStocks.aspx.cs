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
        // Gets a reference to a Label control that not in 
        // a ContentPlaceHolder


        //Label mpLabel = (Label)Master.FindControl("lblUserId");

        //if (mpLabel != null)
        //{
        //    lblUserId.Text = "Master page label = " + MySession.Current.UserId; //Master.userId;
        //}

        try
        {
            DataView dvSql = (DataView)dsCompany.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView drvSql in dvSql)
            {
                lblUserId.Text = drvSql["shareAmount"].ToString();
            }
        }
        catch { }
    }
    
    // Buy button
    protected void Button1_Click(object sender, EventArgs e)
    {
       // dsCompany.Select();
       // DataSourceSelectArguments test 

        dsCompany.Update();
    }

    protected void gwBuyStocks_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void dsCompany_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        //lblUserId.Text = e.Command.Parameters.ToString();

        
    }


    protected void dsCompany_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        e.Command.Parameters["Id"].Value = 10003;
    }
}