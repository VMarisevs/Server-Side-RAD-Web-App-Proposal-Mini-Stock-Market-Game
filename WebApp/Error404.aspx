<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Error404.aspx.cs" Inherits="error404" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <h1>Error 404
        </h1>
        <asp:Image ID="imgError" runat="server" ImageUrl="~/Images/poor.gif" AlternateText="Poor Man"/>

        <h3>Whoops there seems to be an error.
        </h3>
    </div>
</asp:Content>

