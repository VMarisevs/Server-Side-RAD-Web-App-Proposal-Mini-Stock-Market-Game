<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PassRecovery.aspx.cs" Inherits="Guest_PassRecovery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:300px">
        <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" BackColor="#FDFFCC" 
            BorderPadding="20" BorderStyle="Dashed" BorderWidth="3px" Font-Size="1.1em" 
            Width="200px">
            <SubmitButtonStyle BackColor="White" BorderStyle="Solid" Font-Size="1em" 
                Width="120px" />
            <LabelStyle HorizontalAlign="Center" Width="150px" Wrap="False" />
            <MailDefinition From="hi@ronanconnolly.ie" BodyFileName="StockSt" 
                Subject="StockSt">
            </MailDefinition>
            <TextBoxStyle Width="200px" />
            <TitleTextStyle Font-Bold="True" ForeColor="#0066FF" Width="250px" 
                HorizontalAlign="Center" />
        </asp:PasswordRecovery>
    </div>
</asp:Content>

