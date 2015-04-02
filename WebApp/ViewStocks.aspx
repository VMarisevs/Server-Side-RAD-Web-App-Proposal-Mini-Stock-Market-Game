<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ViewStocks.aspx.cs" Inherits="Guest_ViewStocks" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style4
        {
            height: 36px;
        }
        .style3
        {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        View Stocks
    </h1>
                
    <div>
        <h3>

        </h3>

        <p>
                               <%--  AJAX--%>
             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
             <ContentTemplate>
                <asp:Timer ID="Timer1" runat="server" Interval="6000" />
                <asp:FormView ID="FormView1" runat="server" DataSourceID="dsGraphs" >
<%--                    <EditItemTemplate>
                        Price:
                        <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price", "{0:c}") %>' />
                        <br />
                        Updated:
                        <asp:TextBox ID="updatedTextBox" runat="server" Text='<%# Bind("updated") %>' />
                        <br />
                        Name:
                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        price:
                        <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                        <br />
                        updated:
                        <asp:TextBox ID="updatedTextBox" runat="server" Text='<%# Bind("updated") %>' />
                        <br />
                        Name:
                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>--%>
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

    


                 <asp:Chart ID="Chart1" runat="server" DataSourceID="dsGraphs" Width="600px" 
                AlternateText="No data to display">

                <Series>
                    <asp:Series ChartType="Line" Name="Series1" YValueMembers="price" 
                        YValuesPerPoint="4" XValueMember="updated" Label="#VAL{C}" Color="red" BorderWidth="2">
                        <SmartLabelStyle CalloutLineWidth="5" />
                    </asp:Series>
                </Series>

                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1" BorderWidth="5">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>

  
             </ContentTemplate>
            </asp:UpdatePanel>
             

             



            
            

            
        </p>
        
        
        <p>
        </p>
        <p>
            <asp:SqlDataSource ID="dsGraphs" runat="server" 
                ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" 
                
                
                SelectCommand="SELECT TOP (20) StockHistory.price, StockHistory.updated, Companies.Name FROM StockHistory INNER JOIN Companies ON StockHistory.companyId = Companies.Id WHERE (StockHistory.companyId = CASE @companyId WHEN 'topCompany' THEN (SELECT TOP (1) Id FROM Companies ORDER BY curprice DESC) ELSE @companyId END) ORDER BY StockHistory.updated DESC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvwCompanies0" DefaultValue="10003" 
                        Name="companyId" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            &nbsp;</p>

    </div>
  

    <div style="float:left;width:70%;margin:0px;padding:0px">
      
    <p>
        <asp:SqlDataSource ID="dsCompanies" runat="server" ConnectionString="<%$ ConnectionStrings:GameConnectionString %>"
            SelectCommand="SELECT Companies.Id, Companies.Name, Companies.logo, Companies.Abbreviation, Companies.curprice, Companies.shareAmount, Categories.longName 
                            FROM Companies INNER JOIN Categories 
                            ON Companies.categoryId = Categories.Id 
                            WHERE ([Name] LIKE '%' + @Name + '%')
                            AND  categoryId = CASE  @categoryId 
                            WHEN '-1'  THEN  categoryId 
                            ELSE @categoryId 
                            END 

                            ORDER BY [Name] ">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtSearch" DefaultValue="%" Name="Name" PropertyName="Text" />
                <asp:ControlParameter ControlID="ddlCategories" DefaultValue="-1" Name="categoryId"
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsCategories" runat="server" ConnectionString="<%$ ConnectionStrings:GameConnectionString %>"
            SelectCommand="SELECT [longName], [Id] FROM [Categories] ORDER BY [longName]">
        </asp:SqlDataSource>
    </p>
    
        <table width ="80%"  class="style2">
        
            <tr>
                <td class="style4" align="right">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;
                 
                    <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>

                    <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search"
                        Style="margin-top: 4px" 
                        ForeColor="black" 
    font-size="1em" 
    BackColor="#E8E8E8"
    Font-Names="Tahoma"
    Width="150px"
    BorderColor="#00BFFF"
    BorderStyle="Solid"
    BorderWidth="2px" />

                    </td>
            </tr>
            <tr>
                <td class="style3" align="right">
                    &nbsp;
                    <asp:DropDownList ID="ddlCategories" runat="server" AutoPostBack="True" DataSourceID="dsCategories" CssClass="buttonStyle" BackColor="White"
                        DataTextField="longName" DataValueField="Id" AppendDataBoundItems="True"  Width="150px"
                         >
                        <asp:ListItem Value="-1">All</asp:ListItem>
                    </asp:DropDownList>
                    </td>
            </tr>
            <tr>
                <td class="style3" align="center" >
                 <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                 <ContentTemplate>
<%--                 <asp:Timer ID="Timer2" runat="server" Interval="6000" />--%>

                    <asp:GridView ID="gvwCompanies0" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" CellPadding="4" DataSourceID="dsCompanies" ForeColor="#333333"
                        GridLines="None" PageSize="5" Width="800px" Font-Names="Tahoma" 
                        DataKeyNames="Id">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" Visible="false"
                                SortExpression="Id" InsertVisible="False" ReadOnly="True">
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Logo" SortExpression="logo">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("logo") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageAlign="Middle" 
                                        ImageUrl='<%# Bind("logo","~/Images/Logos/{0}") %>' Width="150px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Name" SortExpression="Name" HeaderText="Name">
                            </asp:BoundField>
                            <asp:BoundField DataField="Abbreviation" HeaderText="Abbreviation" 
                                SortExpression="Abbreviation">
                            </asp:BoundField>
                            <asp:BoundField DataField="curprice" HeaderText="Current Price" 
                                SortExpression="curprice" DataFormatString="{0:c}" >
                            </asp:BoundField>
                            <asp:BoundField DataField="shareAmount" HeaderText="Shares Available" 
                                SortExpression="shareAmount" />
                            <asp:BoundField DataField="longName" HeaderText="Category" 
                                SortExpression="longName" />
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                        CommandName="Select" Text="Select"></asp:LinkButton>
                                </ItemTemplate>
                                <ControlStyle CssClass="buttonStyle" Font-Underline="False" Width="100px" />
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#008FBF" ForeColor="White" Font-Bold="True" />
                        <HeaderStyle BackColor="#00BFFF" Font-Bold="True" ForeColor="White" Height="30px" />
                        <PagerSettings Mode="NextPreviousFirstLast" />
                        <PagerStyle BackColor="#008FBF" ForeColor="White" HorizontalAlign="Center" Height="20px" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="40px" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
            </ContentTemplate>
            </asp:UpdatePanel>
                </td>
            </tr>
            
        </table>
            
      </div>
</asp:Content>
