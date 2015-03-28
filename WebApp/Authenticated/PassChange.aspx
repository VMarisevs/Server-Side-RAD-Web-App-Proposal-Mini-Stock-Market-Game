<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PassChange.aspx.cs" Inherits="Authenticated_PassChange" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ChangePassword ID="ChangePassword1" runat="server" 
        CancelDestinationPageUrl="~/ScoreBoard.aspx" 
        ContinueDestinationPageUrl="~/ScoreBoard.aspx">
    </asp:ChangePassword>
</asp:Content>

