<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Footer_Feedback" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .style3
        {
            vertical-align:top;
        }
    </style>


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
            width: 580px;
            font-weight: 700;
        }
    </style>
    <style type="text/css">
        .style3
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="panFeedback" runat="server">
    
    <div style="border:3px dashed #b5c7de;padding:10px;background-color:#FDFFCC;"> <!--style="display:block;padding:20px 20px 50px 20px; overflow:hidden"-->
    <table class="style1" 
            style="height:100%;overflow:hidden; font-family: Tahoma; font-size: 0.9em; font-weight: normal;">
        <tr>
            <td colspan="2">
                <h1 class="style2">
                    Feedback Form</h1>
            </td>
        </tr>
        <tr>
            <td class="style3">
&nbsp;&nbsp; 1.&nbsp; On which devices did you access the website ? <br /></td>
            <td>
                <asp:CheckBoxList ID="cblstWebsiteAccess" runat="server" TextAlign="Left" 
                    DataSourceID="dsCheckBoxList" DataTextField="Name" DataValueField="Id">
                </asp:CheckBoxList>
                <asp:SqlDataSource ID="dsCheckBoxList" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
                    SelectCommand="SELECT [Id], [TYPE], [Name] FROM [Feedback_Options] WHERE ([TYPE] = @TYPE)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ac" Name="TYPE" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style3"></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;&nbsp; 3.&nbsp; How did you first learn about our website ?&nbsp;</td>
            <td>
                <asp:DropDownList ID="ddlLearnAbout" runat="server"  CssClass="controlStyle" 
                    DataSourceID="dsDropDownList" DataTextField="Name" DataValueField="Id" 
                    style="margin-left: 0px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="dsDropDownList" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
                    SelectCommand="SELECT [Id], [Name], [TYPE] FROM [Feedback_Options] WHERE ([TYPE] = @TYPE)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ab" Name="TYPE" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
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
&nbsp;&nbsp; 2.&nbsp; What's your access medium to Internet?<br />
                <asp:RequiredFieldValidator ID="fvAccessMediumList" runat="server" 
                    ControlToValidate="lstbAccessMedium" 
                    ErrorMessage="Please specify Your access medium to continue." ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:ListBox ID="lstbAccessMedium" runat="server" DataSourceID="dsItemList"  CssClass="controlStyle"
                    DataTextField="Name" DataValueField="Id" style="margin-left: 0px">
                </asp:ListBox>
                <asp:SqlDataSource ID="dsItemList" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
                    SelectCommand="SELECT [Id], [TYPE], [Name] FROM [Feedback_Options] WHERE ([TYPE] = @TYPE)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="me" Name="TYPE" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
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
                &nbsp;&nbsp; 4.&nbsp; What's the main reason for visiting our website?<br />
                <asp:RequiredFieldValidator ID="fvRadioButtonValidation" runat="server" 
                    ControlToValidate="rbtnlstReasonVisiting" 
                    ErrorMessage="Please specify Your visiting reason." ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:RadioButtonList ID="rbtnlstReasonVisiting" runat="server" 
                    DataSourceID="dsRadioButtonList" DataTextField="Name" DataValueField="Id">
                </asp:RadioButtonList>
                <asp:SqlDataSource ID="dsRadioButtonList" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
                    SelectCommand="SELECT [Id], [Name], [TYPE] FROM [Feedback_Options] WHERE ([TYPE] = @TYPE)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="re" Name="TYPE" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
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
                &nbsp;&nbsp; 5.&nbsp; &nbsp;Describe your experience of this website in a few words:
            </td>
            <td>
                <asp:TextBox ID="txtExperience" runat="server" Height="53px" TextMode="MultiLine" 
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
                &nbsp;&nbsp; 6.&nbsp; Would you come back to Stock St?</td>
            <td>
                <asp:CheckBox ID="chkbxComeBack" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style3" colspan="2">
                <hr />
            </td>
        </tr>
        <tr>
            <td style="text-align: center" colspan="2">
            <asp:Button 
                    ID="btnSubmit" runat="server" onclick="btnSubmit_Click" Text="Submit" CssClass="buttonStyle"
                    Width="220px" />
            </td>
        </tr>
    </table>
    </div>

    </asp:Panel>
</asp:Content>

