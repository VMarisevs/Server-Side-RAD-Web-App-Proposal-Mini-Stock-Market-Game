<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewFeedback.aspx.cs" Inherits="Authorised_ViewFeedback" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div>
        <asp:ListView ID="lvwFeedback" runat="server" DataKeyNames="id" 
            DataSourceID="dsFeedback">
            <AlternatingItemTemplate>
                <tr style="background-color: #FFFFFF;color: #284775;">
                    <td>
                        <asp:Label ID="PostDateLabel" runat="server" Text='<%# Eval("PostDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LearnAboutWebsiteLabel" runat="server" 
                            Text='<%# Eval("LearnAboutWebsite") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AccessMediumLabel" runat="server" 
                            Text='<%# Eval("AccessMedium") %>' />
                    </td>
                    <td>
                        <asp:Label ID="VisitingReasonLabel" runat="server" 
                            Text='<%# Eval("VisitingReason") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ComebackLabel" runat="server" Text='<%# Eval("Comeback") %>' />
                    </td>
                                        <td>
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' visible="false"/>

<%--                     <asp:BulletedList ID="blDevices" runat="server" DataSourceID="dsDeviceList" 
                        DataTextField="Name" DataValueField="Name" BulletStyle="Square">
                    </asp:BulletedList>--%>

                    <asp:SqlDataSource ID="dsDeviceList" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
                        SelectCommand="SELECT Feedback_Options.Name FROM Feedback_Devices INNER JOIN Feedback_Options ON Feedback_Devices.DeviceId = Feedback_Options.Id WHERE (Feedback_Devices.ListId = @FeedbackId)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="idLabel" Name="FeedbackId"  /> 
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:ListBox ID="ListBox1" runat="server" DataSourceID="dsDeviceList" 
                        DataTextField="Name" DataValueField="Name" Width="119px" Enabled="false" BackColor="#ebebe4" SelectionMode="Multiple" Height="100px" />

                    </td>

                                        <td>
                        <asp:TextBox ID="ExperienceLabel" runat="server" 
                            Text='<%# Eval("Experience") %>' TextMode="MultiLine" Height="100px" Width="200px" Enabled="false"/>
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <%--            <EditItemTemplate>
                <tr style="background-color: #999999;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                            Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PostDateTextBox" runat="server" 
                            Text='<%# Bind("PostDate") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="LearnAboutWebsiteTextBox" runat="server" 
                            Text='<%# Bind("LearnAboutWebsite") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="AccessMediumTextBox" runat="server" 
                            Text='<%# Bind("AccessMedium") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="VisitingReasonTextBox" runat="server" 
                            Text='<%# Bind("VisitingReason") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ComebackTextBox" runat="server" 
                            Text='<%# Bind("Comeback") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ExperienceTextBox" runat="server" 
                            Text='<%# Bind("Experience") %>' />
                    </td>
                </tr>
            </EditItemTemplate>--%>
            <EmptyDataTemplate>
                <table runat="server" 
                    style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>
                            No feedback to display.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <%--            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                            Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="idTextBox" runat="server" Text='<%# Bind("id") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PostDateTextBox" runat="server" 
                            Text='<%# Bind("PostDate") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="LearnAboutWebsiteTextBox" runat="server" 
                            Text='<%# Bind("LearnAboutWebsite") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="AccessMediumTextBox" runat="server" 
                            Text='<%# Bind("AccessMedium") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="VisitingReasonTextBox" runat="server" 
                            Text='<%# Bind("VisitingReason") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ComebackTextBox" runat="server" 
                            Text='<%# Bind("Comeback") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ExperienceTextBox" runat="server" 
                            Text='<%# Bind("Experience") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>--%>
            <ItemTemplate>
                <tr style="background-color: #E0FFFF;color: #333333;">
                    <td>
                        <asp:Label ID="PostDateLabel" runat="server" Text='<%# Eval("PostDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LearnAboutWebsiteLabel" runat="server" 
                            Text='<%# Eval("LearnAboutWebsite") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AccessMediumLabel" runat="server" 
                            Text='<%# Eval("AccessMedium") %>' />
                    </td>
                    <td>
                        <asp:Label ID="VisitingReasonLabel" runat="server" 
                            Text='<%# Eval("VisitingReason") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ComebackLabel" runat="server" Text='<%# Eval("Comeback") %>' />
                    </td>
 

                                        <td>
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' Visible="false" />

                        <%--<asp:BulletedList ID="blDevices" runat="server" DataSourceID="dsDeviceList" 
                        DataTextField="Name" DataValueField="Name" BulletStyle="Square" Height="100px" DisplayMode="Text" />--%>

                    <asp:SqlDataSource ID="dsDeviceList" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
                        SelectCommand="SELECT Feedback_Options.Name FROM Feedback_Devices INNER JOIN Feedback_Options ON Feedback_Devices.DeviceId = Feedback_Options.Id WHERE (Feedback_Devices.ListId = @FeedbackId)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="idLabel" Name="FeedbackId"  /> 
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:ListBox ID="ListBox1" runat="server" DataSourceID="dsDeviceList" 
                        DataTextField="Name" DataValueField="Name" Width="119px" Enabled="false"  BackColor="#ebebe4" SelectionMode="Multiple" Height="100px" />
                    </td>

                                       <td>
                        <asp:TextBox ID="ExperienceLabel" runat="server" 
                            Text='<%# Eval("Experience") %>' TextMode="MultiLine" Height="100px" Width="200px" Enabled="false"/>
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                    <th runat="server">
                                        Post Date</th>
                                    <th runat="server">
                                        Learn About Website</th>
                                    <th runat="server">
                                        Access Medium</th>
                                    <th runat="server">
                                        Visiting Reason</th>
                                    <th runat="server">
                                        Comeback</th>
                                    <th id="Th1" runat="server">
                                        Devices List</th>
                                     <th id="Th2" runat="server">
                                        Experience</th>
                                </tr>
                                <tr ID="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" 
                            style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                        ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
         <%--          <SelectedItemTemplate>
                <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                    <td>
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PostDateLabel" runat="server" Text='<%# Eval("PostDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LearnAboutWebsiteLabel" runat="server" 
                            Text='<%# Eval("LearnAboutWebsite") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AccessMediumLabel" runat="server" 
                            Text='<%# Eval("AccessMedium") %>' />
                    </td>
                    <td>
                        <asp:Label ID="VisitingReasonLabel" runat="server" 
                            Text='<%# Eval("VisitingReason") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ComebackLabel" runat="server" Text='<%# Eval("Comeback") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ExperienceLabel" runat="server" 
                            Text='<%# Eval("Experience") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>--%>
        </asp:ListView>
        <br />
    </div>



    <%--<asp:DetailsView ID="dvwFeedback" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" DataSourceID="dsFeedback" 
        Height="50px" Width="291px" CellPadding="4" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
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
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>--%>

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

