using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Feedback
/// </summary>
public class Feedback
{
    public Guid id { get; set; }

    public string LearnAboutWebsiteID { get; set; }

    public string AccessMediumID { get; set; }

    public string ResonID { get; set; }

    public string Experience { get; set; }

    public string WouldYouComeBackInt { get; set; } // 0 or 1    

    public List<String> Devices { get; set; }
}