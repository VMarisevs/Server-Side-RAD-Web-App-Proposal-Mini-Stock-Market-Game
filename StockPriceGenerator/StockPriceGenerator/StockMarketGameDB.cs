using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
namespace StockPriceGenerator
{
    class StockMarketGameDB
    {
        public static SqlConnection GetConnection()
        {
            // SqlExpress2008 for desktop and SqlExpress for laptop

            string connectionString =
                "Data Source=localhost\\SqlExpress;Initial Catalog=StockMarketGame;" +
                "Integrated Security=True";
            SqlConnection connection = new SqlConnection(connectionString);
            return connection;
        }
    }
}
