﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Authenticated_beg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void imgButBeg_Click(object sender, ImageClickEventArgs e)
    {
        dsBeg.UpdateParameters["UserId"].DefaultValue = MySession.Current.UserId;
        dsBeg.Update();
    }
}