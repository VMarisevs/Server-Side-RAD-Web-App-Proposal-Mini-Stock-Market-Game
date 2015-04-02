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

        string sel = "SELECT UserId, UserName, LastActivityDate FROM aspnet_Users " +
            "ORDER BY aspnet_Users.UserName";

        using (SqlConnection con = new SqlConnection(GetConnectionString()))
        {
            SqlCommand cmd = new SqlCommand(sel, con);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                User user = new User();
                user.UserId = (Guid)rdr["UserId"];
                user.UserName = rdr["UserName"].ToString();
                user.UserLastActivity = Convert.ToDateTime(rdr["LastActivityDate"]);

                listUsers.Add(user);
            }
        }

        return listUsers;
    }




    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetUserInformation(Guid UserId)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        string sel = "SELECT aspnet_Roles.RoleName, aspnet_Users.UserName, aspnet_Users.Cash, UserShares.price, " +
                     "UserShares.shares, Companies.Name, aspnet_Users.UserId, aspnet_Roles.RoleId, UserShares.companyId " +
                     "FROM aspnet_Roles INNER JOIN " +
                     "aspnet_UsersInRoles ON aspnet_Roles.RoleId = aspnet_UsersInRoles.RoleId INNER JOIN " +
                     "aspnet_Users ON aspnet_UsersInRoles.UserId = aspnet_Users.UserId INNER JOIN " +
                     "UserShares ON aspnet_Users.UserId = UserShares.userId INNER JOIN " +
                     "Companies ON UserShares.companyId = Companies.Id " +
                     "WHERE (aspnet_Users.UserId = @UserId)";
        SqlCommand cmd = new SqlCommand(sel, con);     
        cmd.Parameters.Add("@UserId", SqlDbType.UniqueIdentifier).Value = UserId;
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return dr;
    }


    [DataObjectMethod(DataObjectMethodType.Insert)]
    public static int InsertUser(string UserName, string Cash, Guid ApplicationId )
    {
        SqlConnection con = new SqlConnection(GetConnectionString());           
        string ins = "INSERT INTO aspnet_Users "+
                         "(UserName, Cash, ApplicationId) " 
            + "VALUES(@UserName, @Cash, @ApplicationId)";
        SqlCommand cmd = new SqlCommand(ins, con);
        cmd.Parameters.AddWithValue("UserName", UserName);
        cmd.Parameters.AddWithValue("Cash", Cash);
        cmd.Parameters.AddWithValue("ApplicationId", ApplicationId);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        return i;
    }


    [DataObjectMethod(DataObjectMethodType.Update)]
    public static void UpdateUser(Guid UserId, string companyId, string UserName, string Cash, string shares)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        string up = " UPDATE aspnet_Users "
            + "SET UserName = @UserName, "
            + "Cash = @Cash " +
            "WHERE (UserId = @UserId)" +
            "UPDATE UserShares " +
            "SET shares = @shares " +
            "WHERE (UserId = @UserId) AND (companyId = @companyId)";
            
        SqlCommand cmd = new SqlCommand(up, con);
        cmd.Parameters.AddWithValue("UserId", UserId);
        cmd.Parameters.AddWithValue("companyId", companyId);
        cmd.Parameters.AddWithValue("UserName", UserName);
        cmd.Parameters.AddWithValue("Cash", Cash);
        cmd.Parameters.AddWithValue("shares", shares);

        con.Open();
        cmd.ExecuteNonQuery();
    }


    [DataObjectMethod(DataObjectMethodType.Insert)]
    public static int InsertUser(string UserName, string Cash)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        string ins = "INSERT INTO aspnet_Users" +
                         "(UserName, Cash) "
                        + "VALUES(@UserName, @Cash)";
        SqlCommand cmd = new SqlCommand(ins, con);
        cmd.Parameters.AddWithValue("UserName", UserName);
        cmd.Parameters.AddWithValue("Cash", Cash);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        return i;
    }

    private static string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["GameConnectionString"].ConnectionString;
    }
}