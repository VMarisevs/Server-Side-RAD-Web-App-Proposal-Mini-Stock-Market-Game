<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="EditUsers.aspx.cs" Inherits="Authorised_EditUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 26px;
        }
        .style3
        {
            height: 23px;
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <asp:ObjectDataSource ID="dsUserShares" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetUserInformation" TypeName="UserDB" 
        UpdateMethod="UpdateUser" 
        onupdated="dsUserShares_Updated" onupdating="dsUserShares_Updating" 
        InsertMethod="InsertUser" oninserted="dsUserShares_Inserted" 
        oninserting="dsUserShares_Inserting">
        <InsertParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="Cash" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="gvwUsers" DbType="Guid" DefaultValue="" Name="userId"
                PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Guid" Name="UserId" />
            <asp:Parameter Name="companyId" Type="String" />
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="Cash" Type="String" />
            <asp:Parameter Name="shares" Type="String" />
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
            <td class="style3">
                <asp:Button ID="btnCreateUser" runat="server" onclick="btnCreateUser_Click1" 
                    Text="Create new user" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:CheckBox ID="cbAdmin"  runat="server" Enabled="False" 
                    Text="Admin"/>
                        <asp:CheckBox ID="cbUser" runat="server" Enabled="False" Text="User" />
                    </td>
            <td class="style3">
            </td>
        </tr>
        <tr>
            <td>
    <asp:FormView ID="fvwUserShares" runat="server" DataSourceID="dsUserShares" 
        Width="535px">
        <EditItemTemplate>
            <table class="style1">
                <tr>
                    <td>
                        Name:&nbsp;<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("UserName", "{0}") %>'></asp:TextBox>
                    </td>
                    <td>
                        <asp:DropDownList runat="server" DataSourceID="dsUserShares" 
                            DataTextField="Name" DataValueField="companyId" ID="ddlCompanies">
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Cash:
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Cash", "{0:C}") %>'></asp:TextBox>
                    </td>
                    <td>
                        Alter Shares:
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("shares", "{0}") %>'></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2">
                        </td>
                    <td class="style2">
                        </td>
                </tr>
                <tr>
                    <td>
                       
                    </td>
                    <td>
                        <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" 
                            onclick="btnUpdate_Click" />
                        &nbsp;
                        <asp:Button ID="btnCancel" runat="server" onclick="btnCancel_Click" 
                            Text="Cancel" />
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>

            <br />
            <asp:Label ID="lblUserId" runat="server" Text='<%# Bind("userID", "{0}") %>' 
                Visible="False"></asp:Label>
            <asp:Label ID="lblCompanyId" runat="server" Text='<%# Bind("companyId", "{0}") %>' 
                Visible="False"></asp:Label>
            <br />
            <br />
            <br />



        </EditItemTemplate>
        <InsertItemTemplate>
            <table class="style1">
                <tr>
                    <td>
                        Name:&nbsp;<asp:TextBox ID="TextBox1" runat="server" 
                            Text='<%# Bind("UserName", "{0}") %>'></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Cash:
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Cash", "{0:C}") %>'></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style2">
                    </td>
                    <td class="style2">
                    </td>
                </tr>
                <tr>
                    <td>
                                              
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                                    CommandName="Insert" Text="Insert" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" Text="Cancel" />
                       
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <asp:Label ID="lblUserId" runat="server" Text='<%# Bind("userID", "{0}") %>' 
                Visible="False"></asp:Label>
            <asp:Label ID="lblCompanyId" runat="server" 
                Text='<%# Bind("companyId", "{0}") %>' Visible="False"></asp:Label>
            <br />
            <br />
        </InsertItemTemplate>
        <ItemTemplate>
            <table class="style1">
                <tr>
                    <td>
                        &nbsp;Name:&nbsp;<asp:Label ID="Label1" runat="server" 
                            Text='<%# Eval("UserName", "{0}") %>'></asp:Label>
                        &nbsp;&nbsp;</td>
                    <td>
                        Net Worth:
                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Cash:
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Cash", "{0:C}") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="btnEdit" runat="server" onclick="btnEdit_Click" 
                            Text="Edit User" />
                        <asp:Button ID="btnCreateUser" runat="server" onclick="btnCreateUser_Click" 
                            Text="Create User" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <asp:GridView ID="gvwUserShares" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="dsUserShares" ForeColor="#333333" 
                GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Comapny Name" />
                    <asp:BoundField DataField="shares" HeaderText="No of Shares" />
                    <asp:BoundField DataField="price" HeaderText="Share Price" />
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
            <br />

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
