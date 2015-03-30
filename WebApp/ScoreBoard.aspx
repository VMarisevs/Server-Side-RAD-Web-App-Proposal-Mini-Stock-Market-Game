<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ScoreBoard.aspx.cs" Inherits="ScoreBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Score Board
    </h1>
    <asp:SqlDataSource ID="dsUsers" runat="server" 
        ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
        SelectCommand="SELECT [UserName], [LastActivityDate] FROM [vw_aspnet_Users] ORDER BY [LastActivityDate] DESC">
    </asp:SqlDataSource>
    <asp:GridView ID="gwScores" runat="server">
    </asp:GridView>
    <br />

</asp:Content>

