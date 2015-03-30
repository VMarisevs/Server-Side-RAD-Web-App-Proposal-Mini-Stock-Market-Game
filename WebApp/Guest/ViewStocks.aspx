<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
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
