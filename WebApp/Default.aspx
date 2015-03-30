<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 47%;
        }
        .style2
        {
            width: 8%;
        }
        .style3
        {
            width:35%;
        }
        .style4
        {
            width: 35%;
        }
        .style5
        {
            width: 47%;
        }
        .style6
        {
            width: 8%;
            height: 340px;
        }
        .style7
        {
            width: 35%;
            height: 340px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    
    <table border="0" cellpadding="5" frame="void">
        <tr>
             <td class="style1">
                <h1>News
                </h1>
            </td>
             <td class="style2">
                 &nbsp;</td>
            <td class="style3">
                 <h1>Latest Activity
                 </h1>
            </td>
        </tr>
        <tr>
             <td class="style5">
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
            </td>
             <td class="style6">
                 </td>
            <td class="style7" style="vertical-align:top;">
                 <asp:GridView ID="gwActivity" runat="server" AllowPaging="True" 
                     AutoGenerateColumns="False" CellPadding="4" DataSourceID="dsUsers" 
                     ForeColor="#333333" GridLines="None">
                     <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                     <Columns>
                         <asp:BoundField DataField="UserName" HeaderText="User Name" 
                             SortExpression="UserName" >
                         <ItemStyle HorizontalAlign="Center" />
                         </asp:BoundField>
                         <asp:BoundField DataField="LastActivityDate" HeaderText="Last Activity Date" 
                             SortExpression="LastActivityDate" >
                         <ItemStyle HorizontalAlign="Center" />
                         </asp:BoundField>
                     </Columns>
                     <EditRowStyle BackColor="#999999" />
                     <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                     <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                     <PagerSettings Mode="NextPreviousFirstLast" />
                     <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
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
        <td class="style1" rowspan="2">
            <asp:SqlDataSource ID="dsNews" runat="server" 
                ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
                DataSourceMode="DataReader" 
                SelectCommand="SELECT [NewsText], [PostDate], [UpdateDate] FROM [News]">
            </asp:SqlDataSource>
            </td>
        <td class="style2" rowspan="2" >&nbsp;</td>
             <td class="style4">
                 <asp:SqlDataSource ID="dsUsers" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
                     SelectCommand="SELECT [UserName], [LastActivityDate] FROM [vw_aspnet_Users] ORDER BY [LastActivityDate] DESC"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
             <td class="style3">
                 &nbsp;</td>
        </tr>
        <tr>
        <td class="style1">
            &nbsp;</td>
        <td class="style2" >&nbsp;</td>
             <td class="style3">
                 &nbsp;</td>
        </tr>
        </table>
</asp:Content>

