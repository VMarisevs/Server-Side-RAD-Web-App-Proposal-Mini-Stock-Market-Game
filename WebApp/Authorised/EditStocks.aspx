<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="EditStocks.aspx.cs" Inherits="Authorised_AddStocks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style3
        {
            width: 345px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p>
        <asp:SqlDataSource ID="dsCompanies" runat="server" ConnectionString="<%$ ConnectionStrings:GameConnectionString %>"
            SelectCommand="SELECT [Id], [Name], [curprice], [shareAmount], [shortDescription] FROM [Companies] WHERE ([Name] LIKE '%' + @Name + '%') AND categoryId = CASE  @categoryId 
WHEN '-1'  THEN categoryId 
ELSE @categoryId 
END ORDER BY [Name]"
            OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtSearch" DefaultValue="%" Name="Name" 
                    PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="ddlCategories" DefaultValue="" 
                    Name="categoryId" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsCategories" runat="server" ConnectionString="<%$ ConnectionStrings:GameConnectionString %>"
            SelectCommand="SELECT [Id], [longName] FROM [Categories] ORDER BY [longName]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsCompaniesDetailed" runat="server" ConnectionString="<%$ ConnectionStrings:GameConnectionString %>"
            SelectCommand="SELECT * FROM [Companies] WHERE ([Id] = @Id)" UpdateCommand="UPDATE [Companies] SET [Name] = @Name, [Abbreviation] = @Abbreviation, [logo] = @logo, [curprice] = @curprice, [shareAmount] = @shareAmount, [categoryId] = @categoryId, [volatility] = @volatility, [shortDescription] = @shortDescription, [longDescription] = @longDescription WHERE [Id] = @original_Id "
            ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Companies] WHERE [Id] = @original_Id AND [Name] = @original_Name AND [Abbreviation] = @original_Abbreviation AND (([logo] = @original_logo) OR ([logo] IS NULL AND @original_logo IS NULL)) AND [curprice] = @original_curprice AND [shareAmount] = @original_shareAmount AND [categoryId] = @original_categoryId AND [volatility] = @original_volatility AND (([shortDescription] = @original_shortDescription) OR ([shortDescription] IS NULL AND @original_shortDescription IS NULL)) AND (([longDescription] = @original_longDescription) OR ([longDescription] IS NULL AND @original_longDescription IS NULL))"
            InsertCommand="INSERT INTO [Companies] ([Name], [Abbreviation], [logo], [curprice], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (@Name, @Abbreviation, @logo, @curprice, @shareAmount, @categoryId, @volatility, @shortDescription, @longDescription)"
            OldValuesParameterFormatString="original_{0}">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Abbreviation" Type="String" />
                <asp:Parameter Name="original_logo" Type="String" />
                <asp:Parameter Name="original_curprice" Type="Decimal" />
                <asp:Parameter Name="original_shareAmount" Type="Int32" />
                <asp:Parameter Name="original_categoryId" Type="Int32" />
                <asp:Parameter Name="original_volatility" Type="Int32" />
                <asp:Parameter Name="original_shortDescription" Type="String" />
                <asp:Parameter Name="original_longDescription" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Abbreviation" Type="String" />
                <asp:Parameter Name="logo" Type="String" />
                <asp:Parameter Name="curprice" Type="Decimal" />
                <asp:Parameter Name="shareAmount" Type="Int32" />
                <asp:Parameter Name="categoryId" Type="Int32" />
                <asp:Parameter Name="volatility" Type="Int32" />
                <asp:Parameter Name="shortDescription" Type="String" />
                <asp:Parameter Name="longDescription" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="gvwCompanies" Name="Id" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Abbreviation" Type="String" />
                <asp:Parameter Name="logo" Type="String" />
                <asp:Parameter Name="curprice" Type="Decimal" />
                <asp:Parameter Name="shareAmount" Type="Int32" />
                <asp:Parameter Name="categoryId" Type="Int32" />
                <asp:Parameter Name="volatility" Type="Int32" />
                <asp:Parameter Name="shortDescription" Type="String" />
                <asp:Parameter Name="longDescription" Type="String" />
                <asp:Parameter Name="original_Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsCat" runat="server" ConnectionString="<%$ ConnectionStrings:GameConnectionString %>"
            SelectCommand="SELECT [longName] FROM [Categories] WHERE ([Id] = @Id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="gvwCompanies" Name="Id" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <table class="style2">
            <tr>
            <td class="style3">
                &nbsp;
                <asp:Label ID="Label2" runat="server" Text="Search:"></asp:Label>
                <asp:TextBox ID="txtSearch"  runat="server"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
                    Text="Button" />
        <asp:DropDownList ID="ddlCategories" runat="server" AutoPostBack="True" 
            DataSourceID="dsCategories" DataTextField="longName" DataValueField="Id" 
            AppendDataBoundItems="True">
            <asp:ListItem Value="-1">All</asp:ListItem>
        </asp:DropDownList>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:GridView ID="gvwCompanies" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" CellPadding="4" DataSourceID="dsCompanies" ForeColor="#333333"
                    GridLines="None" DataKeyNames="Id" Height="369px" PageSize="5" 
                    Width="482px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="shareAmount" HeaderText="Available Shares" SortExpression="shareAmount">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="curprice" DataFormatString="{0:c}" HeaderText="curprice"
                            SortExpression="curprice" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Button" ShowSelectButton="True">
                            <ControlStyle Width="80px" />
                            <ItemStyle Width="200px" />
                        </asp:CommandField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                        Height="30px" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </td>
            <td>
                &nbsp;
                <asp:DetailsView ID="dvwCompanies" runat="server" AllowPaging="True" AutoGenerateRows="False"
                    CellPadding="4" DataKeyNames="Id" DataSourceID="dsCompaniesDetailed" ForeColor="#333333"
                    GridLines="None" Height="16px" OnItemUpdated="dvwCompanies_ItemUpdated1"
                    Width="538px">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True"
                            SortExpression="Id" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Abbreviation" HeaderText="Abbreviation" SortExpression="Abbreviation" />
                        <asp:BoundField DataField="logo" HeaderText="logo" SortExpression="logo" />
                        <asp:BoundField DataField="curprice" HeaderText="curprice" SortExpression="curprice" />
                        <asp:BoundField DataField="shareAmount" HeaderText="shareAmount" SortExpression="shareAmount" />
                        <asp:TemplateField HeaderText="Category">

                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("categoryId", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsCategories" 
                                    DataTextField="longName" DataValueField="Id" 
                                    SelectedValue='<%# Bind("categoryId", "{0}") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="volatility" HeaderText="volatility" SortExpression="volatility" />
                        <asp:BoundField DataField="shortDescription" HeaderText="shortDescription" SortExpression="shortDescription" />
                        <asp:TemplateField HeaderText="Long Description">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" 
                                    Text='<%# Eval("longDescription", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Columns="50" Height="85px" Rows="4" 
                                    Text='<%# Bind("longDescription", "{0}") %>' TextMode="MultiLine" Width="398px"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                    </Fields>
                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                </asp:DetailsView>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <p>
        <asp:Label ID="lblError" runat="server"></asp:Label>
    </p>
</asp:Content>
