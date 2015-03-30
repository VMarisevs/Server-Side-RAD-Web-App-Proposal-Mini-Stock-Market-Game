using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;

using System.Collections;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;




[DataObject(true)]
public static class UserDB
{
    [DataObjectMethod(DataObjectMethodType.Select)]
    public static List<User> GetAllUsers()
    {
        List<User> listUsers = new List<User>();
     
        string sel = "SELECT aspnet_Users.UserName, aspnet_Roles.RoleName, aspnet_Users.Cash, aspnet_Users.LastActivityDate FROM " +
            "aspnet_Roles INNER JOIN " +
            " aspnet_UsersInRoles ON aspnet_Roles.RoleId = aspnet_UsersInRoles.RoleId " +
            "INNER JOIN  aspnet_Users ON aspnet_UsersInRoles.UserId = aspnet_Users.UserId ORDER BY aspnet_Users.UserName";

        using (SqlConnection con = new SqlConnection(GetConnectionString()))
        {
            SqlCommand cmd = new SqlCommand(sel, con);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                User user = new User();
                user.UserName = rdr["UserName"].ToString();
                user.UserRole = rdr["RoleName"].ToString();
                user.UserLastActivity = Convert.ToDateTime(rdr["LastActivityDate"]);

                listUsers.Add(user);
            }
        }
    
        return listUsers;
    }
    //SqlCommand cmd = new SqlCommand(sel, con);
    //con.Open();
    //SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
    //public static IEnumerable GetUserStocks()
    //{
    //    SqlConnection con = new SqlConnection(GetConnectionString());
    //    string sel = "SELECT  UserShares.companyId, UserShares.shares, UserShares.price " +
    //                 "FROM UserShares INNER JOIN " +
    //                 "aspnet_Users ON UserShares.userId = aspnet_Users.UserId"
    //    SqlCommand cmd = new SqlCommand(sel, con);
    //    con.Open();
    //    SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
    //    return dr;
    //}


    
    private static string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["GameConnectionString"].ConnectionString;
    }
}