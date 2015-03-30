<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="Footer_ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {            text-align: center;
        }
        .style3
        {
            height: 23px;
        }
        p
	{margin-right:0cm;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";
	}
        .style6
        {
            font-size: large;
            text-align: center;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>
                <h1>
                
                Contact Us
                </h1></td>
            <td>
                <h1>
                
                <strong>Email</strong></h1>
                </td>
        </tr>
        <tr>
            <td class="style3" colspan="2">
                <hr />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <span class="style6"><strong>ZomboCorp Inc. Main Headquarters:</strong></span><br 
                    class="style6" />
                <span class="style6"><em>Galway Mayo Institute of Technology</em></span><em><br 
                    class="style6" />
                </em>
                <span class="style6"><em>Dublin Road, Galway</em></span></td>
            <td class="style6">
                hi@ronanconnolly.ie</td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <hr />
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <br />
                <br />
                <span class="style6">Click below to view on map:</span><br />
                <asp:ImageButton ID="ImageButton1" runat="server" Height="55px" 
                    ImageUrl="~/Images/btnStock.png" onclick="ImageButton1_Click" Width="199px" />
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <hr />
            </td>
        </tr>
    </table>
</asp:Content>

