<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="History.aspx.cs" Inherits="Authenticated_History" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>History
    </h1>
    <div>
        <asp:SqlDataSource ID="dsUserShares" runat="server" 
            ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
            SelectCommand="SELECT Companies.Name AS Company, Categories.shortName AS Category, TransactionHistory.buySell AS [Buy/Sell], TransactionHistory.sharesAmount AS Amount, TransactionHistory.priceBought AS [Price Bought], TransactionHistory.priceSold AS [Price Sold], Companies.curprice AS [Current Price], Companies.shareAmount AS [Shares left in Company] FROM aspnet_Users INNER JOIN UserShares ON aspnet_Users.UserId = UserShares.userId INNER JOIN Companies ON UserShares.companyId = Companies.Id INNER JOIN Categories ON Companies.categoryId = Categories.Id INNER JOIN TransactionHistory ON aspnet_Users.UserId = TransactionHistory.userId AND Companies.Id = TransactionHistory.companyId"></asp:SqlDataSource>
        <asp:GridView ID="gwHistory" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataSourceID="dsUserShares" CellPadding="4" 
            ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Company" HeaderText="Company" 
                    SortExpression="Company" />
                <asp:BoundField DataField="Category" HeaderText="Category" 
                    SortExpression="Category" />
                <asp:BoundField DataField="Buy/Sell" HeaderText="Buy/Sell" 
                    SortExpression="Buy/Sell" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" 
                    SortExpression="Amount" />
                <asp:BoundField DataField="Price Bought" HeaderText="Price Bought" 
                    SortExpression="Price Bought" />
                <asp:BoundField DataField="Price Sold" HeaderText="Price Sold" 
                    SortExpression="Price Sold" />
                <asp:BoundField DataField="Current Price" HeaderText="Current Price" 
                    SortExpression="Current Price" />
                <asp:BoundField DataField="Shares left in Company" 
                    HeaderText="Shares left in Company" SortExpression="Shares left in Company" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <EmptyDataRowStyle BorderStyle="None" />
            <EmptyDataTemplate>
                <div class="style1">
                    Sorry you have no transaction history.</div>
            </EmptyDataTemplate>
            <FooterStyle BackColor="#008FBF" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#00BFFF" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#008FBF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </div>
</asp:Content>

