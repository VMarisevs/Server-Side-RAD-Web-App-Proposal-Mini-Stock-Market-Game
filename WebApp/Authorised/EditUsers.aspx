<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditUsers.aspx.cs" Inherits="Authorised_EditUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ObjectDataSource ID="dsUserShares" runat="server"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsUser" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllUsers" 
        TypeName="UserDB"></asp:ObjectDataSource>
    <asp:GridView ID="gvwUsers" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="dsUser" ForeColor="#333333" GridLines="None" 
        AllowPaging="True" Width="540px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="UserName" 
                SortExpression="UserName" />
            <asp:BoundField DataField="UserRole" HeaderText="UserRole" 
                SortExpression="UserRole" />
            <asp:BoundField DataField="UserLastActivity" HeaderText="UserLastActivity" 
                SortExpression="UserLastActivity" />
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:FormView ID="FormView1" runat="server" DataSourceID="dsUserShares">
        <ItemTemplate>
            <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("UserName", "{0}") %>'></asp:Label>
        </ItemTemplate>
    </asp:FormView>
    </asp:Content>

