<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ScoreBoard.aspx.cs" Inherits="ScoreBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Score Board
    </h1>
    <asp:SqlDataSource ID="dsUsers" runat="server" 
        ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
        
        
    SelectCommand="SELECT
[UserName]
	  ,(SELECT SUM([shares]) FROM [StockMarketGame].[dbo].[UserShares]
		WHERE [UserShares].[userId] = [aspnet_Users].[UserId]
		GROUP BY [userId] ) AS userShares
		,(SELECT SUM([shares] * [curprice]) 
			FROM [StockMarketGame].[dbo].[UserShares]
			INNER JOIN [StockMarketGame].[dbo].[Companies]
			ON [Companies].Id = [UserShares].companyId
			WHERE [UserShares].[userId] = [aspnet_Users].[UserId]
			GROUP BY [userId]) AS ShareWorth
      ,[Cash]
      ,(SELECT SUM([shares] * [curprice]) 
			FROM [StockMarketGame].[dbo].[UserShares]
			INNER JOIN [StockMarketGame].[dbo].[Companies]
			ON [Companies].Id = [UserShares].companyId
			WHERE [UserShares].[userId] = [aspnet_Users].[UserId]
			GROUP BY [userId])+[Cash] AS NetWorth
      
  FROM [StockMarketGame].[dbo].[aspnet_Users]">
    </asp:SqlDataSource>
    <table class="style1">
        <tr>
            <td>
                <asp:GridView ID="gvwScoreBoard" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataSourceID="dsUsers">
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="UserName" 
                            SortExpression="UserName" />
                        <asp:BoundField DataField="userShares" HeaderText="userShares" ReadOnly="True" 
                            SortExpression="userShares" />
                        <asp:BoundField DataField="ShareWorth" HeaderText="ShareWorth" ReadOnly="True" 
                            SortExpression="ShareWorth" />
                        <asp:BoundField DataField="Cash" HeaderText="Cash" SortExpression="Cash" />
                        <asp:BoundField DataField="NetWorth" HeaderText="NetWorth" ReadOnly="True" 
                            SortExpression="NetWorth" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Chart ID="Chart1" runat="server" DataSourceID="dsUsers">
                    <Series>
                        <asp:Series ChartType="Pie" Name="Series1" YValueMembers="NetWorth" 
                            XValueMember="UserName">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </td>
        </tr>
    </table>
    <br />

</asp:Content>

