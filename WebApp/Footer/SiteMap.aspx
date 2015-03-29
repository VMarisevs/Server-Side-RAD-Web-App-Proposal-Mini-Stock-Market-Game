<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SiteMap.aspx.cs" Inherits="Footer_SiteMap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SiteMapDataSource ID="SiteMapDataSourceTree" runat="server" />
                <br />
<asp:TreeView ID="TreeView1" runat="server" 
    DataSourceID="SiteMapDataSourceTree" ShowLines="True">
</asp:TreeView>
                </asp:Content>

