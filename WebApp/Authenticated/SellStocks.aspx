﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SellStocks.aspx.cs" Inherits="Authenticated_SellStocks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style4
        {
            height: 36px;
            text-align: center;
        }
        .style3
        {
            width: 290px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="dsUserStocks" runat="server" 
        ConnectionString="<%$ ConnectionStrings:GameConnectionString %>" SelectCommand="SELECT        UserShares.shares, Companies.Id, Companies.Name, Companies.curprice
FROM          UserShares INNER JOIN
                     Companies ON UserShares.companyId = Companies.Id
                    WHERE UserShares.userId = @UserId AND [Name] LIKE '%' + @Name + '%' 
                     AND categoryId = CASE  @categoryId 
WHEN '-1'  THEN categoryId 
ELSE @categoryId 
END 
ORDER BY Companies.curprice DESC">
        <SelectParameters>
            <asp:Parameter Name="UserId" />
            <asp:ControlParameter ControlID="txtSearch" DefaultValue="%" Name="Name" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="ddlCategories" DefaultValue="" 
                Name="categoryId" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
        <asp:SqlDataSource ID="dsCategories" runat="server" ConnectionString="<%$ ConnectionStrings:GameConnectionString %>"
            SelectCommand="SELECT [Id], [longName] FROM [Categories] ORDER BY [longName]">
        </asp:SqlDataSource>
    <br />
        <table class="style1">
            <tr>
            <td class="style4"  align ="right" colspan="2">
                <h3>
                    <asp:UpdatePanel ID="dialogUpdatePanel" runat="server" UpdateMode="Conditional">
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
                &nbsp;</td>
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
style="margin:2px; text-align: right;">
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
        <asp:GridView ID="gvwUserStocks" runat="server" EmptyDataText="Go buy some stocks."
            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
            DataSourceID="dsUserStocks" ForeColor="#333333" GridLines="None" 
            DataKeyNames="Id" onprerender="gvwUserStocks_PreRender" 
                    onload="gvwUserStocks_Load">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" 
                    InsertVisible="False" ReadOnly="True" Visible="False" />
                <asp:BoundField DataField="Name" HeaderText="Company" 
                    SortExpression="Name" />
                <asp:BoundField DataField="shares" HeaderText="Available Shares" 
                    SortExpression="shareAmount" />
                <asp:BoundField DataField="curprice" HeaderText="Price" 
                    SortExpression="curprice" DataFormatString="{0:c}" />
                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="btnSell" runat="server"  onclick="btnSell_Click" 
                            Text="Sell Share" CssClass="buttonStyle"/>
                    </ItemTemplate>
                    <HeaderStyle Width="15px" />
                    <ItemStyle Width="15px" />
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
    </asp:Content>

