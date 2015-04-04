using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;

using System.Collections;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public class CompanyDB
{
    public static Comapny GetCompanyShares(int Id)
    {
        Comapny company = new Comapny();

        SqlConnection con = new SqlConnection(ConnectDB.GetConnectionString());
        string sel = "SELECT Name, curprice, shareAmount " +
                     "FROM Companies WHERE (Id = @Id) ";

        SqlCommand cmd = new SqlCommand(sel, con);
        cmd.Parameters.AddWithValue("Id", Id);
        con.Open();
        SqlDataReader rdr = cmd.ExecuteReader();

        rdr.Read();


        company.name = rdr["Name"].ToString();
        company.sharePrice = (decimal)rdr["curprice"];
        company.shares = (int)(rdr["shareAmount"]);

        rdr.Close();
        con.Close();

        return company;
    }

    public static int UpdateCompanyShares(int companyId, int shares)
    {
        SqlConnection con = new SqlConnection(ConnectDB.GetConnectionString());
        string ins = "UPDATE Companies " +
                         "SET shareAmount = @shareAmount " +
                         "WHERE (Id = @Id)";
        SqlCommand cmd = new SqlCommand(ins, con);
        cmd.Parameters.AddWithValue("Id", companyId);
        cmd.Parameters.AddWithValue("shareAmount", shares);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

}