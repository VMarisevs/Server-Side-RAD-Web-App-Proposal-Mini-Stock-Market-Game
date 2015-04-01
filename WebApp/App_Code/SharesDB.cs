using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;

using System.Collections;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public class BuySell
{
    public int userShares { get; set; }

    public decimal cash { get; set; }

    public int companyShares{ get; set; }

    public string companyName{ get; set; }

    public decimal price { get; set; }

 
}


public class SharesDB
{

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static BuySell GetShares(string userId, int companyId)
    {
        int a = 0;
        BuySell stock = new BuySell();
        string sel = "SELECT  aspnet_Users.Cash, Companies.Name, Companies.shareAmount, Companies.curprice, UserShares.shares, UserShares.price " +
                     "FROM Companies INNER JOIN " +
                         "UserShares ON Companies.Id = UserShares.companyId INNER JOIN " +
                        "aspnet_Users ON UserShares.userId = aspnet_Users.UserId " +
                        "WHERE (UserShares.companyId = @companyId) AND (UserShares.userId = @userId) ";

        using (SqlConnection con = new SqlConnection(GetConnectionString()))
        {
         
            SqlCommand cmd = new SqlCommand(sel, con);
            cmd.Parameters.AddWithValue("companyId", companyId);
            cmd.Parameters.AddWithValue("UserId", userId);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();

            rdr.Read();

            if ((rdr["shares"]) == null)              
                stock.userShares = 0;
            else
                stock.userShares = (int)(rdr["shares"]);


            stock.cash = (decimal)(rdr["Cash"]);

            stock.companyShares = (int)(rdr["shareAmount"]);
            stock.companyName = rdr["Name"].ToString();
            stock.price = (decimal)(rdr["curprice"]);
                        
        }

        return stock;
    }

    [DataObjectMethod(DataObjectMethodType.Update)]
    public static int UpdateCash(string UserId, decimal cash)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        string ins = " UPDATE aspnet_Users "
            + "SET Cash = @Cash " +
              "WHERE (UserId = @UserId)";
        SqlCommand cmd = new SqlCommand(ins, con);
        cmd.Parameters.AddWithValue("UserId", UserId);
        cmd.Parameters.AddWithValue("Cash", cash);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        return i;
    }


    [DataObjectMethod(DataObjectMethodType.Update)]
    public static int UpdateUserShares(string UserId,int companyId, int shares)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        string ins = "UPDATE UserShares " +
                         "SET shares = @shares " +
                         "WHERE (UserId = @UserId) AND (companyId = @companyId)";
        SqlCommand cmd = new SqlCommand(ins, con);
        cmd.Parameters.AddWithValue("UserId", UserId);
        cmd.Parameters.AddWithValue("companyId", companyId);
        cmd.Parameters.AddWithValue("shares", shares);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        return i;
    }

    [DataObjectMethod(DataObjectMethodType.Update)]
    public static int UpdateCompanyShares(int companyId, int shares)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        string ins = "UPDATE Companies " +
                         "SET shareAmount = @shareAmount "+
                         "WHERE (Id = @Id)";
        SqlCommand cmd = new SqlCommand(ins, con);
        cmd.Parameters.AddWithValue("Id", companyId);
        cmd.Parameters.AddWithValue("shareAmount", shares);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        return i;
    }

    private static string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["GameConnectionString"].ConnectionString;
    }
}