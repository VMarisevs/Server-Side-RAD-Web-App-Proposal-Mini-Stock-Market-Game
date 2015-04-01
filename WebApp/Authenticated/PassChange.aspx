<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PassChange.aspx.cs" Inherits="Authenticated_PassChange" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="passChangePanel" runat="server">

    <div style="border:3px dashed #b5c7de;padding:10px;background-color:#FDFFCC;width:450px;"> <!--style="display:block;padding:20px 20px 50px 20px; overflow:hidden"-->
    
    <asp:ChangePassword ID="ChangePassword1" runat="server" 
        CancelDestinationPageUrl="~/Default.aspx" 
        ContinueDestinationPageUrl="~/Default.aspx">
        <CancelButtonStyle         ForeColor="black" 
    font-size="1em" 
    BackColor="#E8E8E8"
    Font-Names="Tahoma"
    Width="150px"
    BorderColor="#00BFFF"
    BorderStyle="Solid"
    BorderWidth="2px"
     />
        <ChangePasswordButtonStyle 
    ForeColor="black" 
    font-size="1em" 
    BackColor="#E8E8E8"
    Font-Names="Tahoma"
    Width="150px"
    BorderColor="#00BFFF"
    BorderStyle="Solid"
    BorderWidth="2px" />
        <TitleTextStyle Font-Bold="True" ForeColor="#00BFFF" />
    </asp:ChangePassword>
    </div>
        </asp:Panel>
    <cc1:AlwaysVisibleControlExtender ID="passChangePanel_AlwaysVisibleControlExtender" 
        runat="server" BehaviorID="passChangePanel_AlwaysVisibleControlExtender" 
        TargetControlID="passChangePanel" UseAnimation="false" VerticalSide="Middle" HorizontalSide="Center">
    </cc1:AlwaysVisibleControlExtender>
</asp:Content>

