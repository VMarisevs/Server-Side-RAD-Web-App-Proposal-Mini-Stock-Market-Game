<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="Footer_About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            text-align: center;
        }
        .style3
        {
        }
        .style4
        {
            font-family: "Times New Roman", Times, serif;
            background-color: #FFFFFF;
        }
        .style5
        {
            color: #FFFFFF;
        }
        .style6
        {
            color: #CC66FF;
        }
        .style7
        {
            font-size: x-large;
        }
        .style8
        {
            color: #FFFFFF;
            font-size: x-large;
        }
        .style9
        {
            text-align: left;
            vertical-align: top;
            font-family: "Times New Roman", Times, serif;
            color: #FFFFFF;
            background-color: #FFFFFF;
        }
        .style10
        {
            font-family: "Times New Roman", Times, serif;
            color: #000000;
            background-color: #FFFFFF;
        }
        .style11
        {
            color: #000000;
        }
        .style12
        {
            color: #000000;
            font-size: x-large;
        }
        .style13
        {
            height: 22px;
        }
        .style14
        {
            vertical-align: top;
            font-family: "Times New Roman", Times, serif;
            color: #FFFFFF;
            height: 22px;
            background-color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table >
        <tr>
            <td class="style2" colspan="2">
                <h1>
                    ZomboCorp Team</h1>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Image ID="Image1" runat="server" Height="100px" 
                    ImageUrl="~/Images/ronanCircle.png" Width="100px" />
            </td>
            <td class="style9">
                <strong><span class="style7">&nbsp; <span class="style11">CEO/Designer</span></span></strong><span 
                    class="style11"><span class="style7"><br />&nbsp;
                        Ronan O Conghaile 
                <br />
&nbsp; </span><em><span class="style7">(The Brain)</span></em></span></td>
        </tr>
        <tr>
            <td class="style13" colspan="2">
                <br />
                <hr />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Image ID="Image2" runat="server" Height="100px" 
                    ImageUrl="~/Images/Vlad.png" Width="100px" />
            </td>
            <td style="text-align: left; vertical-align: top; background-color: #FFFFFF;">
                <span class="style4">
                <strong><span class="style5">&nbsp; </span><span class="style6">&nbsp;</span><span 
                    class="style12">DB/Managment</span></strong><span class="style11"><span 
                    class="style7"> <br />&nbsp;&nbsp;Vladislav Marshiev 
                <br />
&nbsp; </span><em><span class="style7">(The Enforcer)</span></em></span></span></td>
        </tr>
        <tr>
            <td class="style3" colspan="2">
                <br />
                <hr />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Image ID="Image5" runat="server" Height="100px" 
                    ImageUrl="~/Images/Finn.png" Width="100px" />
            </td>
            <td style="text-align: left; vertical-align: top; background-color: #FFFFFF;">
                <strong><span class="style8">&nbsp; </span><span class="style12">Logic/Grids</span></strong><span 
                    class="style12"><br />&nbsp;&nbsp;Finn Williams<br />
&nbsp; </span><em><span class="style12">(The Problem Solver)</span></em><br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style3" colspan="2">
                <br />
                <hr />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Image ID="Image6" runat="server" Height="100px" 
                    ImageUrl="~/Images/Vytas.png" Width="100px" />
            </td>
            <td style="text-align: left; vertical-align: top; background-color: #FFFFFF;">
                <strong><span class="style8">&nbsp; </span><span class="style12">Business Analyst</span></strong><span 
                    class="style12"> <br />&nbsp;&nbsp;Vytas Vaiciulis 
                <br />
&nbsp; </span><em><span class="style12">(The Muscle)</span></em></td>
        </tr>
    </table>
</asp:Content>

