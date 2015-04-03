<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FeedbackView.aspx.cs" Inherits="Authorised_FeedbackView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="sdFeedback" 
        Height="50px" Width="291px">
        <Fields>
            <asp:BoundField DataField="Experience" HeaderText="Experience" 
                SortExpression="Experience" />
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" 
                SortExpression="Id" />
            <asp:BoundField DataField="PostDate" HeaderText="PostDate" 
                SortExpression="PostDate" />
<asp:BoundField DataField="LearnAboutWebsite" HeaderText="LearnAboutWebsite" 
                SortExpression="LearnAboutWebsite"></asp:BoundField>
            <asp:BoundField DataField="AccessMedium" HeaderText="AccessMedium" 
                SortExpression="AccessMedium" />
            <asp:BoundField DataField="VisitingReason" HeaderText="VisitingReason" 
                SortExpression="VisitingReason" />
            <asp:BoundField DataField="Comeback" HeaderText="Comeback" 
                SortExpression="Comeback" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="sdFeedback" runat="server" 
        ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
        SelectCommand="SELECT Feedback_List.Experience, Feedback_List.Id, Feedback_List.PostDate, Feedback_List.LearnAboutWebsite, Feedback_List.AccessMedium, Feedback_List.VisitingReason, Feedback_List.Comeback FROM Feedback_List INNER JOIN Feedback_Devices ON Feedback_List.Id = Feedback_Devices.ListId INNER JOIN Feedback_Options ON Feedback_Devices.DeviceId = Feedback_Options.Id"
        >
    </asp:SqlDataSource>
</asp:Content>

