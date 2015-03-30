<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BuyStocks.aspx.cs" Inherits="Authenticated_BuyStocks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Buy Stocks
    </h1>
    <div>
        <asp:SqlDataSource ID="dsStocks" runat="server" 
            ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
            SelectCommand="SELECT Companies.Name, Categories.longName, Companies.shareAmount, Companies.curprice FROM Categories INNER JOIN Companies ON Categories.Id = Companies.categoryId"></asp:SqlDataSource>
        <asp:GridView ID="gwBuyStocks" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataSourceID="dsStocks" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="longName" HeaderText="longName" 
                    SortExpression="longName" />
                <asp:BoundField DataField="shareAmount" HeaderText="shareAmount" 
                    SortExpression="shareAmount" />
                <asp:BoundField DataField="curprice" HeaderText="curprice" 
                    SortExpression="curprice" />
                <asp:CommandField ButtonType="Button" EditText="Buy" ShowCancelButton="False" 
                    ShowSelectButton="True">
                <ControlStyle BackColor="#E8E8E8" BorderColor="#00BFFF" BorderStyle="Solid" 
                    BorderWidth="2px" Font-Names="Tahoma" Width="100px" />
                </asp:CommandField>
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
        
        
    </div>
</asp:Content>

