<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
        Application["appHitCount"] = 0;
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    {
        // need email set up on server to use this page
        // Code that runs when an unhandled error occurs
        //Exception ex = Server.GetLastError().InnerException;
        //Session["Exception"] = ex;
        //Response.Redirect("~/Errors/ErrorPage.aspx");
    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started
        // using MySession class for session counter instead of this file
        Session["seshHitCount"] = 0;
        //Session["userId"];
    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.
        //Session["userId"] = null;
    }
       
</script>
