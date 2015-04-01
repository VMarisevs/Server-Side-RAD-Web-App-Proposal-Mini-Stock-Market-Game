<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="EditStocks.aspx.cs" Inherits="Authorised_AddStocks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style3
        {
            width: 290px;
        }
        .style4
        {
            width: 290px;
            height: 36px;
        }
        .style5
        {
            height: 36px;
        }
        .style6
        {
            text-align: center;
        }
        .style7
        {
            width: 290px;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Edit Stocks
    </h1>
    <div style="margin-left:13%">                                                                                                                                                                                                                                                     <p>
        <asp:SqlDataSource ID="dsCompanies" runat="server" ConnectionString="<%$ ConnectionStrings:GameConnectionString %>"
            SelectCommand="SELECT [Id], [Name], [curprice], [shareAmount], [shortDescription] FROM [Companies] WHERE ([Name] LIKE '%' + @Name + '%') AND categoryId = CASE  @categoryId 
WHEN '-1'  THEN categoryId 
ELSE @categoryId 
END ORDER BY [Name]"
            OldValuesParameterFormatString="original_{0}" 
            InsertCommand="INSERT INTO [Companies] ([Name], [Abbreviation], [logo], [curprice], [shareAmount], [categoryId], [volatility], [shortDescription], [longDescription]) VALUES (@Name, @Abbreviation, @logo, @curprice, @shareAmount, @categoryId, @volatility, @shortDescription, @longDescription)">
            <InsertParameters>
                <asp:Parameter Name="Name" />
                <asp:Parameter Name="Abbreviation" />
                <asp:Parameter Name="logo" />
                <asp:Parameter Name="curprice" />
                <asp:Parameter Name="shareAmount" />
                <asp:Parameter Name="categoryId" />
                <asp:Parameter Name="volatility" />
                <asp:Parameter Name="shortDescription" />
                <asp:Parameter Name="longDescription" />
            </InsertParameters>
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
            
            SelectCommand="SELECT Companies.Id, Companies.Name, Companies.Abbreviation, Companies.logo, Companies.curprice, Companies.shareAmount, Companies.categoryId, Companies.volatility, Companies.shortDescription, Companies.longDescription, Categories.longName FROM Companies INNER JOIN Categories ON Companies.categoryId = Categories.Id WHERE (Companies.Id = @Id)" UpdateCommand="UPDATE [Companies] SET [Name] = @Name, [Abbreviation] = @Abbreviation, [logo] = @logo, [curprice] = @curprice, [shareAmount] = @shareAmount, [categoryId] = @categoryId, [volatility] = @volatility, [shortDescription] = @shortDescription, [longDescription] = @longDescription WHERE [Id] = @original_Id AND [Name] = @original_Name AND [Abbreviation] = @original_Abbreviation AND (([logo] = @original_logo) OR ([logo] IS NULL AND @original_logo IS NULL)) AND [curprice] = @original_curprice AND [shareAmount] = @original_shareAmount AND [categoryId] = @original_categoryId AND [volatility] = @original_volatility AND (([shortDescription] = @original_shortDescription) OR ([shortDescription] IS NULL AND @original_shortDescription IS NULL))"
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
                    Type="Int32" DefaultValue="10003" />
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
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Abbreviation" Type="String" />
                <asp:Parameter Name="original_logo" Type="String" />
                <asp:Parameter Name="original_curprice" Type="Decimal" />
                <asp:Parameter Name="original_shareAmount" Type="Int32" />
                <asp:Parameter Name="original_categoryId" Type="Int32" />
                <asp:Parameter Name="original_volatility" Type="Int32" />
                <asp:Parameter Name="original_shortDescription" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
        <p>
            &nbsp;</p>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <table class="style2">
            <tr>
            <td class="style4"  align ="right">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtSearch"  runat="server" 
                ForeColor="black" 
font-size="1em" 
BackColor="White"
Font-Names="Tahoma"
Width="150px"
BorderColor="#00BFFF"
BorderStyle="Solid"
BorderWidth="2px"
style="margin:2px;"
                ></asp:TextBox>
                &nbsp;&nbsp;
                <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
                    Text="Search" 
                    ForeColor="black" 
font-size="1em" 
BackColor="#E8E8E8"
Font-Names="Tahoma"
Width="120px"
BorderColor="#00BFFF"
BorderStyle="Solid"
BorderWidth="2px"
style="margin:2px;" />
            </td>
            <td class="style5">
            </td>
        </tr>
            <tr>
            <td class="style3"  align ="right">
                &nbsp;
                <asp:DropDownList ID="ddlCategories" runat="server" AutoPostBack="True" 
            DataSourceID="dsCategories" DataTextField="longName" DataValueField="Id" 
            AppendDataBoundItems="True" 
            ForeColor="black" 
font-size="1em" 
BackColor="White"
Font-Names="Tahoma"
Width="120px"
BorderColor="#00BFFF"
BorderStyle="Solid"
BorderWidth="2px"
style="margin:2px;">
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
                    GridLines="None" DataKeyNames="Id" PageSize="5" 
                    Width="600px" Font-Names="Tahoma" Height="268px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" >
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="shareAmount" HeaderText="Available Shares" SortExpression="shareAmount">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="curprice" DataFormatString="{0:c}" HeaderText="Share Price"
                            SortExpression="curprice" >
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" ControlStyle-CssClass="buttonStyle">
                            <ControlStyle Width="80px" />
                            <ItemStyle Width="100px" />
                        </asp:CommandField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#008FBF" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#00BFFF" Font-Bold="True" ForeColor="White" 
                        Height="30px" />
                    <PagerStyle BackColor="#008FBF" ForeColor="White" HorizontalAlign="Center" 
                        Height="20px" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="40px" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </td>
            <td>
                &nbsp;
                </td>
        </tr>
        <tr>
            <td class="style7">
                &nbsp;
                <asp:DetailsView ID="dvwCompanies" runat="server" AllowPaging="True" AutoGenerateRows="False"
                    CellPadding="4" DataKeyNames="Id" DataSourceID="dsCompaniesDetailed" ForeColor="#333333"
                    GridLines="None" Height="16px" OnItemUpdated="dvwCompanies_ItemUpdated1"
                    Width="600px" Font-Names="Tahoma">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                    <EditRowStyle BackColor="#999999" />
                    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True"
                            SortExpression="Id" >
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Name" SortExpression="Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="rfValName" runat="server" 
                                    ControlToValidate="TextBox3" CssClass="validatorStyle" Display="Dynamic" 
                                    ErrorMessage="Name required">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="rfValName" runat="server" 
                                    ControlToValidate="TextBox3" CssClass="validatorStyle" Display="Dynamic" 
                                    ErrorMessage="Name required">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Abbreviation" SortExpression="Abbreviation">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Abbreviation") %>'></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="rfValAbrev" runat="server" 
                                    ControlToValidate="TextBox4" CssClass="validatorStyle" Display="Dynamic" 
                                    ErrorMessage="Abbreviation required">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Abbreviation") %>'></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="rfValAbrev" runat="server" 
                                    ControlToValidate="TextBox4" CssClass="validatorStyle" Display="Dynamic" 
                                    ErrorMessage="Abbreviation required">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Abbreviation") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" Width="60px" />
                            <ItemStyle Width="900px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="logo" SortExpression="logo">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("logo") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("logo") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("logo") %>'></asp:Label>
                                <br />
                                <asp:Image ID="Image1" runat="server" 
                                    ImageUrl='<%# Bind("Imagefile", "Images/Logos/{0}") %>' />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="curprice" SortExpression="curprice">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("curprice") %>'></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="rfValPrice" runat="server" 
                                    ControlToValidate="TextBox6" CssClass="validatorStyle" Display="Dynamic" 
                                    ErrorMessage="Price required">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("curprice") %>'></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="rfValPrice" runat="server" 
                                    ControlToValidate="TextBox6" CssClass="validatorStyle" Display="Dynamic" 
                                    ErrorMessage="Price required">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("curprice") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="shareAmount" SortExpression="shareAmount">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("shareAmount") %>'></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="rfValShareAmount" runat="server" 
                                    ControlToValidate="TextBox7" CssClass="validatorStyle" Display="Dynamic" 
                                    ErrorMessage="Amount of shares required">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("shareAmount") %>'></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="rfValShareAmount" runat="server" 
                                    ControlToValidate="TextBox7" CssClass="validatorStyle" Display="Dynamic" 
                                    ErrorMessage="Amount of shares required">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("shareAmount") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Category">

                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("longName", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsCategories" 
                                    DataTextField="longName" DataValueField="Id" 
                                    SelectedValue='<%# Bind("categoryId", "{0}") %>' CssClass="buttonStyle">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="volatility" SortExpression="volatility">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("volatility") %>'></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="rfValShareVolitility" runat="server" 
                                    ControlToValidate="TextBox1" CssClass="validatorStyle" Display="Dynamic" 
                                    ErrorMessage="Volitility required">*</asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="valRanVolitility" runat="server" 
                                    ControlToValidate="TextBox1" CssClass="validatorStyle" Display="Dynamic" 
                                    ErrorMessage="Volitility must be between 1 &amp; 4" MaximumValue="4" 
                                    MinimumValue="1" Type="Integer">*</asp:RangeValidator>
                                <br />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("volatility") %>'></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="rfValShareVolitility" runat="server" 
                                    ControlToValidate="TextBox1" CssClass="validatorStyle" Display="Dynamic" 
                                    ErrorMessage="Volitility required">*</asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="valRanVolitility" runat="server" 
                                    ControlToValidate="TextBox1" CssClass="validatorStyle" Display="Dynamic" 
                                    ErrorMessage="Volitility must be between 1 &amp; 4" MaximumValue="4" 
                                    MinimumValue="1" Type="Integer">*</asp:RangeValidator>
                                <br />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("volatility") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="shortDescription" 
                            SortExpression="shortDescription">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox8" runat="server" 
                                    Text='<%# Bind("shortDescription") %>'></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="rfValShortDescrip" runat="server" 
                                    ControlToValidate="TextBox8" CssClass="validatorStyle" Display="Dynamic" 
                                    ErrorMessage="Short description required">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox8" runat="server" 
                                    Text='<%# Bind("shortDescription") %>'></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="rfValShortDescrip" runat="server" 
                                    ControlToValidate="TextBox8" CssClass="validatorStyle" Display="Dynamic" 
                                    ErrorMessage="Short description required">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("shortDescription") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Long Description" >
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Columns="50" Height="85px" Rows="4" 
                                    Text='<%# Bind("longDescription", "{0}") %>' TextMode="MultiLine" Width="398px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="rfValLongDesc" runat="server" 
                                    ControlToValidate="TextBox2" CssClass="validatorStyle" Display="Dynamic" 
                                    ErrorMessage="Long description required">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" 
                                    Text='<%# Eval("longDescription", "{0}") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Columns="50" Height="85px" Rows="4" 
                                    Text='<%# Bind("longDescription", "{0}") %>' TextMode="MultiLine" Width="398px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="rfValLongDesc" runat="server" 
                                    ControlToValidate="TextBox2" CssClass="validatorStyle" Display="Dynamic" 
                                    ErrorMessage="Long description required">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                            <ItemStyle Width="400px" />
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Button" ShowEditButton="True" 
                            ControlStyle-CssClass="buttonStyle" ShowInsertButton="True" >
<ControlStyle CssClass="buttonStyle"></ControlStyle>
                        </asp:CommandField>
                    </Fields>
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="DeepSkyBlue" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#008FBF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                </asp:DetailsView>
            </td>
            <td class="style6">
                &nbsp;
            </td>
        </tr>
    </table>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Width="80%"
            CssClass="validatorStyle" DisplayMode="List" />

        <p class="style6">
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </p>
        
        <p>
        </p>
    </div>
</asp:Content>
