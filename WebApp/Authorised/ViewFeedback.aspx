<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewFeedback.aspx.cs" Inherits="Authorised_ViewFeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>
        View Feedback
    </h1>

    <div>
        <asp:SqlDataSource ID="dsFeedback" runat="server" 
            ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
            SelectCommand="SELECT Feedback_Devices.*, Feedback_List.*, Feedback_Options.* FROM Feedback_Devices INNER JOIN Feedback_List ON Feedback_Devices.ListId = Feedback_List.Id INNER JOIN Feedback_Options ON Feedback_Devices.DeviceId = Feedback_Options.Id"></asp:SqlDataSource>
        <asp:FormView ID="formFeedback" runat="server" AllowPaging="True" 
            CellPadding="4" DataKeyNames="ListId,DeviceId,Id,Id1" DataSourceID="dsFeedback" 
            ForeColor="#333333">
            <EditItemTemplate>
                ListId:
                <asp:Label ID="ListIdLabel1" runat="server" Text='<%# Eval("ListId") %>' />
                <br />
                DeviceId:
                <asp:Label ID="DeviceIdLabel1" runat="server" Text='<%# Eval("DeviceId") %>' />
                <br />
                Id:
                <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                <br />
                Experience:
                <asp:TextBox ID="ExperienceTextBox" runat="server" 
                    Text='<%# Bind("Experience") %>' />
                <br />
                PostDate:
                <asp:TextBox ID="PostDateTextBox" runat="server" 
                    Text='<%# Bind("PostDate") %>' />
                <br />
                LearnAboutWebsite:
                <asp:TextBox ID="LearnAboutWebsiteTextBox" runat="server" 
                    Text='<%# Bind("LearnAboutWebsite") %>' />
                <br />
                AccessMedium:
                <asp:TextBox ID="AccessMediumTextBox" runat="server" 
                    Text='<%# Bind("AccessMedium") %>' />
                <br />
                VisitingReason:
                <asp:TextBox ID="VisitingReasonTextBox" runat="server" 
                    Text='<%# Bind("VisitingReason") %>' />
                <br />
                Comeback:
                <asp:TextBox ID="ComebackTextBox" runat="server" 
                    Text='<%# Bind("Comeback") %>' />
                <br />
                Id1:
                <asp:Label ID="Id1Label1" runat="server" Text='<%# Eval("Id1") %>' />
                <br />
                Name:
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                TYPE:
                <asp:TextBox ID="TYPETextBox" runat="server" Text='<%# Bind("TYPE") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                ListId:
                <asp:TextBox ID="ListIdTextBox" runat="server" Text='<%# Bind("ListId") %>' />
                <br />
                DeviceId:
                <asp:TextBox ID="DeviceIdTextBox" runat="server" 
                    Text='<%# Bind("DeviceId") %>' />
                <br />
                Id:
                <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
                <br />
                Experience:
                <asp:TextBox ID="ExperienceTextBox" runat="server" 
                    Text='<%# Bind("Experience") %>' />
                <br />
                PostDate:
                <asp:TextBox ID="PostDateTextBox" runat="server" 
                    Text='<%# Bind("PostDate") %>' />
                <br />
                LearnAboutWebsite:
                <asp:TextBox ID="LearnAboutWebsiteTextBox" runat="server" 
                    Text='<%# Bind("LearnAboutWebsite") %>' />
                <br />
                AccessMedium:
                <asp:TextBox ID="AccessMediumTextBox" runat="server" 
                    Text='<%# Bind("AccessMedium") %>' />
                <br />
                VisitingReason:
                <asp:TextBox ID="VisitingReasonTextBox" runat="server" 
                    Text='<%# Bind("VisitingReason") %>' />
                <br />
                Comeback:
                <asp:TextBox ID="ComebackTextBox" runat="server" 
                    Text='<%# Bind("Comeback") %>' />
                <br />
                Id1:
                <asp:TextBox ID="Id1TextBox" runat="server" Text='<%# Bind("Id1") %>' />
                <br />
                Name:
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                TYPE:
                <asp:TextBox ID="TYPETextBox" runat="server" Text='<%# Bind("TYPE") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                ListId:
                <asp:Label ID="ListIdLabel" runat="server" Text='<%# Eval("ListId") %>' />
                <br />
                DeviceId:
                <asp:Label ID="DeviceIdLabel" runat="server" Text='<%# Eval("DeviceId") %>' />
                <br />
                Id:
                <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                <br />
                Experience:
                <asp:Label ID="ExperienceLabel" runat="server" 
                    Text='<%# Bind("Experience") %>' />
                <br />
                PostDate:
                <asp:Label ID="PostDateLabel" runat="server" Text='<%# Bind("PostDate") %>' />
                <br />
                LearnAboutWebsite:
                <asp:Label ID="LearnAboutWebsiteLabel" runat="server" 
                    Text='<%# Bind("LearnAboutWebsite") %>' />
                <br />
                AccessMedium:
                <asp:Label ID="AccessMediumLabel" runat="server" 
                    Text='<%# Bind("AccessMedium") %>' />
                <br />
                VisitingReason:
                <asp:Label ID="VisitingReasonLabel" runat="server" 
                    Text='<%# Bind("VisitingReason") %>' />
                <br />
                Comeback:
                <asp:Label ID="ComebackLabel" runat="server" Text='<%# Bind("Comeback") %>' />
                <br />
                Id1:
                <asp:Label ID="Id1Label" runat="server" Text='<%# Eval("Id1") %>' />
                <br />
                Name:
                <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                TYPE:
                <asp:Label ID="TYPELabel" runat="server" Text='<%# Bind("TYPE") %>' />
                <br />

            </ItemTemplate>
            <PagerSettings Mode="NumericFirstLast" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:FormView>
    </div>
</asp:Content>

