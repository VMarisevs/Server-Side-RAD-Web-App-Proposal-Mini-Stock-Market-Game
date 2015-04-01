using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{
    public string UserId { get; set; }

    public string UserName { get; set; }

    public string UserRole { get; set; }

    public string UserCash { get; set; }

    public DateTime UserLastActivity { get; set; }   
}

public class Role
{
    public string RoleId { get; set; }

    public string RoleName { get; set; }
}