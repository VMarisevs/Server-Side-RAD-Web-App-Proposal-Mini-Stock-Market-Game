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
            text-align: center;
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



     <div>
                               <%--  AJAX--%>
             <asp:UpdatePanel ID="chartUpdatePanel" runat="server" UpdateMode="Conditional">
             <ContentTemplate>
                <%--<asp:Timer ID="chartTimer" runat="server" Interval="10000" />--%>
                <asp:FormView ID="frmVwInfo" runat="server" DataSourceID="dsGraphs" 
                     onload="frmVwInfo_Load">
                <ItemTemplate>
                    <strong>Name:</strong>
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                    <strong>Price:</strong>
                    <asp:Label ID="priceLabel" runat="server" Text='<%# Bind("price", "{0:c}") %>' />
                    <br />
                    <strong>Updated:</strong>
                    <asp:Label ID="updatedLabel" runat="server" Text='<%# Bind("updated") %>' />
                    <br />
                </ItemTemplate>
            </asp:FormView>

                 <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="true" DisplayAfter="1000" AssociatedUpdatePanelID="chartUpdatePanel">
                    <ProgressTemplate>
                        <br />
                        <br />
                        <br />
                    Please wait. The update is in progress.
                    </ProgressTemplate>
                 </asp:UpdateProgress>


                 <asp:Chart ID="Chart1" runat="server" DataSourceID="dsGraphs" Width="600px" 
                AlternateText="No data to display">

                <Series>
                    <asp:Series ChartType="Line" Name="Series1" YValueMembers="price" 
                        YValuesPerPoint="4" XValueMember="updated" Label="#VAL{C}" Color="red" BorderWidth="2">
                        <SmartLabelStyle CalloutLineWidth="5" CalloutLineColor="Transparent" />
                    </asp:Series>
                </Series>

                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1" BorderWidth="5">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>

  
             </ContentTemplate>
            </asp:UpdatePanel>

    
            <asp:SqlDataSource ID="dsGraphs" runat="server" 
                ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
                
                
                SelectCommand="SELECT TOP (20) StockHistory.price, StockHistory.updated, Companies.Name FROM StockHistory INNER JOIN Companies ON StockHistory.companyId = Companies.Id WHERE (StockHistory.companyId = CASE @companyId WHEN 'topCompany' THEN (SELECT TOP (1) Id FROM Companies ORDER BY curprice DESC) ELSE @companyId END) ORDER BY StockHistory.updated DESC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="gwBuyStocks" DefaultValue="10003" 
                        Name="companyId" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
  

    </div>








 
        <asp:Label ID="lblUserId" runat="server" Text="UserId" Visible="false" />
    <div>
        <asp:SqlDataSource ID="dsStocks" runat="server" 
            ConnectionString="<%$ ConnectionStrings:GameConnectionString %>"                   
            SelectCommand="SELECT Companies.Id, Companies.Name, Categories.longName, Companies.shareAmount, Companies.curprice FROM Categories INNER JOIN Companies ON Categories.Id = Companies.categoryId WHERE ([Name] LIKE '%' + @Name + '%') AND categoryId = CASE  @categoryId 
WHEN '-1'  THEN categoryId 
ELSE @categoryId 
END ORDER BY  Companies.curprice" onupdated="dsStocks_Updated">
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
            <td class="style4"  align ="right" colspan="2">
                            <%--To clear dialog message--%>
                <h3>
                    &nbsp;<asp:UpdatePanel ID="dialogUpdatePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                   <asp:Timer ID="dialogTimer" runat="server" Interval="2000" />

                    <asp:Label ID="lblConfirmation" runat="server" onload="lblConfirmation_Load" />
                    <asp:Label ID="lblErrorMessage" runat="server" ForeColor="#990000" />

                    </ContentTemplate>
                    </asp:UpdatePanel>   
                </h3>
                </td>
            </tr>
            <tr>
            <td class="style4"  align ="right">

      <p>
<%--         <asp:UpdatePanel ID="btnUpdatePanel" runat="server" UpdateMode="Always">
            <ContentTemplate>
                <asp:Timer ID="Timer1" runat="server" Interval="2000" />
            <asp:Button ID="btnRefresh" runat="server" CssClass="buttonStyle"  Text="Refresh" 
                    onclick="btnRefresh_Click"  />
       </ContentTemplate>
        </asp:UpdatePanel>--%>
        </p>

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
            <br />
    <br />
                     <asp:UpdatePanel ID="gvwUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Timer ID="gvwTimer" runat="server" Interval="2000" />
        <asp:GridView ID="gwBuyStocks" runat="server" 
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataSourceID="dsStocks" ForeColor="#333333" GridLines="None" 
            DataKeyNames="Id" onload="gwBuyStocks_Load" onprerender="gwBuyStocks_PreRender">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" ButtonType="Button" >
                <ControlStyle CssClass="buttonStyle" />
                </asp:CommandField>
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
        
                            </ContentTemplate>
                    </asp:UpdatePanel>   

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

