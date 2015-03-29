<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="Footer_About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            text-align: center;
        }
        .style3
        {
            width: 107px;
        }
        .style4
        {
            font-family: "Times New Roman", Times, serif;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style2" colspan="2">
                <h1 class="style4">
                    ZomboCorp Team</h1>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Image ID="Image1" runat="server" Height="100px" 
                    ImageUrl="~/Images/ronanCircle.png" Width="100px" />
            </td>
            <td style="text-align: left; vertical-align: top;">
                <span class="style4">
                <strong>CEO/Designer</strong> Ronan O Conghaile (<em>The Brain</em></span>)</td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Image ID="Image2" runat="server" Height="100px" 
                    ImageUrl="~/Images/Vlad.png" Width="100px" />
            </td>
            <td style="text-align: left; vertical-align: top;">
                <span class="style4">
                <strong>DB/Managment</strong> Vladislav Marshiev (<em>The Enforcer</em></span>)</td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Image ID="Image5" runat="server" Height="100px" 
                    ImageUrl="~/Images/Finn.png" Width="100px" />
            </td>
            <td style="text-align: left; vertical-align: top;">
                <strong>Logic/Grids</strong>&nbsp; Finn Williams (<em>The Problem Solver</em>)<br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Image ID="Image6" runat="server" Height="100px" 
                    ImageUrl="~/Images/Vytas.png" Width="100px" />
            </td>
            <td style="text-align: left; vertical-align: top;">
                <strong>Buisiness Analyst</strong> Vytas Vaiciulis (<em>The Muscle </em>)</td>
        </tr>
    </table>
</asp:Content>

