<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BuyStocks.aspx.cs" Inherits="Authenticated_BuyStocks" %>
<%@ MasterType virtualpath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--This directive causes the content page's Master property to be strongly typed.-->
    <%--<%@ MasterType virtualpath="~/Master1.master" %>--%>

    <h1>Buy Stocks</h1>
    <p>
        <asp:Label ID="lblUserId" runat="server" Text="UserId"></asp:Label>
&nbsp;</p>
    <div>
        <asp:SqlDataSource ID="dsStocks" runat="server" 
            ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
            
            SelectCommand="SELECT Companies.Id, Companies.Name, Categories.longName, Companies.shareAmount, Companies.curprice FROM Categories INNER JOIN Companies ON Categories.Id = Companies.categoryId"></asp:SqlDataSource>
        <asp:GridView ID="gwBuyStocks" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataSourceID="dsStocks" ForeColor="#333333" GridLines="None" 
            DataKeyNames="Id" 
            onselectedindexchanged="gwBuyStocks_SelectedIndexChanged">
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
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button2" runat="server" CausesValidation="False" 
                            CommandName="Select" Text="Select" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandName="Select"
                             onclick="Button1_Click" Text="Buy" />
                    </ItemTemplate>
                </asp:TemplateField>
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
        <asp:SqlDataSource ID="dsBuy" runat="server" 
            ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
            InsertCommand="INSERT INTO TransactionHistory(userId, sharesAmount, buySell, companyId, priceBought, priceSold) VALUES (@userId, @sharesAmount, @buySell, @companyId, @priceBought, @priceSold)" 
            SelectCommand="SELECT aspnet_Users.UserId AS [User Id], aspnet_Users.UserName AS [User Name], aspnet_Users.Cash AS [User Cash], Companies.curprice AS [Stock Price], Companies.shareAmount AS [Stock Available] FROM aspnet_Users INNER JOIN UserShares ON aspnet_Users.UserId = UserShares.userId INNER JOIN Companies ON UserShares.companyId = Companies.Id WHERE (aspnet_Users.UserId = @userId)" 
            UpdateCommand="UPDATE Companies SET shareAmount = shareAmount - 1 WHERE (Id = @companyId)">
            <InsertParameters>
                <asp:Parameter Name="userId" />
                <asp:Parameter Name="sharesAmount" />
                <asp:Parameter Name="buySell" />
                <asp:Parameter Name="companyId" />
                <asp:Parameter Name="priceBought" />
                <asp:Parameter Name="priceSold" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="gwBuyStocks" Name="userId" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="companyId" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsCompany" runat="server" 
            ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
            onselected="dsCompany_Selected" 
            SelectCommand="SELECT [shareAmount], [curprice] FROM [Companies] WHERE ([Id] = @Id)" 
            
            UpdateCommand="UPDATE Companies SET shareAmount = shareAmount - 1 WHERE (Id = @id)" 
            onselecting="dsCompany_Selecting">
            <SelectParameters>
                <asp:ControlParameter ControlID="gwBuyStocks" DefaultValue="" Name="Id" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="id" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        
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

