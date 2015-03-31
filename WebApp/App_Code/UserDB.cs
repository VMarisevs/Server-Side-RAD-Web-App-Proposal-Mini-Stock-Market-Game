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

        string sel = "SELECT aspnet_Users.UserId, aspnet_Users.UserName, aspnet_Roles.RoleName, aspnet_Users.LastActivityDate FROM " +
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
                user.UserId = rdr["UserId"].ToString();
                user.UserName = rdr["UserName"].ToString();
                user.UserRole = rdr["RoleName"].ToString();
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
        string sel = "SELECT aspnet_Users.UserName,aspnet_Users.UserName, aspnet_Users.Cash, UserShares.companyId, UserShares.shares, UserShares.price, Companies.Name " +
         "FROM aspnet_Users INNER JOIN UserShares ON aspnet_Users.UserId = UserShares.userId " +
         "INNER JOIN Companies ON UserShares.companyId = Companies.Id " +
         "WHERE (aspnet_Users.UserId = @UserId)";

        SqlCommand cmd = new SqlCommand(sel, con);     
        cmd.Parameters.Add("@UserId", SqlDbType.UniqueIdentifier).Value = UserId;
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return dr;
    }


    [DataObjectMethod(DataObjectMethodType.Insert)]
    public static int InsertCategory(string UserName, double cash )
    {
        SqlConnection con = new SqlConnection(GetConnectionString());


              
        string ins = "INSERT INTO Categories "
            + "(CategoryID, ShortName, LongName) "
            + "VALUES(@CategoryID, @ShortName, @LongName)";
        SqlCommand cmd = new SqlCommand(ins, con);
        //cmd.Parameters.AddWithValue("CategoryID", CategoryID);
        //cmd.Parameters.AddWithValue("ShortName", ShortName);
        //cmd.Parameters.AddWithValue("LongName", LongName);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        return i;
    }


    [DataObjectMethod(DataObjectMethodType.Update)]
    public static void UpdateUser(string UserName, string Cash)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        string up = " UPDATE aspnet_Users "
            + "SET UserName = @UserName, "
            + "Cash = @Cash ";
            //+ "WHERE CategoryID = @original_CategoryID "
            //+ "AND ShortName = @original_ShortName "
            //+ "AND LongName = @original_LongName";
        SqlCommand cmd = new SqlCommand(up, con);
        cmd.Parameters.AddWithValue("UserName", UserName);
        cmd.Parameters.AddWithValue("Cash", Cash);
        con.Open();
        //int i = 
        cmd.ExecuteNonQuery();
        //return i;
    }


    private static string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["GameConnectionString"].ConnectionString;
    }
}