<<<<<<< HEAD:WebApp/ViewStocks.aspx
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewStocks.aspx.cs" Inherits="Guest_ViewStocks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>View Stocks
    </h1>
    <p>
        <asp:SqlDataSource ID="dsCompanies" runat="server" 
            ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
            
            
            SelectCommand="SELECT [Name], [curprice], [Id] FROM [Companies] 

WHERE categoryId = CASE  @categoryId 
WHEN '-1'  THEN categoryId 
ELSE @categoryId 
END">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlCategories" DefaultValue="-1" 
                    Name="categoryId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsCategories" runat="server" 
            ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
            
            SelectCommand="SELECT [longName], [Id] FROM [Categories] ORDER BY [longName]">
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="dsCompaniesDetailed" runat="server" 
            ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
            SelectCommand="SELECT * FROM [Companies] Where [Id] = @Id">
            <SelectParameters>
                <asp:ControlParameter ControlID="gvwCompanies" Name="Id" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

</p>
    <p>
        <asp:DropDownList ID="ddlCategories" runat="server" AutoPostBack="True" 
            DataSourceID="dsCategories" DataTextField="longName" DataValueField="Id" 
            AppendDataBoundItems="True">
            <asp:ListItem Value="-1">All</asp:ListItem>
        </asp:DropDownList>
    </p>
    <table class="style2">
        <tr>
            <td class="style3">
                <asp:GridView ID="gvwCompanies" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataSourceID="dsCompanies" ForeColor="#333333" GridLines="None" 
                    DataKeyNames="Id" Height="327px" PageSize="5" Width="356px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="curprice" HeaderText="Share Price" 
                            SortExpression="curprice" DataFormatString=" {0:c}" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" >
                        <ControlStyle Width="80px" />
                        </asp:CommandField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
                <asp:DetailsView ID="dvwCompanies" runat="server" AutoGenerateRows="False" 
                    DataSourceID="dsCompaniesDetailed" Height="50px" Width="717px" 
        CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="Id">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="Name" HeaderText="Name" 
                            SortExpression="Name" />
                        <asp:BoundField DataField="curprice" HeaderText="Share Price:" 
                            SortExpression="curprice" DataFormatString=" {0:c}" />
                        <asp:BoundField DataField="shareAmount" HeaderText="Available Shares:" 
                            SortExpression="shareAmount" />
                        <asp:BoundField DataField="longDescription" HeaderText="Information:" 
                            SortExpression="longDescription" />
                    </Fields>
                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                </asp:DetailsView>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
    <br />
</p>
<p>
</p>
<p>
</p>
<p>
</p>
</asp:Content>

=======
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ViewStocks.aspx.cs" Inherits="Guest_ViewStocks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style4
        {
            height: 36px;
        }
        .style5
        {
            height: 36px;
        }
        .style3
        {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        View Stocks
    </h1>
    <p>
        <asp:SqlDataSource ID="dsCompanies" runat="server" ConnectionString="<%$ ConnectionStrings:GameConnectionString %>"
            SelectCommand="SELECT   Companies.Name, Companies.Abbreviation, Companies.curprice, Companies.shareAmount, Categories.longName 
                            FROM Companies INNER JOIN Categories 
                            ON Companies.categoryId = Categories.Id 
                            WHERE ([Name] LIKE '%' + @Name + '%')
                            AND  categoryId = CASE  @categoryId 
                            WHEN '-1'  THEN  categoryId 
                            ELSE @categoryId 
                            END 

                            ORDER BY [Name] ">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtSearch" DefaultValue="%" Name="Name" PropertyName="Text" />
                <asp:ControlParameter ControlID="ddlCategories" DefaultValue="-1" Name="categoryId"
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsCategories" runat="server" ConnectionString="<%$ ConnectionStrings:GameConnectionString %>"
            SelectCommand="SELECT [longName], [Id] FROM [Categories] ORDER BY [longName]">
        </asp:SqlDataSource>
    </p>
        <table width ="100%"  class="style2">
            <tr>
                <td class="style4" align="right">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;
                    </td>
                <td class="style4" align="right" style="text-align: right; float: right;">
                    <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search"
                        Font-Names="Tahoma" Font-Size="Medium" Style="margin-top: 4px" Width="66px" />
                </td>
            </tr>
            <tr>
                <td class="style3" align="right">
                    &nbsp;
                    </td>
                <td class="style3" align="right">
                    <asp:DropDownList ID="ddlCategories" runat="server" AutoPostBack="True" DataSourceID="dsCategories"
                        DataTextField="longName" DataValueField="Id" AppendDataBoundItems="True" Width="255px"
                        Height="16px" Style="margin-left: 89px">
                        <asp:ListItem Value="-1">All</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style3" align="center" colspan="2" >
                    <asp:GridView ID="gvwCompanies0" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" CellPadding="4" DataSourceID="dsCompanies" ForeColor="#333333"
                        GridLines="None" PageSize="5" Width="1000px" Font-Names="Tahoma">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="Abbreviation" HeaderText="Name" 
                                SortExpression="Abbreviation">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Name" SortExpression="Name">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="curprice" HeaderText="Share Price" 
                                SortExpression="curprice">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="shareAmount" HeaderText="shareAmount" SortExpression="shareAmount">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="longName" HeaderText="Category" 
                                SortExpression="longName" >
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Height="30px" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" Height="20px" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="40px" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
</asp:Content>
>>>>>>> origin/master:WebApp/Guest/ViewStocks.aspx
