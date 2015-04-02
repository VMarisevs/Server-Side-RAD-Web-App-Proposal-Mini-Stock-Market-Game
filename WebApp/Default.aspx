<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
        }
        .style2
        {
            width: 8%;
        }
        .style3
        {
            width:35%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    
    <table border="0" cellpadding="5" frame="void">
        <tr>
             <td class="style1" >
                <h1>Welcome
                 </h1>
                 <p>
                     Welcome to Stock Street! The fast paced stock trading game.<br />
                     Become the ultimate stock trading legend by buying low and selling high.</p>
                 <p>
                     Stocks dynamically change in real time, 
                     <br />
                     so make sure to refresh the page often to 
                     check out the latest stock prices!</p>
                 <p>
                     So what Are you waiting for? Get trading!
                 </p>
                 </td>

                 <td></td>

                 <td valign="top">
                                  <h1>Latest Activity
                 </h1>
                 <asp:GridView ID="gwActivity" runat="server" AllowPaging="True" 
                     AutoGenerateColumns="False" CellPadding="4" DataSourceID="dsUsers" 
                     ForeColor="#333333" GridLines="None">
                     <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                     <Columns>
                         <asp:BoundField DataField="UserName" HeaderText="UserName" 
                             SortExpression="UserName" >
                         </asp:BoundField>
                         <asp:BoundField DataField="LastActivityDate" HeaderText="LastActivityDate" 
                             SortExpression="LastActivityDate" >
                         </asp:BoundField>
                     </Columns>
                     <EditRowStyle BackColor="#999999" />
                     <FooterStyle BackColor="#008FBF" Font-Bold="True" ForeColor="White" />
                     <HeaderStyle BackColor="#00BFFF" Font-Bold="True" ForeColor="White" />
                     <PagerSettings Mode="NextPreviousFirstLast" />
                     <PagerStyle BackColor="#008FBF" ForeColor="White" HorizontalAlign="Center" />
                     <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                     <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                     <SortedAscendingCellStyle BackColor="#E9E7E2" />
                     <SortedAscendingHeaderStyle BackColor="#506C8C" />
                     <SortedDescendingCellStyle BackColor="#FFFDF8" />
                     <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                 </asp:GridView>

                 

            <asp:SqlDataSource ID="dsUsers" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
                     SelectCommand="SELECT [UserName], [LastActivityDate] FROM [vw_aspnet_Users] ORDER BY [LastActivityDate] DESC"></asp:SqlDataSource>
                 </td>
        </tr>
        <tr>
             <td class="style1" colspan="3" >
                              <hr />
                 </td>

        </tr>
        <tr>
             <td class="style1" valign="top">
                <h1>News
                </h1>
                <asp:ListView ID="lvwNews" runat="server" DataSourceID="dsNews" 
                     style="text-align: left">
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <ItemTemplate>
                    <div>
                        <div>
                            <asp:Label ID="NewsTextLabel" runat="server" Text='<%# Eval("NewsText") %>' />                            
                        </div>
                        <div>
                            <div style="font-size:10pt;text-align:right;font-weight:bold;">
                                <br />
                                Posted:
                                <asp:Label ID="PostDateLabel" runat="server" Text='<%# Eval("PostDate") %>' />
                                <br />
                                 Updated:
                                <asp:Label ID="UpdateDateLabel" runat="server" Text='<%# Eval("UpdateDate") %>' />
                            </div>
                            <hr />
                        </div>
                    </div>
                    <br /><br /><br />
                </ItemTemplate>
                <LayoutTemplate>
                    <div ID="itemPlaceholderContainer" runat="server" style="text-align:left">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="">
                    </div>
                </LayoutTemplate>               
            </asp:ListView>

            <asp:SqlDataSource ID="dsNews" runat="server" 
                ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
                DataSourceMode="DataReader" 
                SelectCommand="SELECT [NewsText], [PostDate], [UpdateDate] FROM [News]">
            </asp:SqlDataSource>

            </td>
             <td class="style2">
                 &nbsp;</td>
            <td class="style3" valign="top">
                 <h1>&nbsp;User Distribution</h1>

                 
                 <!--Graph here Vytas-->
                     <asp:Chart ID="Chart1" runat="server" DataSourceID="dsUsers">
                         <Series>
                             <asp:Series ChartType="Doughnut" Name="Series1" 
                                 YValueMembers="LastActivityDate" YValuesPerPoint="6">
                             </asp:Series>
                         </Series>
                         <ChartAreas>
                             <asp:ChartArea Name="ChartArea1">
                             </asp:ChartArea>
                         </ChartAreas>
                     </asp:Chart>
            </td>
        </tr>
        <tr><td> &nbsp;</td></tr>
                <tr>
             <td class="style1" >
                <!--This shows the amount of page hits for this application -->
                 <h3>
                <asp:Label ID="lblAppHitCount" runat="server" Text="UserId" ForeColor="#D64960"/>
                 </h3>
              </td>

                 <td>

                 </td>

                 <td valign="top">
                    <!--This shows the amount of page hits for this user session -->
                     <h3>
                    <asp:Label ID="lblSeshHitCount" runat="server" Text="UserId" ForeColor="#D64960"/>
                     </h3>
                 </td>
        </tr>
        </table>
</asp:Content>

