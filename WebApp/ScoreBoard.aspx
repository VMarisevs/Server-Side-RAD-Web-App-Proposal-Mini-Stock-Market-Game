<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ScoreBoard.aspx.cs" Inherits="ScoreBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Score Board
    </h1>
    <asp:SqlDataSource ID="dsUsers" runat="server" 
        ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
        
        SelectCommand="SELECT aspnet_Users.UserName, AVG(aspnet_Users.Cash) AS Cash, SUM(UserShares.shares) AS Shares, SUM(UserShares.shares * UserShares.price) AS [Share Worth], SUM(UserShares.shares * UserShares.price) + AVG(aspnet_Users.Cash) AS [Net Worth] FROM aspnet_Users INNER JOIN UserShares ON aspnet_Users.UserId = UserShares.userId GROUP BY aspnet_Users.UserName ORDER BY [Net Worth] DESC">
    </asp:SqlDataSource>
    <asp:GridView ID="gwScores" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataSourceID="dsUsers" Font-Names="Tahoma" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="User Name" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Cash" DataFormatString="{0:c}" HeaderText="Cash" 
                SortExpression="Cash">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="shares" HeaderText="Shares" SortExpression="shares">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Share Worth" DataFormatString="{0:c}" 
                HeaderText="Share Worth" ReadOnly="True">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Net Worth" DataFormatString="{0:c}" 
                HeaderText="Net Worth" ReadOnly="True" SortExpression="Net Worth">
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <br />

</asp:Content>

