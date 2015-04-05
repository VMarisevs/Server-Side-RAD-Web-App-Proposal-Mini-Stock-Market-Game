<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Error500.aspx.cs" Inherits="Errors_Error500" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <h1>Error 500 - Internal server error
        </h1>
        <asp:Image ID="imgError" runat="server" ImageUrl="~/Images/poor.gif" AlternateText="Poor Man"/>

        <h3>Whoops there seems to have been an error.
        </h3>

        <p>
            <asp:Button ID="btnReturnHome" runat="server" Text="Return to the home page" 
                CssClass="buttonStyle" Width="200px" Height="40px" 
                onclick="btnReturnHome_Click" />
        </p>
    </div>
</asp:Content>

