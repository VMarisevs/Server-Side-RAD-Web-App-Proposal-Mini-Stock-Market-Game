<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewStocks.aspx.cs" Inherits="Guest_ViewStocks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                <asp:ControlParameter ControlID="gvCompanies" Name="Id" 
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
                <asp:GridView ID="gvCompanies" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataSourceID="dsCompanies" ForeColor="Black" GridLines="Horizontal" 
                    DataKeyNames="Id" BackColor="White" BorderColor="#CCCCCC" 
                    BorderStyle="None" BorderWidth="1px" Height="327px" PageSize="5" Width="356px">
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
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerSettings Mode="NextPrevious" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
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
                <asp:DetailsView ID="dvCompanies" runat="server" AutoGenerateRows="False" 
                    DataSourceID="dsCompaniesDetailed" Height="50px" Width="717px" 
        CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" 
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" DataKeyNames="Id">
                    <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
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
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
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

