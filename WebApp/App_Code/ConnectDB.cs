using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

/// <summary>
/// Summary description for ConnectDB
/// </summary>
public class ConnectDB
{
    public static string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["GameConnectionString"].ConnectionString;
    }
}