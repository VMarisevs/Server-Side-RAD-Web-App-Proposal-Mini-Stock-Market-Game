<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="Footer_ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
        .style3
        {
            height: 23px;
        }
        .style4
        {
            height: 23px;
        }
p
	{margin-right:0cm;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";
	}
        .style5
        {
            font-size: xx-large;
        }
        .style6
        {
            font-size: large;
        }
        .style7
        {
            font-size: xx-large;
            width: 340px;
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
                <span class="style6">Main HeadQuartes of ZomboCorp Lcd.</span><br 
                    class="style6" />
                <span class="style6">Galway - Mayo Institute of Technology</span><br 
                    class="style6" />
                <span class="style6">Dublin Road, Galway</span></td>
            <td class="style6">
                hi@ronanconnolly.ie</td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <hr />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <br />
                <br />
                <span class="style6">Click to go to Google maps</span><br />
                <asp:ImageButton ID="ImageButton1" runat="server" Height="55px" 
                    ImageUrl="~/Images/btnStock.png" onclick="ImageButton1_Click" Width="199px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <hr />
            </td>
        </tr>
    </table>
</asp:Content>

