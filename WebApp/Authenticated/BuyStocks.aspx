<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BuyStocks.aspx.cs" Inherits="Authenticated_BuyStocks" %>
<%@ MasterType virtualpath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style4
        {
            width: 290px;
            height: 36px;
        }
        .style3
        {
            width: 290px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--This directive causes the content page's Master property to be strongly typed.-->
    <%--<%@ MasterType virtualpath="~/Master1.master" %>--%>

    <h1>Buy Stocks</h1>
    <p>
        <asp:Label ID="lblUserId" runat="server" Text="UserId" Visible="false"></asp:Label>
&nbsp;</p>
    <div>
        <asp:SqlDataSource ID="dsStocks" runat="server" 
            ConnectionString="<%$ ConnectionStrings:GameConnectionString %>"                   
            SelectCommand="SELECT Companies.Id, Companies.Name, Categories.longName, Companies.shareAmount, Companies.curprice FROM Categories INNER JOIN Companies ON Categories.Id = Companies.categoryId WHERE ([Name] LIKE '%' + @Name + '%') AND categoryId = CASE  @categoryId 
WHEN '-1'  THEN categoryId 
ELSE @categoryId 
END ORDER BY [Name]">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtSearch" Name="Name" PropertyName="Text" 
                    DefaultValue="%" />
                <asp:ControlParameter ControlID="ddlCategories" Name="categoryId" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsCategories" runat="server" ConnectionString="<%$ ConnectionStrings:GameConnectionString %>"
            SelectCommand="SELECT [Id], [longName] FROM [Categories] ORDER BY [longName]">
        </asp:SqlDataSource>
        <table class="style1">
            <tr>
            <td class="style4"  align ="right">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;
                </td>
                <td style="text-align: right">
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
                <asp:Button ID="btnSearch" runat="server" 
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
            </tr>
            <tr>
            <td class="style3"  align ="right">
                &nbsp;
                <asp:Label ID="lblErrorMessage" runat="server" ForeColor="#990000"></asp:Label>
                </td>
                <td style="text-align: right">
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
style="margin:2px; ">
            <asp:ListItem Value="-1">All</asp:ListItem>
        </asp:DropDownList>
                </td>
            </tr>
        </table>
        <asp:GridView ID="gwBuyStocks" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataSourceID="dsStocks" ForeColor="#333333" GridLines="None" 
            DataKeyNames="Id">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" 
                    InsertVisible="False" ReadOnly="True" Visible="False" />
                <asp:BoundField DataField="Name" HeaderText="Company" 
                    SortExpression="Name" />
                <asp:BoundField DataField="shareAmount" HeaderText="Shares Owned" 
                    SortExpression="shareAmount" />
                <asp:BoundField DataField="curprice" HeaderText="Price" 
                    SortExpression="curprice" DataFormatString="{0:c}" />
                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server"  onclick="Button1_Click" Text="Buy" CssClass="buttonStyle"/>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#E8E8E8" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#00BFFF" Font-Bold="True" ForeColor="White" />
            <PagerSettings Mode="NextPreviousFirstLast" />
            <PagerStyle BackColor="#E8E8E8" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        
        <asp:Panel ID="Panel1" runat="server" BackColor="#33CCFF" Height="30px" 
            style="text-align: center" Width="203px">
            <asp:Label ID="Label1" runat="server" 
    Text="No. of Shares:" Font-Size="Large"></asp:Label>
            &nbsp;
            <asp:TextBox ID="txtAmmount" runat="server" Width="52px" Height="21px">1</asp:TextBox>
        </asp:Panel>
        
        <br />
        <asp:SqlDataSource ID="dsCompany" runat="server" 
            ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
            SelectCommand="SELECT [shareAmount], [curprice] FROM [Companies] WHERE ([Id] = @Id)" 
            
            
            UpdateCommand="UPDATE Companies SET shareAmount = shareAmount - 1 WHERE (Id = @id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="gwBuyStocks" DefaultValue="" Name="Id" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="id" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        
        <br />
        <br />
    </div>
</asp:Content>

