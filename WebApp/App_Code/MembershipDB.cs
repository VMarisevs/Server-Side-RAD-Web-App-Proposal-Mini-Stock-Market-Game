using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;

using System.Collections;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public class MembershipDB
{


    public static bool GetRoleId(Guid userId)
    {
        bool isApproved;
        SqlConnection con = new SqlConnection(ConnectDB.GetConnectionString());
        string sel = "SELECT IsApproved FROM aspnet_Membership " +
                     "WHERE (userId = @userId)";

        SqlCommand cmd = new SqlCommand(sel, con);
        cmd.Parameters.AddWithValue("userId", userId);

        con.Open();
        SqlDataReader rdr = cmd.ExecuteReader();
        rdr.Read();

        isApproved = (bool)rdr["IsApproved"];


        rdr.Close();
        con.Close();

        return isApproved;
    }

    public static int updateUserApproval(Guid userId, bool isApproved)
    {
        SqlConnection con = new SqlConnection(ConnectDB.GetConnectionString());
        string up = " UPDATE aspnet_Membership "
            + "SET IsApproved = @isApproved " +
            "WHERE (UserId = @UserId)";

        SqlCommand cmd = new SqlCommand(up, con);
        cmd.Parameters.AddWithValue("UserId", userId);
        cmd.Parameters.AddWithValue("isApproved", isApproved);

        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }
}