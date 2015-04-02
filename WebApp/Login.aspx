<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Guest_Login" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel runat="server" ID="Panel1" Width="230px">
    <div style="width:230px;">
        <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/Default.aspx" 
            Width="225px" BackColor="#FDFFCC" BorderColor="#B5C7DE" BorderPadding="20" 
            BorderWidth="3px" Font-Names="Tahoma" Font-Size="1.1em" ForeColor="#333333" 
            TextLayout="TextOnTop" BorderStyle="Dashed" >
            <CheckBoxStyle Width="200px" />
            <HyperLinkStyle Width="200px" />
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" Width="200px" />
            <LabelStyle Width="250px" />
            <FailureTextStyle Width="200px" />
            <LoginButtonStyle 
    ForeColor="black" 
    font-size="1em" 
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
    </asp:Panel>

    <cc1:AlwaysVisibleControlExtender ID="Panel1_AlwaysVisibleControlExtender" 
        runat="server" BehaviorID="Panel1_AlwaysVisibleControlExtender" 
        HorizontalSide="Center" TargetControlID="Panel1" UseAnimation="false" 
        VerticalSide="Middle" />

<%--Panels stack up for some reason--%>
<%--         <asp:Panel runat="server" ID="createPanel" Width="230px" style="float:right">
         <div style="width:200px;margin-left:30%;">
    
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
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" />
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server" />
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
             <cc1:AlwaysVisibleControlExtender ID="cuwCreateUserAccount_AlwaysVisibleControlExtender" 
                 runat="server" BehaviorID="cuwCreateUserAccount_AlwaysVisibleControlExtender" 
                 TargetControlID="cuwCreateUserAccount" />
     </div>
     </asp:Panel>

    <cc1:AlwaysVisibleControlExtender ID="createPanel_AlwaysVisibleControlExtender" 
        runat="server" BehaviorID="Panel2_AlwaysVisibleControlExtender" 
        HorizontalSide="Right" TargetControlID="createPanel" VerticalSide="Bottom" 
        UseAnimation="True"/>--%>

</asp:Content>

