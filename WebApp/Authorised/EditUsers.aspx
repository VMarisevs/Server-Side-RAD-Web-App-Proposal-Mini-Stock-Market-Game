<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="EditUsers.aspx.cs" Inherits="Authorised_EditUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 94%;
            height: 140px;
        }
        .style3
        {
            height: 23px;
            text-align: right;
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


    <asp:ObjectDataSource ID="dsUser" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetUser" TypeName="UserDB" 
        onupdated="dsUser_Updated" DataObjectTypeName="User" UpdateMethod="UpdateUser">
        <SelectParameters>
            <asp:ControlParameter ControlID="gvwUsers" DbType="Guid" DefaultValue="" 
                Name="UserId" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:ObjectDataSource>



    <asp:ObjectDataSource ID="dsUsers" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetAllUsers" TypeName="UserDB"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsUserStocks" runat="server" 
        SelectMethod="GetUserCompanies" TypeName="SharesDB" 
        UpdateMethod="UpdateUserShares" 
        OldValuesParameterFormatString="original_{0}" 
        onupdating="dsUserStocks_Updating">
        <SelectParameters>
            <asp:ControlParameter ControlID="fvwUser" DbType="Guid" Name="userId" 
                PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter DbType="Guid" Name="UserId" ControlId="gvwUsers" PropertyName="SelectedDataKey.Value"/>
            <asp:Parameter Name="companyId" Type="Int32"/>
            <asp:Parameter Name="shares" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:GridView ID="gvwUsers" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataSourceID="dsUsers" ForeColor="#333333" GridLines="None" AllowPaging="True"
        Width="540px" DataKeyNames="id" 
        onselectedindexchanged="gvwUsers_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="name" HeaderText="Name" />
            <asp:BoundField DataField="lastActive" HeaderText="Last Active" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CssClass="buttonStyle"
                        CommandName="Select"  Text="Select" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#E8E8E8" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#00BFFF" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#E8E8E8" ForeColor="White" HorizontalAlign="Center" />
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
                <asp:Label ID="lblRoleErrorMessage" runat="server" ForeColor="#CC0000"></asp:Label>
                <asp:RadioButton 
                    ID="rBtnUser" runat="server" Enabled="False" GroupName="Roles" Text="User" 
                    Visible="False" />
                <asp:RadioButton ID="rBtnAdmin" runat="server" Enabled="False" 
                    GroupName="Roles" Text="Admin" Visible="False" />
                &nbsp;&nbsp;&nbsp;</td>
            <td class="style3">
                <asp:Label ID="lblStockErrorMessage" runat="server" ForeColor="#990000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style6">
  
                
                <asp:FormView ID="fvwUser" runat="server" 
                    DataSourceID="dsUser" CellPadding="4" ForeColor="#333333" Visible="False" 
                    DataKeyNames="id">
                    <EditItemTemplate>
                        &nbsp;<asp:Label ID="idTextBox" runat="server" Text='<%# Bind("id") %>' 
                            Visible="False" />
                        <asp:Label ID="lblNameLower" runat="server"  Text='<%# Bind("loweredName") %>' 
                            Visible="False"></asp:Label>
                        <table>
                            <tr>
                                <td colspan="2">
                                    <strong>Name</strong>
                                    <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("name") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                   <strong>Cash:</strong>
                                    <asp:TextBox ID="cashTextBox" runat="server" Text='<%# Bind("cash","{0:C2}") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CssClass="buttonStyle"
                                        CommandName="Update" onclick="UpdateButton_Click" Text="Update" />
                                </td>
                                <td>
                                <br />
                                    <asp:Button ID="btnCancelUpdate" runat="server" CausesValidation="False"  CssClass="buttonStyle"
                                        CommandName="Cancel" onclick="btnCancelUpdate_Click" Text="Cancel" />
                                </td>
                            </tr>
                        </table>
                        &nbsp;
                        <asp:Label ID="lblUserErrorMessage" runat="server"></asp:Label>
                    </EditItemTemplate>
                    <EditRowStyle BackColor="LightGray" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <%--<InsertItemTemplate>
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
                    </InsertItemTemplate>--%>
                    <ItemTemplate>
                        &nbsp;<br />
                        <table width="100%">
                            <tr>
                                <td colspan="2">
                                  <strong>Id:</strong>  
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("id") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <strong>Name:</strong>  
                                    <asp:Label ID="nameLabel" runat="server" Text='<%# Bind("name") %>' />
                                </td>

                            </tr>
                            <tr>
                                <td colspan="2">
                                    <strong>Cash:</strong>  
                                    <asp:Label ID="cashLabel" runat="server" Text='<%# Bind("cash","{0:C2}") %>' />
                                </td>
                            </tr>
                            <tr>
                                  <td>
                                    <asp:Button ID="btnEdit" runat="server" CommandName="Edit" CssClass="buttonStyle"
                                        onclick="btnEdit_Click" style="margin-bottom: 0px" Text="Edit User" />
                                  </td>
                                  <td>
                                     <asp:Button ID="btnEditUserStocks" runat="server" CommandName="Select" CssClass="buttonStyle"
                                        Text="Edit Stocks" onclick="btnEditUserStocks_Click" />
                                  </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <PagerStyle BackColor="#E8E8E8" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                </asp:FormView>

            </td>
            <td>
                


                <asp:GridView ID="gvwEditStocks" runat="server" AutoGenerateColumns="False" Visible="False"
                    CellPadding="4" DataSourceID="dsUserStocks" ForeColor="#333333" 
                    GridLines="None" onrowupdated="gvwEditStocks_RowUpdated">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="ID" SortExpression="companyId">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("companyId") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("companyId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" 
                            SortExpression="Name" />
                        <asp:TemplateField HeaderText="Number of Shares" SortExpression="shares">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("shares") %>'></asp:TextBox>
                                &nbsp;<br />
                                <asp:RequiredFieldValidator ID="valReqShareNum" runat="server" 
                                    ControlToValidate="TextBox1" CssClass="validatorStyle" Display="Dynamic" 
                                    ErrorMessage="*Required"></asp:RequiredFieldValidator>
                                <br />
                                <asp:CompareValidator ID="valComGreaterThen" runat="server" 
                                    ControlToValidate="TextBox1" CssClass="validatorStyle" Display="Dynamic" 
                                    ErrorMessage="*Must be 0 or greater" Operator="GreaterThanEqual" 
                                    ValueToCompare="0"></asp:CompareValidator>
                                <br />
                                <asp:CompareValidator ID="valComShareNum" runat="server" 
                                    ControlToValidate="TextBox1" CssClass="validatorStyle" Display="Dynamic" 
                                    ErrorMessage="*Must be an integer" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("shares") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="True" CssClass="buttonStyle"
                                    CommandName="Update" Text="Update" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CssClass="buttonStyle"
                                    CommandName="Cancel" Text="Cancel" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CssClass="buttonStyle"
                                    CommandName="Edit" Text="Edit" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#E8E8E8" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#00BFFF" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#E8E8E8" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>



            </td>
        </tr>
        <tr>
            <td class="style6">
  
                
                &nbsp;</td>
            <td>
                

                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
