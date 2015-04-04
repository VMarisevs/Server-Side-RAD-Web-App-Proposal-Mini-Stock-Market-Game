<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewFeedback.aspx.cs" Inherits="Authorised_ViewFeedback" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DetailsView ID="dvwFeedback" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" DataSourceID="dsFeedback" 
        Height="50px" Width="291px">
        <Fields>
            <asp:BoundField DataField="PostDate" HeaderText="PostDate" 
                SortExpression="PostDate" />
            <asp:BoundField DataField="LearnAboutWebsite" HeaderText="LearnAboutWebsite" 
                SortExpression="LearnAboutWebsite" ReadOnly="True" />
<asp:BoundField DataField="AccessMedium" HeaderText="AccessMedium" 
                SortExpression="AccessMedium" ReadOnly="True"></asp:BoundField>
            <asp:BoundField DataField="VisitingReason" HeaderText="VisitingReason" 
                SortExpression="VisitingReason" ReadOnly="True" />
            <asp:BoundField DataField="Comeback" HeaderText="Comeback" 
                SortExpression="Comeback" ReadOnly="True" />
            <asp:BoundField DataField="Experience" HeaderText="Experience" 
                SortExpression="Experience" />
            <asp:TemplateField HeaderText="List of Devices" SortExpression="id">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:HiddenField ID="hfID" runat="server" Value='<%# Eval("id") %>' />
                    <asp:BulletedList ID="blDevices" runat="server" DataSourceID="dsDeviceList" 
                        DataTextField="Name" DataValueField="Name" BulletStyle="Square">
                    </asp:BulletedList>
                    <asp:SqlDataSource ID="dsDeviceList" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
                        SelectCommand="SELECT Feedback_Options.Name FROM Feedback_Devices INNER JOIN Feedback_Options ON Feedback_Devices.DeviceId = Feedback_Options.Id WHERE (Feedback_Devices.ListId = @FeedbackId)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfID" Name="FeedbackId" PropertyName="Value" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:ListBox ID="ListBox1" runat="server" DataSourceID="dsDeviceList" 
                        DataTextField="Name" DataValueField="Name" Width="119px"></asp:ListBox>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="dsFeedback" runat="server" 
        ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
        SelectCommand="SELECT [id]
,[PostDate]
      ,(SELECT [Name] FROM [StockMarketGame].[dbo].[Feedback_Options] 
      WHERE [id] = [LearnAboutWebsite]) AS LearnAboutWebsite
      ,(SELECT [Name] FROM [StockMarketGame].[dbo].[Feedback_Options] 
      WHERE [id] = [AccessMedium]) AS AccessMedium
      ,(SELECT [Name] FROM [StockMarketGame].[dbo].[Feedback_Options] 
      WHERE [id] = [VisitingReason]) AS VisitingReason
      ,CASE [Comeback]
      WHEN '0' THEN 'no'
      WHEN '1' THEN 'yes'
      ELSE 'Error'
      END AS Comeback
      ,[Experience]
  FROM [StockMarketGame].[dbo].[Feedback_List]
  ORDER BY [PostDate] DESC"
        >
    </asp:SqlDataSource>
    <asp:Chart ID="chDevices" runat="server" DataSourceID="dsDevicesChart">
        <Series>
            <asp:Series ChartType="Pie" Name="Series1" XValueMember="Device" 
                YValueMembers="Count">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    <asp:SqlDataSource ID="dsDevicesChart" runat="server" 
        ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" SelectCommand="SELECT COUNT(DeviceId) AS 'Count'
,(SELECT Name FROM Feedback_Options WHERE DeviceId = Feedback_Options.Id) AS 'Device'
FROM Feedback_Devices
GROUP BY DeviceId"></asp:SqlDataSource>
</asp:Content>

