<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SiteMap.aspx.cs" Inherits="Footer_SiteMap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- style="float:left;padding-left:50%;margin:20px;"-->
        <div>
            <asp:SiteMapDataSource ID="SiteMapDataSourceTree" runat="server" />
<%--            <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSourceTree" ShowLines="True" Font-Size="Larger" Width="80px" RootNodeStyle-Font-Bold="true" Font-Names="Tahoma"/>--%>
            <asp:TreeView ID="TreeView1" runat="server" 
                DataSourceID="SiteMapDataSourceTree" ShowLines="True" Font-Size="Larger" 
                Width="80px" RootNodeStyle-Font-Bold="true" Font-Names="Tahoma" 
                ImageSet="Simple">
                <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                <ParentNodeStyle Font-Bold="False" />
<RootNodeStyle Font-Bold="True"></RootNodeStyle>
                <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" 
                    HorizontalPadding="0px" VerticalPadding="0px" />
            </asp:TreeView>
    </div>


</asp:Content>

