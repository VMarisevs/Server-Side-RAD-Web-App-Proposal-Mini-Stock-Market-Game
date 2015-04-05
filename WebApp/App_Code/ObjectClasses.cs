using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{
    public Guid id { get; set; }

    public string name { get; set; }

    public string loweredName { get; set; }

    public decimal cash { get; set; }

    public DateTime lastActive { get; set; }   
}


public class Comapny
{
    public int shares { get; set; }

    public string name { get; set; }

    public decimal sharePrice { get; set; }

}

public class Role
{
    public Guid id { get; set; }

    public string RoleName { get; set; }
}