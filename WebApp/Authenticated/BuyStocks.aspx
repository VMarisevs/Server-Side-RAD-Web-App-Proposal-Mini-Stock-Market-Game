<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BuyStocks.aspx.cs" Inherits="Authenticated_BuyStocks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Buy Stocks
    </h1>
    <div>
        <asp:SqlDataSource ID="dsStocks" runat="server" 
            ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
            
            SelectCommand="SELECT Companies.Id, Companies.Name, Categories.longName, Companies.shareAmount, Companies.curprice FROM Categories INNER JOIN Companies ON Categories.Id = Companies.categoryId"></asp:SqlDataSource>
        <asp:GridView ID="gwBuyStocks" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataSourceID="dsStocks" ForeColor="#333333" GridLines="None" 
            DataKeyNames="Id">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" 
                    InsertVisible="False" ReadOnly="True" Visible="False" />
                <asp:BoundField DataField="Name" HeaderText="Company" 
                    SortExpression="Name" />
                <asp:BoundField DataField="longName" HeaderText="Category" 
                    SortExpression="longName" />
                <asp:BoundField DataField="shareAmount" HeaderText="Available Shares" 
                    SortExpression="shareAmount" />
                <asp:BoundField DataField="curprice" HeaderText="Price" 
                    SortExpression="curprice" />
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
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
        
        <br />
        <asp:SqlDataSource ID="dsStocksDetails" runat="server" 
            ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
            SelectCommand="SELECT Companies.Id, Companies.Name, Companies.Abbreviation, Companies.logo, Categories.shortName, Companies.curprice, Companies.shareAmount, Companies.shortDescription, Companies.longDescription FROM Categories INNER JOIN Companies ON Categories.Id = Companies.categoryId WHERE (Companies.Id = @ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="gwBuyStocks" Name="ID" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            CellPadding="4" DataKeyNames="Id" DataSourceID="dsStocksDetails" 
            ForeColor="#333333" GridLines="None" Height="50px" Width="800px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="Id" Visible="False" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Abbreviation" HeaderText="Abbreviation" 
                    SortExpression="Abbreviation" />
                <asp:BoundField DataField="logo" HeaderText="logo" SortExpression="logo" />
                <asp:BoundField DataField="shortName" HeaderText="shortName" 
                    SortExpression="shortName" />
                <asp:BoundField DataField="curprice" HeaderText="curprice" 
                    SortExpression="curprice" />
                <asp:BoundField DataField="shareAmount" HeaderText="shareAmount" 
                    SortExpression="shareAmount" />
                <asp:BoundField DataField="shortDescription" HeaderText="shortDescription" 
                    SortExpression="shortDescription" Visible="False" />
                <asp:BoundField DataField="longDescription" HeaderText="longDescription" 
                    SortExpression="longDescription" />
                <asp:ButtonField ButtonType="Button" Text="Buy" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
    </div>
</asp:Content>

