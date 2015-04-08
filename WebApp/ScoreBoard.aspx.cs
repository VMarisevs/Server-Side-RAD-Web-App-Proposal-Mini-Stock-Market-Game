using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ScoreBoard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void gvwScoreBoard_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        //gvwScoreBoard.DataBind();
        //gvwUpdatePanel.Update();
    }
    protected void btnRefresh_Disposed(object sender, EventArgs e)
    {
        //gvwScoreBoard.DataBind();
        //gvwUpdatePanel.Update();
    }
    protected void btnRefresh_Init(object sender, EventArgs e)
    {
        //gvwScoreBoard.DataBind();
        //gvwUpdatePanel.Update();
    }
    protected void btnRefresh_Load(object sender, EventArgs e)
    {
        //gvwScoreBoard.DataBind();
        //gvwUpdatePanel.Update();
    }
    protected void btnRefresh_PreRender(object sender, EventArgs e)
    {
        //gvwScoreBoard.DataBind();
        //gvwUpdatePanel.Update();
    }
    protected void btnRefresh_Unload(object sender, EventArgs e)
    {

    }
    protected void btnRefresh_Command(object sender, CommandEventArgs e)
    {

    }
    protected void btnRefresh_DataBinding(object sender, EventArgs e)
    {

    }
    protected void gvwScoreBoard_Load(object sender, EventArgs e)
    {
        gvwScoreBoard.DataBind();
        gvwUpdatePanel.Update();
    }
}