<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Guest_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:230px">
        <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/Default.aspx" 
            Width="225px" BackColor="#FDFFCC" BorderColor="#B5C7DE" BorderPadding="20" 
            BorderWidth="3px" Font-Names="Tahoma" Font-Size="1.1em" ForeColor="#333333" 
            TextLayout="TextOnTop" BorderStyle="Dashed">
            <CheckBoxStyle Width="200px" />
            <HyperLinkStyle Width="200px" />
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" Width="200px" />
            <LabelStyle Width="250px" />
            <FailureTextStyle Width="200px" />
            <LoginButtonStyle     font-size="1em" 
    BackColor="#E8E8E8"
    Font-Names="Tahoma"
    Width="150px"
    BorderColor="#00BFFF"
    BorderStyle="Solid"
    BorderWidth="2px" />
            <TextBoxStyle BackColor="White" Font-Size="0.8em" Width="200px" />
            <TitleTextStyle Font-Bold="True" Font-Size="1.1em" ForeColor="#00BFFF" 
                HorizontalAlign="Center" Width="200px" />
            <ValidatorTextStyle Width="200px" />
        </asp:Login>
    </div>


</asp:Content>

