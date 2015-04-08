using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;

using System.Collections;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public class UserHistoryDB
{
    public static int InsertHistory(Guid userId, int companyId, int ammount, char buySell, decimal priceBought, decimal priceSold)
    {
        SqlConnection con = new SqlConnection(ConnectDB.GetConnectionString());
        string ins = "INSERT INTO TransactionHistory " +
                  "(UserId, sharesAmount, buySell, companyId, priceBought, priceSold) "
                 + "VALUES(@UserId, @sharesAmount, @buySell, @companyId, @priceBought, @priceSold)";

        SqlCommand cmd = new SqlCommand(ins, con);
        cmd.Parameters.AddWithValue("UserId", userId);
        cmd.Parameters.AddWithValue("companyId", companyId);
        cmd.Parameters.AddWithValue("sharesAmount", ammount);
        cmd.Parameters.AddWithValue("buySell", buySell);
        cmd.Parameters.AddWithValue("priceBought", priceBought);
        cmd.Parameters.AddWithValue("priceSold", priceSold);

        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }
	
}