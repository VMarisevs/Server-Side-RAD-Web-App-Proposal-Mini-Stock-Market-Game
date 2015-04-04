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
                    AllowSorting="True" AutoGenerateColumns="False" DataSourceID="dsUsers" 
                    CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="User" 
                            SortExpression="UserName" />
                        <asp:BoundField DataField="userShares" HeaderText="Shares" ReadOnly="True" 
                            SortExpression="userShares" />
                        <asp:BoundField DataField="ShareWorth" HeaderText="Share Worth" ReadOnly="True" 
                            SortExpression="ShareWorth" DataFormatString="{0:c}" />
                        <asp:BoundField DataField="Cash" HeaderText="Cash" SortExpression="Cash" 
                            DataFormatString="{0:c}" />
                        <asp:BoundField DataField="NetWorth" HeaderText="Net Worth" ReadOnly="True" 
                            SortExpression="NetWorth" DataFormatString="{0:c}" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#E8E8E8" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#00BFFF" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#E8E8E8" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Chart ID="Chart1" runat="server" DataSourceID="dsUsers" Height="500px" 
                    Width="500px">
                    <Series>
                        <asp:Series ChartType="Pie" Name="Series1" YValueMembers="NetWorth" 
                            XValueMember="UserName" YValuesPerPoint="6">
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

