<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Footer_Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<<<<<<< HEAD

    <style type="text/css">
        .style3
        {
            vertical-align:top;
        }
    </style>

=======
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            text-align: center;
        }
p.MsoListParagraph
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:36.0pt;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	}
        .style3
        {
            width: 580px;
            font-weight: 700;
        }
    </style>
>>>>>>> origin/master
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div > <!--style="display:block;padding:20px 20px 50px 20px; overflow:hidden"-->
    <table class="style1" style="height:100%;overflow:hidden">
        <tr>
            <td colspan="2">
                <h1 class="style2">
                    Feedback Form</h1>
            </td>
        </tr>
        <tr>
            <td class="style3">
&nbsp;&nbsp; 1.&nbsp; On which devices did you access the website ? (can tick more than one)</td>
            <td>
                <asp:CheckBoxList ID="CheckBoxList1" runat="server">
                    <asp:ListItem Value="0">Mobile</asp:ListItem>
                    <asp:ListItem Value="1">PC</asp:ListItem>
                    <asp:ListItem Value="2">Tablet</asp:ListItem>
                    <asp:ListItem Value="3">Laptop</asp:ListItem>
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <span style="font-size:11.0pt;line-height:115%;
font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:
Calibri;mso-fareast-theme-font:minor-latin;mso-hansi-theme-font:minor-latin;
mso-bidi-font-family:&quot;Times New Roman&quot;;mso-bidi-theme-font:minor-bidi;
mso-ansi-language:EN-IE;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">&nbsp;</span></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;&nbsp; 3.&nbsp; How did you first learn about our website ?&nbsp;</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Value="0">Advertisement</asp:ListItem>
                    <asp:ListItem Value="1">Word of Mouth</asp:ListItem>
                    <asp:ListItem Value="2">Email</asp:ListItem>
                    <asp:ListItem Value="3">Search Engine</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
&nbsp;&nbsp; 2.&nbsp; Whats your access media to Internet ?</td>
            <td>
                <asp:ListBox ID="ListBox1" runat="server">
                    <asp:ListItem Value="0">Dial-Up</asp:ListItem>
                    <asp:ListItem Value="1">Cable</asp:ListItem>
                    <asp:ListItem Value="2">DSL</asp:ListItem>
                    <asp:ListItem Value="3">Wireless</asp:ListItem>
                    <asp:ListItem Value="4">Dont now</asp:ListItem>
                </asp:ListBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;&nbsp; 4.&nbsp; Whats main reason for visitin website ?</td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                    <asp:ListItem Value="0">Curiuos</asp:ListItem>
                    <asp:ListItem Value="1">Gather Information</asp:ListItem>
                    <asp:ListItem Value="2">Other Reasons</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;&nbsp; 5.&nbsp; &nbsp;Describe your experiance in few words on this website
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Height="53px" TextMode="MultiLine" 
                    Width="226px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;&nbsp; 6.&nbsp; Would you come back to Stock st ?&nbsp;(Tick if yes)</td>
            <td>
                <asp:CheckBox ID="Yes" runat="server" />
            </td>
        </tr>
    </table>
</div>
</asp:Content>

