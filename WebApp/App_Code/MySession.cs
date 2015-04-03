using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

/// <summary>
/// Summary description for MySession
/// </summary>
public class MySession
{
    public MySession()
    {
        //in case we need to initialize any variable once session started
        UserId = Membership.GetUser().ProviderUserKey.ToString();

        Email = Membership.GetUser().Email.ToString();
    }

    public static MySession Current
    {
        get
        {
            MySession session = (MySession)HttpContext.Current.Session["__MySession__"];
            if (session == null)
            {
                session = new MySession();
                HttpContext.Current.Session["__MySession__"] = session;
            }
            return session;
        }
    }

    public string UserId { get; set; }
    public string Email { get; set; }
    public int HitCount { get; set; }
    /**
     *  we can add extra parameters in here, like
     *  
     *  public string Property1 { get; set; }
     *  public DateTime MyDate { get; set; }    
     *  public int LoginId { get; set; }
     *  
     * 
     * and use this class anywhere (Page_Load)
     * 
     * string mylogin = MySession.Current.LoginId;
     * 
     * string property1 = MySession.Current.Property1;
     * MySession.Current.Property1 = newValue;
     * 
     * DateTime myDate = MySession.Current.MyDate;
     * MySession.Current.MyDate = DateTime.Now;
     */
}