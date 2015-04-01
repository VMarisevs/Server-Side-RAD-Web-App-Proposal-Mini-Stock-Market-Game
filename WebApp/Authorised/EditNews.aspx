<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditNews.aspx.cs" Inherits="Authorised_EditNews" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Edit News
    </h1>

    <div>
        <asp:SqlDataSource ID="dsNews" runat="server" 
            ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
            DeleteCommand="DELETE FROM [News] WHERE [Id] = @original_Id" 
            InsertCommand="INSERT INTO [News] ([NewsText]) VALUES (@NewsText)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT * FROM [News] ORDER BY [PostDate] DESC" 
            UpdateCommand="UPDATE [News] SET [NewsText] = @NewsText, [PostDate] = @PostDate, [UpdateDate] = @UpdateDate WHERE [Id] = @original_Id">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Object" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id" Type="Object" />
                <asp:Parameter Name="NewsText" Type="String" />
                <asp:Parameter Name="PostDate" Type="DateTime" />
                <asp:Parameter Name="UpdateDate" Type="DateTime"/>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="NewsText" Type="String" />
                <asp:Parameter Name="PostDate" Type="DateTime" />
                <asp:Parameter Name="UpdateDate" Type="DateTime" />
                <asp:Parameter Name="original_Id" Type="Object" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:ListView ID="lvwNews" runat="server" DataKeyNames="Id" 
            DataSourceID="dsNews" InsertItemPosition="LastItem" 
            oniteminserted="lvwNews_ItemInserted" oniteminserting="lvwNews_ItemInserting">
            <AlternatingItemTemplate>
                <tr style="background-color: #FFFFFF; color: #284775;">
<%--                    <td>
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    </td>--%>
                    <td>
                        <asp:Label ID="NewsTextLabel" runat="server" Text='<%# Eval("NewsText") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PostDateLabel" runat="server" 
                            Text='<%# Eval("PostDate") %>' />
                    </td>
                                        <td>
                                            <asp:Label ID="UpdateDateLabel" runat="server" 
                                                Text='<%# Eval("UpdateDate") %>' />
                    </td>
                    <td >
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                            Text="Delete" 
                            ForeColor="black" 
font-size="1em" 
BackColor="#E8E8E8"
Font-Names="Tahoma"
Width="120px"
BorderColor="#00BFFF"
BorderStyle="Solid"
BorderWidth="2px"
style="margin:2px;"/>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" ForeColor="black" 
font-size="1em" 
BackColor="#E8E8E8"
Font-Names="Tahoma"
Width="120px"
BorderColor="#00BFFF"
BorderStyle="Solid"
BorderWidth="2px"
style="margin:2px;"/>
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #999999;" >
<%--                    <td>
                        <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                    </td>--%>
                  <td style="width:400px;">
                        <asp:TextBox ID="NewsTextTextBox" runat="server" Width="97%" Height="75px" Wrap="true" TextMode="MultiLine"  Text='<%# Bind("NewsText") %>' />
                    </td>
                        <asp:RequiredFieldValidator ID="rfValContent" runat="server" 
                            ControlToValidate="NewsTextTextBox" CssClass="validatorStyle" Display="Dynamic" 
                            ErrorMessage="Content required">*</asp:RequiredFieldValidator>
                    <td>
                         <asp:Label ID="PostDateLabel" runat="server" Text='<%# Bind("PostDate") %>' />
                    </td>
                                        <td>
                         <asp:Label ID="UpdateDateLabel" runat="server" 
                             Text='<%# Bind("UpdateDate") %>' />
                    </td>
                                       <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                            Text="Update" ForeColor="black" 
font-size="1em" 
BackColor="#E8E8E8"
Font-Names="Tahoma"
Width="120px"
BorderColor="#00BFFF"
BorderStyle="Solid"
BorderWidth="2px"
style="margin:2px;"/>
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Cancel" ForeColor="black" 
font-size="1em" 
BackColor="#E8E8E8"
Font-Names="Tahoma"
Width="120px"
BorderColor="#00BFFF"
BorderStyle="Solid"
BorderWidth="2px"
style="margin:2px;" />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" 
                    style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>
                            No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
           <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:TextBox ID="NewsTextTextBox" runat="server" 
                            Text='<%# Bind("NewsText") %>' width="90%" Height="75px" Wrap="true" TextMode="MultiLine"/>

                                                    <asp:RequiredFieldValidator ID="rfValContent" runat="server" 
                            ControlToValidate="NewsTextTextBox" CssClass="validatorStyle" Display="Dynamic" 
                            ErrorMessage="Content required">*</asp:RequiredFieldValidator>
                    </td>
                 <td>
                                       <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                            Text="Insert"
ForeColor="black" 
font-size="1em" 
BackColor="#E8E8E8"
Font-Names="Tahoma"
Width="120px"
BorderColor="#00BFFF"
BorderStyle="Solid"
BorderWidth="2px"
style="margin:2px;" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" CausesValidation="false"
                            Text="Clear"         
ForeColor="black" 
font-size="1em" 
BackColor="#E8E8E8"
Font-Names="Tahoma"
Width="120px"
BorderColor="#00BFFF"
BorderStyle="Solid"
BorderWidth="2px"
style="margin:2px;"/>
                    </td>
                    <td>

                    </td>
                    <td>

                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #E0FFFF; color: #333333;">
<%--                    <td>
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    </td>--%>
                    <td style="width:400px;">
                        <asp:Label ID="NewsTextLabel" runat="server" Text='<%# Eval("NewsText") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PostDateLabel" runat="server" Text='<%# Eval("PostDate") %>' />
                    </td>
                     <td>
                         <asp:Label ID="UpdateDateLabel" runat="server" 
                             Text='<%# Eval("UpdateDate") %>' />
                    </td>
                                      <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" CausesValidation="false"
                            Text="Delete" ForeColor="black" 
    font-size="1em" 
    BackColor="#E8E8E8"
    Font-Names="Tahoma"
    Width="120px"
    BorderColor="#00BFFF"
    BorderStyle="Solid"
    BorderWidth="2px"
    style="margin:2px;"
     />

        <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server"  TargetControlID="DeleteButton" ConfirmText="Are you sure you want to delete this News item?" />

                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CausesValidation="false"
ForeColor="black" 
font-size="1em" 
BackColor="#E8E8E8"
Font-Names="Tahoma"
Width="120px"
BorderColor="#00BFFF"
BorderStyle="Solid"
BorderWidth="2px"
style="margin:2px;"/>
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
<%--                                    <th runat="server">
                                        Id</th>--%>
                                    <th runat="server">
                                        Content</th>
                                    <th runat="server">
                                        Post Date</th>

                                    <th runat="server">
                                        Last Modified</th>
                                     <th id="Th1" runat="server">
                                        </th>

                                </tr>
                                <tr ID="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" 
                            style="text-align: center;background-color: #008FBF; font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF" font-size="1em" >
                            <asp:DataPager ID="DataPager1" runat="server" CausesValidation="false">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                        ShowLastPageButton="True"  ButtonCssClass="pagerButtonStyle"  />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #E2DED6; font-weight: bold;color: #333333;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                            Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NewsTextLabel" runat="server" Text='<%# Eval("NewsText") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PostDateLabel" runat="server" Text='<%# Eval("PostDate") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UpdateDateLabel" runat="server" 
                            Text='<%# Eval("UpdateDate") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <br />

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            CssClass="validatorStyle" DisplayMode="List" />

        <br />
<%--        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataSourceID="dsNews">
            <Columns>
                <asp:BoundField DataField="NewsText" HeaderText="NewsText" 
                    SortExpression="NewsText" />
                <asp:BoundField DataField="PostDate" HeaderText="PostDate" 
                    SortExpression="PostDate"/>
                <asp:BoundField DataField="UpdateDate" HeaderText="UpdateDate" 
                    SortExpression="UpdateDate" />
            </Columns>
        </asp:GridView>--%>


        <br />


    </div>
</asp:Content>

