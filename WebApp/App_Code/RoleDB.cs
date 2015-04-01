using System;
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

        using (SqlConnection con = new SqlConnection(GetConnectionString()))
        {
            SqlCommand cmd = new SqlCommand(sel, con);
            cmd.Parameters.Add("@UserId", SqlDbType.UniqueIdentifier).Value = UserId;
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                Role role = new Role();
                role.RoleId = rdr["RoleId"].ToString();
                role.RoleName = rdr["RoleName"].ToString();

                listRole.Add(role);
            }
        }

        return listRole;
    }

    [DataObjectMethod(DataObjectMethodType.Insert)]
    public static int InsertRole( Guid UserId, string RoleId)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        string ins = "INSERT INTO aspnet_UsersInRoles " +
                         "(UserId, RoleId) "
                        + "VALUES(@UserId, @RoleId)";
        SqlCommand cmd = new SqlCommand(ins, con);
        cmd.Parameters.AddWithValue("UserId", UserId);
        cmd.Parameters.AddWithValue("RoleId", RoleId);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        return i;
    }

    [DataObjectMethod(DataObjectMethodType.Delete)]
    public static int DeleteRole(string UserId, string RoleId)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        string del = "DELETE FROM aspnet_UsersInRoles "
            + "WHERE UserId = @UserId "
            + "AND RoleId = @RoleId ";

        SqlCommand cmd = new SqlCommand(del, con);
        cmd.Parameters.AddWithValue("UserId", UserId);
        cmd.Parameters.AddWithValue("RoleId", RoleId);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        return i;
    }

    private static string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["GameConnectionString"].ConnectionString;
    }
}