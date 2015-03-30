<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditUsers.aspx.cs" Inherits="Authorised_EditUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ObjectDataSource ID="dsUser" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllCategories" 
        TypeName="UserDB"></asp:ObjectDataSource>
    <asp:FormView ID="FormView1" runat="server" CellPadding="4" 
        DataSourceID="dsUser" ForeColor="#333333">
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderTemplate>
            <asp:Label ID="Label3" runat="server" Text="User Name:"></asp:Label>
            <asp:Label ID="lblUserName" runat="server" 
                Text='<%# Eval("UserName", "{0}") %>'></asp:Label>
        </HeaderTemplate>
        <ItemTemplate>
            <asp:Label ID="Label2" runat="server" Text='<%# Eval("RoleName", "{0}") %>'></asp:Label>
        </ItemTemplate>
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
    </asp:FormView>
</asp:Content>

