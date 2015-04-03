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
                <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server"  onclick="Button1_Click" Text="Buy" />
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
        <asp:SqlDataSource ID="dsCompany" runat="server" 
            ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
            SelectCommand="SELECT [shareAmount], [curprice] FROM [Companies] WHERE ([Id] = @Id)" 
            
            
            UpdateCommand="UPDATE Companies SET shareAmount = shareAmount - 1 WHERE (Id = @id)">
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        <br />
    </div>
</asp:Content>

