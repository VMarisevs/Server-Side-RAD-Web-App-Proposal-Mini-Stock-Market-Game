<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="EditUsers.aspx.cs" Inherits="Authorised_EditUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
            height: 140px;
        }
        .style3
        {
            height: 23px;
            text-align: left;
        }
        .style4
        {
            height: 23px;
            text-align: left;
        }
        .style5
        {
            height: 23px;
            text-align: right;
            width: 358px;
        }
        .style6
        {
            width: 358px;
        }
        .style7
        {
            height: 23px;
            text-align: left;
            width: 231px;
        }
        .style8
        {
            width: 231px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <asp:ObjectDataSource ID="dsUserDetailed" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetUserInformation" TypeName="UserDB" 
        UpdateMethod="UpdateUser" 
        onupdated="dsUserShares_Updated">
        <SelectParameters>
            <asp:ControlParameter ControlID="gvwUsers" DbType="Guid" DefaultValue="" 
                Name="userId" PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Guid" Name="UserId" />
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="Cash" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>



    <asp:ObjectDataSource ID="dsUser" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetAllUsers" TypeName="UserDB"></asp:ObjectDataSource>
    <asp:GridView ID="gvwUsers" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataSourceID="dsUser" ForeColor="#333333" GridLines="None" AllowPaging="True"
        Width="540px" DataKeyNames="userId" 
        onselectedindexchanged="gvwUsers_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            <asp:BoundField DataField="UserLastActivity" HeaderText="UserLastActivity" SortExpression="UserLastActivity" />
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <br />
    <table class="style1">
        <tr>
            <td class="style5">
                <asp:RadioButton 
                    ID="rBtnUser" runat="server" Enabled="False" GroupName="Roles" Text="User" 
                    Visible="False" />
                <asp:RadioButton ID="rBtnAdmin" runat="server" Enabled="False" 
                    GroupName="Roles" Text="Admin" Visible="False" />
                &nbsp;&nbsp;&nbsp;</td>
            <td class="style3">
            </td>
        </tr>
        <tr>
            <td class="style6">
  
                
                <asp:FormView ID="fvwUserDetaileddd" runat="server" 
                    DataSourceID="dsUserDetailed">
                    <EditItemTemplate>
                        <table class="style1">
                            <tr>
                                <td>
                                    Name:
                                    <asp:TextBox ID="txtUserName" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" 
                                        onclick="btnUpdate_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Cash:
                                    <asp:TextBox ID="txtUserCash" runat="server" Text='<%# Bind("Cash") %>' 
                                        Height="26px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Button ID="Button1" runat="server" CommandName="Cancel" Text="Cancel" />
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("UserId") %>' 
                                        Visible="False"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <table class="style1">
                            <tr>
                                <td class="style7">
                                    Name :
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                                </td>
                                <td class="style4">
                                    Net Value</td>
                            </tr>
                            <tr>
                                <td class="style8" style="text-align: left">
                                    Cash:
                       
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Cash") %>'></asp:Label>
                       
                                </td>
                                <td style="text-align: left">
                                    <asp:Button ID="btnEditUser" runat="server" onclick="btnEditUser_Click" 
                                        Text="Edit User" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>

            </td>
            <td>
                
                &nbsp;</td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
