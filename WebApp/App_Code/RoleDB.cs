﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;

using System.Collections;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;



public class RoleDB
{

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static List<Role> GetUserRoles(Guid UserId)
    {
        List<Role> listRole = new List<Role>();

        string sel = "SELECT aspnet_Roles.RoleName, aspnet_Roles.RoleId " +
                     "FROM   aspnet_Users " +
                     "INNER JOIN " +
                     "aspnet_UsersInRoles ON aspnet_Users.UserId = aspnet_UsersInRoles.UserId " +
                     "INNER JOIN aspnet_Roles ON aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId " +
                     "WHERE (aspnet_Users.UserId = @UserId)"; ;

        using (SqlConnection con = new SqlConnection(ConnectDB.GetConnectionString()))
        {
            SqlCommand cmd = new SqlCommand(sel, con);
            cmd.Parameters.Add("@UserId", SqlDbType.UniqueIdentifier).Value = UserId;
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();


            while (rdr.Read())
            {
                Role role = new Role();
                role.id = (Guid)rdr["RoleId"];
                role.RoleName = rdr["RoleName"].ToString();

                listRole.Add(role);
            }

            con.Close();
        }
        
        return listRole;
    }

    public static Guid GetRoleId(string RoleName)
    {
        Guid roleId;
        SqlConnection con = new SqlConnection(ConnectDB.GetConnectionString());
        string sel = "SELECT RoleId FROM aspnet_Roles " +
                     "WHERE (RoleName = @RoleName)";

        SqlCommand cmd = new SqlCommand(sel, con);
        cmd.Parameters.AddWithValue("RoleName", RoleName);

        con.Open();
        SqlDataReader rdr = cmd.ExecuteReader();
        rdr.Read();

        roleId = (Guid)rdr["RoleId"];


        rdr.Close();
        con.Close();

        return roleId;
    }


    [DataObjectMethod(DataObjectMethodType.Insert)]
    public static int InsertUserRole(Guid UserId, Guid RoleId)
    {
        SqlConnection con = new SqlConnection(ConnectDB.GetConnectionString());
        string ins = "INSERT INTO aspnet_UsersInRoles " +
                         "(UserId, RoleId) "
                        + "VALUES(@UserId, @RoleId)";
        SqlCommand cmd = new SqlCommand(ins, con);
        cmd.Parameters.AddWithValue("UserId", UserId);
        cmd.Parameters.AddWithValue("RoleId", RoleId);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    [DataObjectMethod(DataObjectMethodType.Insert)]
    public static int InsertRole(Guid RoleId)
    {
        SqlConnection con = new SqlConnection(ConnectDB.GetConnectionString());
        string ins = "SELECT SCOPE_IDENTITY() FROM aspnet_Users AS  [@UserId] " +
                     "INSERT INTO aspnet_UsersInRoles " +
                         "(@UserId, RoleId) "
                        + "VALUES(@RoleId)";
        SqlCommand cmd = new SqlCommand(ins, con);
        cmd.Parameters.AddWithValue("RoleId", RoleId);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

    [DataObjectMethod(DataObjectMethodType.Delete)]
    public static int DeleteUserRole(Guid UserId, Guid RoleId)
    {
        SqlConnection con = new SqlConnection(ConnectDB.GetConnectionString());
        string del = "DELETE FROM aspnet_UsersInRoles "
            + "WHERE UserId = @UserId "
            + "AND RoleId = @RoleId ";

        SqlCommand cmd = new SqlCommand(del, con);
        cmd.Parameters.AddWithValue("UserId", UserId);
        cmd.Parameters.AddWithValue("RoleId", RoleId);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }

 
}