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
    <%--    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:Timer ID="Timer1" runat="server" Interval="2000"/>--%>
    <h1>Score Board
    </h1>
<%--        <p>
         <asp:UpdatePanel ID="btnUpdatePanel" runat="server" UpdateMode="Always">
            <ContentTemplate>
                <asp:Timer ID="Timer1" runat="server" Interval="2000" />
            <asp:Button ID="btnRefresh" runat="server" CssClass="buttonStyle" 
                onclick="btnRefresh_Click" Text="Refresh" ondisposed="btnRefresh_Disposed" 
                    oncommand="btnRefresh_Command" ondatabinding="btnRefresh_DataBinding" 
                    oninit="btnRefresh_Init" onload="btnRefresh_Load" 
                    onprerender="btnRefresh_PreRender" onunload="btnRefresh_Unload" />
       </ContentTemplate>
        </asp:UpdatePanel>
        </p>--%>
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
      
  FROM [StockMarketGame].[dbo].[aspnet_Users]
ORDER BY NetWorth DESC">
    </asp:SqlDataSource>


    <table class="style1">
        <tr>
            <td>

             <asp:UpdatePanel ID="gvwUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Timer ID="gvwTimer" runat="server" Interval="2000" />
                <asp:GridView ID="gvwScoreBoard" runat="server" AutoGenerateColumns="False" DataSourceID="dsUsers"
                    CellPadding="4" ForeColor="#333333" GridLines="None" 
                        onselectedindexchanged="gvwScoreBoard_SelectedIndexChanged" 
                    onload="gvwScoreBoard_Load" AllowPaging="True" AllowSorting="True">
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
                                 </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                 <asp:UpdatePanel ID="chartUpdatePanel" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                <asp:Timer ID="chartTimer" runat="server" Interval="10000" />
                <asp:Chart ID="scoreChart" runat="server" DataSourceID="dsUsers" Height="500px" 
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
                 </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <br />

</asp:Content>

