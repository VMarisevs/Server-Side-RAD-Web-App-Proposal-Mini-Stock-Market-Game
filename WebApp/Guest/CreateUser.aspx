<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="Guest_CreateUser" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:Panel runat="server" ID="createUserPanel" style="width:200px;">
    <div style="width:200px;">
    <asp:CreateUserWizard ID="cuwCreateUserAccount" runat="server" 
        ContinueDestinationPageUrl="~/Default.aspx" 
        oncreateduser="cuwCreateUserAccount_CreatedUser" BackColor="#FDFFCC" 
        BorderColor="#B5C7DE" CellPadding="10" Font-Names="Tahoma" Font-Size="1.1em" 
        Width="400px" BorderStyle="Dashed">
        <ContinueButtonStyle BackColor="White" BorderColor="#507CD1" 
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
            ForeColor="#284E98" />
        <CreateUserButtonStyle  
    ForeColor="black" 
    font-size="1em" 
    BackColor="#E8E8E8"
    Font-Names="Tahoma"
    Width="150px"
    BorderColor="#00BFFF"
    BorderStyle="Solid"
    BorderWidth="2px" />
        <TextBoxStyle Font-Size="1.1em" />
        <TitleTextStyle Font-Bold="True" Font-Size="1.1em" ForeColor="DeepSkyBlue" 
            Height="20px" Width="350px" Wrap="True" />
        <WizardSteps>
            <asp:CreateUserWizardStep runat="server" />
            <asp:CompleteWizardStep runat="server" />
        </WizardSteps>
        <HeaderStyle BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" 
            Font-Size="1.1em" Font-Underline="False" ForeColor="White" 
            HorizontalAlign="Center" />
        <NavigationButtonStyle BackColor="White" BorderColor="#507CD1" 
            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
            ForeColor="#284E98" />
        <SideBarButtonStyle BackColor="#507CD1" Font-Names="Verdana" 
            ForeColor="White" />
        <SideBarStyle BackColor="#507CD1" Font-Size="1.1em" VerticalAlign="Top" />
        <StepStyle Font-Size="0.9em" />
       
    </asp:CreateUserWizard>
     </div>
     </asp:Panel>
    <cc1:AlwaysVisibleControlExtender ID="createUserPanel_AlwaysVisibleControlExtender" 
        runat="server" BehaviorID="createUserPanel_AlwaysVisibleControlExtender" 
        HorizontalSide="Center" TargetControlID="createUserPanel" UseAnimation="false" 
        VerticalSide="Middle">
    </cc1:AlwaysVisibleControlExtender>
</asp:Content>

