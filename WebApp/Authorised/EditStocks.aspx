<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditStocks.aspx.cs" Inherits="Authorised_AddStocks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style3
        {
            width: 345px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:SqlDataSource ID="dsCompanies" runat="server" 
            ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
            
            
            
            SelectCommand="SELECT [Id],[Name], [shareAmount], [curprice], [shortDescription] FROM [Companies]" 
            ConflictDetection="CompareAllValues" 
            DeleteCommand="DELETE FROM [Companies] WHERE [Id] = @original_Id AND [shareAmount] = @original_shareAmount AND [curprice] = @original_curprice AND (([shortDescription] = @original_shortDescription) OR ([shortDescription] IS NULL AND @original_shortDescription IS NULL))" 
            InsertCommand="INSERT INTO [Companies] ([shareAmount], [curprice], [shortDescription]) VALUES (@shareAmount, @curprice, @shortDescription)" 
            OldValuesParameterFormatString="original_{0}" 
            UpdateCommand="UPDATE [Companies] SET [shareAmount] = @shareAmount, [curprice] = @curprice, [shortDescription] = @shortDescription WHERE [Id] = @original_Id AND [shareAmount] = @original_shareAmount AND [curprice] = @original_curprice AND (([shortDescription] = @original_shortDescription) OR ([shortDescription] IS NULL AND @original_shortDescription IS NULL))">
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
        <asp:SqlDataSource ID="dsCategories" runat="server" 
            ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
            
            SelectCommand="SELECT [longName], [Id] FROM [Categories] ORDER BY [longName]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsCompaniesDetailed" runat="server" 
            ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
            SelectCommand="SELECT * FROM [Companies] Where [Id] = @Id">
            <SelectParameters>
                <asp:ControlParameter ControlID="gvCompanies" Name="Id" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:DropDownList ID="ddlCategories" runat="server" AutoPostBack="True" 
            DataSourceID="dsCategories" DataTextField="longName" DataValueField="Id" 
            AppendDataBoundItems="True">
            <asp:ListItem Value="-1">All</asp:ListItem>
        </asp:DropDownList>
    </p>
    <table class="style2">
        <tr>
            <td class="style3">
                <asp:GridView ID="gvCompanies" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                    DataSourceID="dsCompanies" ForeColor="Black" GridLines="Horizontal" 
                    DataKeyNames="Id" BackColor="White" BorderColor="#CCCCCC" 
                    BorderStyle="None" BorderWidth="1px" Height="327px" PageSize="5" 
                    Width="704px">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="shareAmount" HeaderText="Available Shares" 
                            SortExpression="shareAmount" ></asp:BoundField>
                        <asp:BoundField DataField="curprice" DataFormatString="{0:c}" 
                            HeaderText="curprice" SortExpression="curprice" />
                        <asp:BoundField DataField="shortDescription" HeaderText="shortDescription" 
                            SortExpression="shortDescription" />
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                            ShowEditButton="True" ShowSelectButton="True">
                        <ControlStyle Width="80px" />
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
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
                <asp:DetailsView ID="dvCompanies" runat="server" AutoGenerateRows="False" 
                    DataSourceID="dsCompaniesDetailed" Height="50px" Width="717px" 
        CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" 
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" DataKeyNames="Id">
                    <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <Fields>
                        <asp:BoundField DataField="Name" HeaderText="Name" 
                            SortExpression="Name" />
                        <asp:BoundField DataField="curprice" HeaderText="Share Price:" 
                            SortExpression="curprice" DataFormatString=" {0:c}" />
                        <asp:BoundField DataField="shareAmount" HeaderText="Available Shares:" 
                            SortExpression="shareAmount" />
                        <asp:BoundField DataField="longDescription" HeaderText="Information:" 
                            SortExpression="longDescription" />
                    </Fields>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                </asp:DetailsView>
    <p>
        &nbsp;</p>
</asp:Content>

