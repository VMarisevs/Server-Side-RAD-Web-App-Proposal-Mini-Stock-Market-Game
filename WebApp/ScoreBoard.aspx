<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ScoreBoard.aspx.cs" Inherits="ScoreBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Score Board
    </h1>
    <asp:SqlDataSource ID="dsUsers" runat="server" 
        ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
        
        SelectCommand="SELECT aspnet_Users.UserName, aspnet_Users.Cash, UserShares.shares, UserShares.shares * UserShares.price AS [Share Worth], UserShares.shares * UserShares.price + aspnet_Users.Cash AS [Net Worth], aspnet_Users.LastActivityDate FROM aspnet_Users INNER JOIN UserShares ON aspnet_Users.UserId = UserShares.userId INNER JOIN Companies ON UserShares.companyId = Companies.Id GROUP BY aspnet_Users.UserId ORDER BY [Net Worth] DESC">
    </asp:SqlDataSource>
    <asp:GridView ID="gwScores" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataSourceID="dsUsers">
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="UserName" 
                SortExpression="UserName" />
            <asp:BoundField DataField="Cash" HeaderText="Cash" SortExpression="Cash" />
            <asp:BoundField DataField="shares" HeaderText="shares" 
                SortExpression="shares" />
            <asp:BoundField DataField="Share Worth" HeaderText="Share Worth" 
                ReadOnly="True" SortExpression="Share Worth" />
            <asp:BoundField DataField="Net Worth" HeaderText="Net Worth" ReadOnly="True" 
                SortExpression="Net Worth" />
            <asp:BoundField DataField="LastActivityDate" HeaderText="LastActivityDate" 
                SortExpression="LastActivityDate" />
        </Columns>
        <PagerSettings Mode="NumericFirstLast" />
    </asp:GridView>
    <br />

</asp:Content>

