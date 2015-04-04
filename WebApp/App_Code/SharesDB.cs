using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;

using System.Collections;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public class SharesDB
{

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static IEnumerable GetUserCompanies(Guid userId)
    {
        SqlConnection con = new SqlConnection(ConnectDB.GetConnectionString());
        string sel = "SELECT UserShares.shares, UserShares.companyId, Companies.Name, Companies.curprice " +
                     "FROM Companies INNER JOIN " +
                     "UserShares ON Companies.Id = UserShares.companyId " +
                     "WHERE (userId = @userId) ";

        SqlCommand cmd = new SqlCommand(sel, con);
        cmd.Parameters.AddWithValue("UserId", userId);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        //con.Close(); (do not close this, it is needed, it is already closed above [.closeconnection])
        return dr;
    }

    public static int GetUserShares(Guid userId, int companyId)
    {
        int userShares = 0;

       
        SqlConnection con = new SqlConnection(ConnectDB.GetConnectionString());
        string sel = "SELECT shares " +
                     "FROM UserShares WHERE (companyId = @companyId) AND (userId = @userId)";       
                    
        SqlCommand cmd = new SqlCommand(sel, con);
        cmd.Parameters.AddWithValue("UserId", userId);
        cmd.Parameters.AddWithValue("companyId", companyId);
        con.Open();
        SqlDataReader rdr = cmd.ExecuteReader();
            
        rdr.Read();
        if (rdr.HasRows) 
        {
            userShares = (int)(rdr["shares"]);
        }
 
        rdr.Close();
        con.Close();
                               
        return userShares;
    }

    public static int DeleteUserShares(Guid userId, int companyId)
    {

        SqlConnection con = new SqlConnection(ConnectDB.GetConnectionString());
        string sel = "DELETE " +
                     "FROM UserShares WHERE (companyId = @companyId) AND (userId = @userId)";

        SqlCommand cmd = new SqlCommand(sel, con);
        cmd.Parameters.AddWithValue("UserId", userId);
        cmd.Parameters.AddWithValue("companyId", companyId);
        con.Open();

        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public static int UpdateUserShares(Guid UserId, int companyId, int shares)
    {
        if (shares > 0)
        {
            SqlConnection con = new SqlConnection(ConnectDB.GetConnectionString());
            string ins = "UPDATE UserShares " +
                             "SET shares = @shares " +
                             "WHERE (UserId = @UserId) AND (companyId = @companyId)";
            SqlCommand cmd = new SqlCommand(ins, con);
            cmd.Parameters.AddWithValue("UserId", UserId);
            cmd.Parameters.AddWithValue("companyId", companyId);
            cmd.Parameters.AddWithValue("shares", shares);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            return i;
        }
        else
        {
            return 0;
        }
    }


    public static int InsertUserShares(Guid userId, int companyId, int shares, decimal price)
    {
        SqlConnection con = new SqlConnection(ConnectDB.GetConnectionString());
        string ins = "INSERT INTO UserShares " +
                         "(userId, companyId, shares, price) "
                        + "VALUES(@userId, @companyId, @shares, @price)";
        SqlCommand cmd = new SqlCommand(ins, con);
        cmd.Parameters.AddWithValue("userId", userId);
        cmd.Parameters.AddWithValue("companyId", companyId);
        cmd.Parameters.AddWithValue("shares", shares);
        cmd.Parameters.AddWithValue("price", price);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    public static int UpdateCash(Guid UserId, decimal cash)
    {
        SqlConnection con = new SqlConnection(ConnectDB.GetConnectionString());
        string ins = " UPDATE aspnet_Users "
            + "SET Cash = @Cash " +
              "WHERE (UserId = @UserId)";
        SqlCommand cmd = new SqlCommand(ins, con);
        cmd.Parameters.AddWithValue("UserId", UserId);
        cmd.Parameters.AddWithValue("Cash", cash);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }



}