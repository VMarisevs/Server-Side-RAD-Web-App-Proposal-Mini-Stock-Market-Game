<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PassChange.aspx.cs" Inherits="Authenticated_PassChange" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="border:3px dashed #b5c7de;padding:10px;background-color:#FDFFCC;width:450px"> <!--style="display:block;padding:20px 20px 50px 20px; overflow:hidden"-->
    
    <asp:ChangePassword ID="ChangePassword1" runat="server" 
        CancelDestinationPageUrl="~/Default.aspx" 
        ContinueDestinationPageUrl="~/Default.aspx">
        <CancelButtonStyle BackColor="White" BorderColor="#0066FF" BorderStyle="Solid" 
            Font-Names="Tahoma" Font-Size="1em" />
        <ChangePasswordButtonStyle BackColor="White" BorderColor="#0066FF" 
            BorderStyle="Solid" Font-Names="Tahoma" Font-Size="1em" />
        <TitleTextStyle Font-Bold="True" ForeColor="#0066FF" />
    </asp:ChangePassword>
    </div>
</asp:Content>

