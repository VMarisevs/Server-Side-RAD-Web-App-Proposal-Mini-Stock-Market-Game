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
            SelectCommand="SELECT [Id],[Name], [shareAmount], [curprice], [shortDescription] FROM [Companies]"
            ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Companies] WHERE [Id] = @original_Id AND [shareAmount] = @original_shareAmount AND [curprice] = @original_curprice AND (([shortDescription] = @original_shortDescription) OR ([shortDescription] IS NULL AND @original_shortDescription IS NULL))"
            InsertCommand="INSERT INTO [Companies] ([shareAmount], [curprice], [shortDescription]) VALUES (@shareAmount, @curprice, @shortDescription)"
            OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Companies] SET [shareAmount] = @shareAmount, [curprice] = @curprice, [shortDescription] = @shortDescription WHERE [Id] = @original_Id AND [shareAmount] = @original_shareAmount AND [curprice] = @original_curprice AND (([shortDescription] = @original_shortDescription) OR ([shortDescription] IS NULL AND @original_shortDescription IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_shareAmount" Type="Int32" />
                <asp:Parameter Name="original_curprice" Type="Decimal" />
                <asp:Parameter Name="original_shortDescription" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="shareAmount" Type="Int32" />
                <asp:Parameter Name="curprice" Type="Decimal" />
                <asp:Parameter Name="shortDescription" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="shareAmount" Type="Int32" />
                <asp:Parameter Name="curprice" Type="Decimal" />
                <asp:Parameter Name="shortDescription" Type="String" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_shareAmount" Type="Int32" />
                <asp:Parameter Name="original_curprice" Type="Decimal" />
                <asp:Parameter Name="original_shortDescription" Type="String" />
            </UpdateParameters>
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
                <asp:ControlParameter ControlID="gvCompanies" Name="Id" PropertyName="SelectedValue"
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
                <asp:ControlParameter ControlID="gvCompanies" Name="Id" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:DropDownList ID="ddlCategories" runat="server" AutoPostBack="True" DataSourceID="dsCategories"
            DataTextField="longName" DataValueField="Id" AppendDataBoundItems="True">
            <asp:ListItem Value="-1">All</asp:ListItem>
        </asp:DropDownList>
    </p>
    <table class="style2">
        <tr>
            <td class="style3">
                <asp:GridView ID="gvCompanies" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateColumns="False" CellPadding="4" DataSourceID="dsCompanies" ForeColor="Black"
                    GridLines="Horizontal" DataKeyNames="Id" BackColor="White" BorderColor="#CCCCCC"
                    BorderStyle="None" BorderWidth="1px" Height="369px" PageSize="5" 
                    Width="614px">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="shareAmount" HeaderText="Available Shares" SortExpression="shareAmount">
                        </asp:BoundField>
                        <asp:BoundField DataField="curprice" DataFormatString="{0:c}" HeaderText="curprice"
                            SortExpression="curprice" />
                        <asp:BoundField DataField="shortDescription" HeaderText="shortDescription" SortExpression="shortDescription" />
                        <asp:CommandField ButtonType="Button" ShowSelectButton="True">
                            <ControlStyle Width="80px" />
                            <ItemStyle Width="200px" />
                        </asp:CommandField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerSettings Mode="NextPrevious" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
            </td>
            <td>
                &nbsp;
                <asp:DetailsView ID="dvCompanies" runat="server" AllowPaging="True" AutoGenerateRows="False"
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                    CellPadding="4" DataKeyNames="Id" DataSourceID="dsCompaniesDetailed" ForeColor="Black"
                    GridLines="Horizontal" Height="16px" OnItemUpdated="dvCompanies_ItemUpdated1"
                    Width="538px">
                    <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
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
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("categoryId", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsCategories" 
                                    DataTextField="longName" DataValueField="Id">
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="volatility" HeaderText="volatility" SortExpression="volatility" />
                        <asp:BoundField DataField="shortDescription" HeaderText="shortDescription" SortExpression="shortDescription" />
                        <asp:BoundField DataField="longDescription" HeaderText="longDescription" SortExpression="longDescription" />
                        <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                    </Fields>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
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
