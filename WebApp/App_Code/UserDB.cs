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

        string sel = "SELECT UserId,  UserName, LastActivityDate, Cash FROM aspnet_Users " +
            "ORDER BY UserName";

        using (SqlConnection con = new SqlConnection(ConnectDB.GetConnectionString()))
        {
            SqlCommand cmd = new SqlCommand(sel, con);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                User user = new User();
                user.id = (Guid)rdr["UserId"];
                user.name = rdr["UserName"].ToString();
                user.lastActive = Convert.ToDateTime(rdr["LastActivityDate"]);
                user.cash = Convert.ToDecimal(rdr["Cash"]);

                listUsers.Add(user);
            }
        }

        return listUsers;
    }



    [DataObjectMethod(DataObjectMethodType.Select)]
    public static User GetUser(Guid UserId)
    {
        User user = new User();
        SqlConnection con = new SqlConnection(ConnectDB.GetConnectionString());
        string sel = "SELECT UserId, UserName, LastActivityDate, Cash FROM aspnet_Users " +
                     "WHERE (UserId = @UserId)";
          
        SqlCommand cmd = new SqlCommand(sel, con);
        cmd.Parameters.AddWithValue("UserId", UserId);

        con.Open();
        SqlDataReader rdr = cmd.ExecuteReader();
        rdr.Read();
        
        user.id = (Guid)rdr["UserId"];
        user.name = rdr["UserName"].ToString();
        user.lastActive = Convert.ToDateTime(rdr["LastActivityDate"]);
        user.cash = (decimal)rdr["Cash"];
        
        //rdr.Close();
        con.Close();
                           
        return user;
    }

    [DataObjectMethod(DataObjectMethodType.Update)]
    public static int UpdateUser(User user)
    {
        SqlConnection con = new SqlConnection(ConnectDB.GetConnectionString());
        string up = " UPDATE aspnet_Users "
            + "SET UserName = @UserName, "
            + "LoweredUserName = @LoweredUserName,"
            + "Cash = @Cash " +
            "WHERE (UserId = @UserId)";

        SqlCommand cmd = new SqlCommand(up, con);
        cmd.Parameters.AddWithValue("UserId", user.id);
        cmd.Parameters.AddWithValue("UserName", user.name);
        cmd.Parameters.AddWithValue("LoweredUserName", user.loweredName);
        cmd.Parameters.AddWithValue("Cash", user.cash);

        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }


    [DataObjectMethod(DataObjectMethodType.Insert)]
    public static int InsertUser(User user)
    {
        SqlConnection con = new SqlConnection(ConnectDB.GetConnectionString());
        string ins = "INSERT INTO aspnet_Users" +
                         "(UserName, LoweredUserName, Cash) "
                        + "VALUES(@UserName, @LoweredUserName, @Cash)";
        SqlCommand cmd = new SqlCommand(ins, con);
        cmd.Parameters.AddWithValue("UserName", user.name);
        cmd.Parameters.AddWithValue("LoweredUserName", user.loweredName);
        cmd.Parameters.AddWithValue("Cash", user.cash);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

}