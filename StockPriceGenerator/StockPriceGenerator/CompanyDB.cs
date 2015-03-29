using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;


namespace StockPriceGenerator
{
    class CompanyDB
    {
        public static List<Company> GetInvoicesDue()
        {
            List<Company> companyList = new List<Company>();
            SqlConnection connection = StockMarketGameDB.GetConnection();
            string selectStatement =
                "SELECT Companies.Id AS companyID, Companies.Name AS name, Companies.curprice AS curPrice, "+
                " Companies.categoryId AS CategoryID, Companies.Volatility AS CompanyVol, "+
                " Categories.Volatility AS  CategoryVol"+
                " FROM Companies INNER JOIN Categories ON Companies.categoryId = Categories.Id";
            SqlCommand selectCommand = new SqlCommand(selectStatement, connection);
            try
            {
                connection.Open();
                SqlDataReader reader = selectCommand.ExecuteReader();
                while (reader.Read())
                {
                    Company company = new Company();
                    company.CompanyId = reader["companyID"].ToString();
                    company.CompanyName = reader["name"].ToString();
                    company.Curprice = reader["curPrice"].ToString();
                    company.CategoryId = reader["CategoryID"].ToString();
                    company.CompanyVolatility = reader["CompanyVol"].ToString();
                    company.CategoryVolatility = reader["CategoryVol"].ToString();

                    companyList.Add(company);
                }
                reader.Close();
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }
            return companyList;
        }

        public static bool UpdateCompanyPrice(Company company)
        {
            SqlConnection connection = StockMarketGameDB.GetConnection();
            string updateStatement =
                "UPDATE Companies SET " +
                  "curprice = @NewCurprice " +
                "WHERE id = @companyID ";
            SqlCommand updateCommand = new SqlCommand(updateStatement, connection);

            updateCommand.Parameters.AddWithValue("@NewCurprice",company.Curprice);
            updateCommand.Parameters.AddWithValue("@companyID",company.CompanyId);

            try
            {
                connection.Open();
                int count = updateCommand.ExecuteNonQuery();
                if (count > 0)
                    return true;
                else
                    return false;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }
        }

        public static void InsertIntoHistory(Company company)
        {
            SqlConnection connection = StockMarketGameDB.GetConnection();
            string insertStatement =
                "INSERT StockHistory " +
                  "( updated, companyId, price) " +
                "VALUES ( @updatedTime, @companyId, @curprice)";
            SqlCommand insertCommand = new SqlCommand(insertStatement, connection);
            insertCommand.Parameters.AddWithValue("@updatedTime", DateTime.Now);
            insertCommand.Parameters.AddWithValue("@companyId", company.CompanyId);
            insertCommand.Parameters.AddWithValue("@curprice", company.Curprice);

            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();
               
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }
        }
    }
}
