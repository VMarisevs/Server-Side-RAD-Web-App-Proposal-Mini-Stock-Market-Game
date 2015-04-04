<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Beg.aspx.cs" Inherits="Authenticated_beg" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <h1>Ooh a penny
        </h1>
      
        <asp:Panel runat="server">
<%--         <asp:Image ID="imgCoin" runat="server" ImageUrl="~/Images/coin.png" Height="70px" 
                Width="70px"/>
            <asp:Button ID="btnBeg" runat="server" Text="Button" CssClass="buttonStyle" 
                Height="100px" Width="100px" />--%>

            <asp:ImageButton ID="imgButBeg" runat="server"  ImageUrl="~/Images/coinPadded.png" 
                Width="150px" CssClass="buttonStyle" BorderWidth="5px" 
                ImageAlign="Middle" onclick="imgButBeg_Click" />
        </asp:Panel>

        <asp:SqlDataSource ID="dsBeg" runat="server" 
            ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
            SelectCommand="SELECT Cash FROM aspnet_Users WHERE (UserId = @userId)" 
            UpdateCommand="UPDATE aspnet_Users SET Cash = Cash + 1 WHERE (UserId = @userId)" >
            <SelectParameters>
                <asp:ControlParameter ControlID="lblBeg" Name="userId" PropertyName="Text" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="userId" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <asp:Label ID="lblBeg" runat="server" Text="Beg" />
</asp:Content>

