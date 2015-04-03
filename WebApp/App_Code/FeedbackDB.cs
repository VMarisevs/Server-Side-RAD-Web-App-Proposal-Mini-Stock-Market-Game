using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for FeedbackDB
/// </summary>
public class FeedbackDB
{
	public static void InsertFeedback(Feedback feedback)
    {

        SqlConnection connection = new SqlConnection(ConnectDB.GetConnectionString());

        string insertQuery = "INSERT INTO feedback_list " +
                                "(Experience, LearnAboutWebsite, AccessMedium, VisitingReason, Comeback) " +
                                "OUTPUT INSERTED.ID "+
                                "VALUES " +
                                "(@Experience, @LearnAboutWebsiteID, @AccessMediumID, @VisitingReasonID, @Comeback)";

        SqlCommand command = new SqlCommand(insertQuery, connection);

        command.Parameters.AddWithValue("@Experience",feedback.Experience);
        command.Parameters.AddWithValue("@LearnAboutWebsiteID", feedback.LearnAboutWebsiteID);
        command.Parameters.AddWithValue("@AccessMediumID", feedback.AccessMediumID);
        command.Parameters.AddWithValue("@VisitingReasonID", feedback.ResonID);
        command.Parameters.AddWithValue("@Comeback",feedback.WouldYouComeBackInt);

        connection.Open();

        feedback.id = (Guid)command.ExecuteScalar();

        connection.Close();
        // inserting devices in case they were defined
        InsertDevices(feedback);
        
    }

    private static void InsertDevices(Feedback feedback)
    {
        // checking if we have devices more that 0 only then we are trying to connect to database
        if (feedback.Devices.Count > 0)
        {
            SqlConnection connection = new SqlConnection(ConnectDB.GetConnectionString());

            string insertQuery = "INSERT INTO feedback_devices "
                                    +"(ListId, DeviceId) "
                                    +"VALUES "
                                    +"(@ListId, @DeviceId)";
            List<SqlCommand> commandList = new List<SqlCommand>();

            // specifying all insert commands and adding them into the list
            foreach (string deviceId in feedback.Devices)
            {
                SqlCommand newCommand = new SqlCommand(insertQuery, connection);
                newCommand.Parameters.AddWithValue("@ListId", feedback.id);
                newCommand.Parameters.AddWithValue("@DeviceId",deviceId);
                commandList.Add(newCommand);
            }

            connection.Open();
            // executing all commands in one connection
            foreach (SqlCommand command in commandList)
            {
                command.ExecuteNonQuery();    
            }
            connection.Close();
            

        }
    }
}