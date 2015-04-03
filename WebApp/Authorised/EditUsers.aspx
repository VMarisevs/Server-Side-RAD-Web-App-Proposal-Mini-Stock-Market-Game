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
            width: 100%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <asp:ObjectDataSource ID="dsUsers" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetAllUsers" TypeName="UserDB"></asp:ObjectDataSource>
    <asp:GridView ID="gvwUsers" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataSourceID="dsUsers" ForeColor="#333333" GridLines="None" AllowPaging="True"
        Width="540px" DataKeyNames="id" 
        onselectedindexchanged="gvwUsers_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="name" HeaderText="Name" />
            <asp:BoundField DataField="lastActive" HeaderText="Last Active" />
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
  
                
                <asp:FormView ID="fvwUser" runat="server" 
                    DataSourceID="dsUser" CellPadding="4" ForeColor="#333333" Visible="False">
                    <EditItemTemplate>
                        &nbsp;<asp:Label ID="idTextBox" runat="server" Text='<%# Bind("id") %>' 
                            Visible="False" />
                        <asp:Label ID="lblNameLower" runat="server"  Text='<%# Bind("loweredName") %>' 
                            Visible="False"></asp:Label>
                        <table class="style7">
                            <tr>
                                <td>
                                    <br />
                                    name:
                                    <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("name") %>' />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    cash:
                                    <asp:TextBox ID="cashTextBox" runat="server" Text='<%# Bind("cash") %>' />
                                    <br />
                                </td>
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" 
                                        CommandName="Update" onclick="UpdateButton_Click" Text="Update" />
                                    &nbsp;
                                    <asp:Button ID="btnCancelUpdate" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" onclick="btnCancelUpdate_Click" Text="Cancel" />
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <br />
                        &nbsp;
                    </EditItemTemplate>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <InsertItemTemplate>
                        id:
                        <asp:TextBox ID="idTextBox" runat="server" Text='<%# Bind("id") %>' />
                        <br />
                        name:
                        <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                        <br />
                        loweredName:
                        <asp:TextBox ID="loweredNameTextBox" runat="server" 
                            Text='<%# Bind("loweredName") %>' />
                        <br />
                        cash:
                        <asp:TextBox ID="cashTextBox" runat="server" Text='<%# Bind("cash") %>' />
                        <br />
                        lastActivity:
                        <asp:TextBox ID="lastActivityTextBox" runat="server" 
                            Text='<%# Bind("lastActivity") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        &nbsp;<br />
                        <table class="style7">
                            <tr>
                                <td>
                                    name:
                                    <asp:Label ID="nameLabel" runat="server" Text='<%# Bind("name") %>' />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    cash:
                                    <asp:Label ID="cashLabel" runat="server" Text='<%# Bind("cash") %>' />
                                </td>
                                <td>
                                    <asp:Button ID="btnEdit" runat="server" CommandName="Edit" 
                                        onclick="btnEdit_Click" Text="Edit User" />
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <br />
                    </ItemTemplate>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                </asp:FormView>

            </td>
            <td>
                

    <asp:ObjectDataSource ID="dsUser" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetUser" TypeName="UserDB" 
        onupdated="dsUser_Updated" DataObjectTypeName="User" UpdateMethod="UpdateUser">
        <SelectParameters>
            <asp:ControlParameter ControlID="gvwUsers" DbType="Guid" DefaultValue="" 
                Name="UserId" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:ObjectDataSource>



            </td>
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
