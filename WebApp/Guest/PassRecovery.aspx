<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PassRecovery.aspx.cs" Inherits="Guest_PassRecovery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:PasswordRecovery ID="PasswordRecovery1" runat="server">
        <MailDefinition From="vytasvaiciulisgti@gmail.com">
        </MailDefinition>
    </asp:PasswordRecovery>
</asp:Content>

