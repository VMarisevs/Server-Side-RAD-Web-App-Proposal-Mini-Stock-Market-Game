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
        <td class="style1">ZomboCorp Inc. stock price reaches record high of $800.</td>
        <td class="style2" >&nbsp;</td>
             <td rowspan="4" class="style3">
                 <asp:SqlDataSource ID="dsUsers" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
                     SelectCommand="SELECT [UserName], [LastActivityDate] FROM [vw_aspnet_Users] ORDER BY [LastActivityDate] DESC"></asp:SqlDataSource>
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
        <td class="style1">
            <hr />
            </td>
        <td class="style2">
            &nbsp;</td>
        </tr>
        <tr>
        <td class="style1">Vladislavs &quot;The Enforcer&quot; Marisevs reaches spiritual 
            enlightenment through normalizing rows. This DBA cares about each and every row 
            and nevers leaves them orphaned.</td>
        <td class="style2">&nbsp;</td>
        </tr>
        <tr>
        <td class="style1">
            <hr />
            </td>
        <td class="style2">
            &nbsp;</td>
        </tr>
        <tr>
        <td class="style1">Forest fire in the Leitrim district causes the Wood Material 
            stock to sky rocket!</td>
        <td class="style2">&nbsp;</td>
        </tr>
        <tr>
        <td class="style1">
            <hr />
            </td>
        <td class="style2">
            &nbsp;</td>
        </tr>
        <tr>
        <td class="style1">New theme park &quot;Fingtasia&quot; opens up in the Galway district, 
            only 9 bucks for entry, could this theme park possibly make it onto the stock 
            street?</td>
        <td class="style2">&nbsp;</td>
        </tr>
        <tr>
        <td class="style1">
            <hr />
            </td>
        <td class="style2">
            &nbsp;</td>
        </tr>
        <tr>
        <td class="style1">Oversupply of graduates causes the GMIT EDU stock price to 
            plumment, sell while you can!</td>
        <td class="style2">&nbsp;</td>
        </tr>
        </table>
</asp:Content>

