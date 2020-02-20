<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" EnableEventValidation="false" Inherits="SQPProject.Default" %> 

 

<!DOCTYPE html> 

 

<html xmlns="http://www.w3.org/1999/xhtml"> 

<head runat="server"> 

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script> 

    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script> 

    <link rel="stylesheet" href="Default.css" /> 

    <link rel="shortcut icon" type="image/ico" href="/Image/Capture.PNG" /> 

    <title>PPC GridView</title> 

</head> 

<body> 

    

 

    <form id="form1" runat="server"> 

         <h1 id="OverviewHeading" runat="server">Proposal Overview</h1> 

         <h1 id="DetailsHeading" runat="server">Proposal Details</h1> 

    <div id="searchBar"> 

        <asp:TextBox ID="companyName" AutoComplete="off" Columns="17" runat="server" placeholder="Search Company Name" TextChanged="searchTextBox_TextChanged"  /> 

 

        <asp:Button ID="btnSearch" runat="server" Text="Search"  OnClick="searchTextBox_TextChanged"/> 

    </div> 

    

     

        <div id="container"> 

                 <asp:SqlDataSource ID='SqlDataSource1' runat="server" ConnectionString="<%$ ConnectionStrings:ppcdevConnectionString %>" SelectCommand=""></asp:SqlDataSource> 

 

            <asp:GridView ID="overviewGridView"  DataSourceID="SqlDataSource1" runat="server" AutoGenerateColumns="False" PageSize="25" AllowPaging="True" Display="true"  

 

                  OnSelectedIndexChanged="overviewGridView_SelectedIndexChanged" OnRowDataBound="GridView1_RowCreated" OnPageIndexChanging="overviewGridView_PageIndexChanging" CssClass="gridViewPager" 

 

                  Font-Underline="false" BorderColor="black" BorderStyle="Groove" BorderWidth="0" PagerSettings-Mode= "Numeric" ForeColor="#000000"  

 

                  PagerStyle-BackColor ="#9eb4ce" BackColor="#9eb4ce" horizontalalign="center" RowStyle-CssClass="even" RowStyle-VerticalAlign="Middle" > 

  

                 <RowStyle backColor="#87a2c3"   /> 

 

                 <AlternatingRowStyle backColor="#9eb4ce" /> 

        

 

                 <Columns> 

                    

                    <asp:BoundField DataField="proposalId" HeaderText="Proposal Id"  

                         SortExpression="proposalId" ItemStyle-CssClass="proposalId"/> 

 

                    <asp:BoundField DataField="companyName" HeaderText="Company Name"  

                         SortExpression="companyName" ItemStyle-CssClass="CompanyName"/> 

 

 

                    <asp:BoundField DataField="customerPostcode" HeaderText="customer Postcode"  

                         SortExpression="customerPostcode" ItemStyle-CssClass="customerPostcode"/> 

 

                    <asp:BoundField DataField="newconns" HeaderText="Newconns"  

                         SortExpression="newconns" ItemStyle-CssClass="newconns"/> 

 

                    <asp:BoundField DataField="migrations" HeaderText="Migrations"  

                         SortExpression="migrations" ItemStyle-CssClass="migrations"/> 

 

                    <asp:BoundField DataField="ports" HeaderText="Ports"  

                         SortExpression="ports" ItemStyle-CssClass="ports"/> 

 

                    <asp:BoundField DataField="upgrades" HeaderText="Upgrades"  

                         SortExpression="upgrades" ItemStyle-CssClass="upgrades"/> 

 

                    <asp:BoundField DataField="cashback" HeaderText="Cashback"  

                         SortExpression="cashback" ItemStyle-CssClass="cashback"/> 

 

                    <asp:BoundField DataField="equipSubsidy" HeaderText="Equip Subsidy"  

                         SortExpression="equipSubsidy" ItemStyle-CssClass="equipSubsidy"/> 

 

                    <asp:BoundField DataField="subsidyDesc" HeaderText="subsidyDesc"  

                         SortExpression="subsidyDesc" ItemStyle-CssClass="subsidyDesc"/> 

                     

                    <asp:BoundField DataField="TotalSubsidy" HeaderText="TotalSubsidy"  

                         SortExpression="TotalSubsidy" ItemStyle-CssClass="TotalSubsidy" /> 

                   

                     <%--<asp:HyperLinkField 

                      HeaderText="URL" 

                      Text="Click here to see this proposal in pccdev" 

                      DataTextFormatString="{0:c}" 

                      DataNavigateUrlFields="proposalId" 

                      DataNavigateUrlFormatString="http://intranet.vivio.co.uk/ppcdev/view_proposal2.php?proposalId={0}"  

                      Target="_blank"/>--%> 

 

                     <asp:TemplateField HeaderText="URL" ItemStyle-CssClass="Url"> 

                    <ItemTemplate> 

                   <input type="button" id="urlButton" onclick="window.open('http://intranet.vivio.co.uk/ppcdev/view_proposal2.php?proposalId=<%#Eval("proposalId")%>', '_blank')"  value="Click for PPC" /> 

                    </ItemTemplate> 

                    </asp:TemplateField> 

                     

 

                    <%--<asp:TemplateField HeaderText="URL"> 

                        <ItemTemplate> 

                            <asp:HyperLink CommandName="" ID="lnk" runat="server" AppendDataBoundItems="false" Target="_blank" Text="Click here to see this proposal in pccdev" 

                                NavigateUrl='http://intranet.vivio.co.uk/ppcdev/view_proposal2.php?proposalId={0}' DataTextFormatString="{0:c}" ItemStyle-CssClass="URL"></asp:HyperLink> 

                        </ItemTemplate> 

                    </asp:TemplateField>--%> 

 

            </Columns> 

        

           </asp:GridView> 

              

            <div> 

            <asp:button runat="server" ID="backButton" OnClick="backButton_Click" Text="Go Back to main screen"></asp:button> 

 

                <asp:SqlDataSource ID='SqlDataSource2' runat="server" ConnectionString="<%$ ConnectionStrings:ppcdevConnectionString %>" SelectCommand=""></asp:SqlDataSource> 

 

                    <asp:GridView  

 

                    ID="detailsGridView" DataSourceID='SqlDataSource2' runat="server" AutoGenerateColumns="False" PageSize="25" CssClass="gridViewPager"  

                         

                    Font-Underline="false" BorderColor="black" BorderStyle="Groove" BorderWidth="0" BackColor="#9eb4ce" self-align="center"> 

        

                        <RowStyle backColor="#87a2c3"  CssClass="oddRow" /> 

 

                        <AlternatingRowStyle backColor="#9eb4ce" CssClass="evenRow" /> 

 

                            <Columns> 

 

                                <asp:BoundField DataField="proposalId" HeaderText="ProposalId"  

                                 ReadOnly="True" SortExpression="proposalId" ItemStyle-CssClass="ProposalId"/> 

 

                                <asp:BoundField DataField="itemId" HeaderText="itemId"  

                                 SortExpression="itemId" ItemStyle-CssClass="itemId"/> 

 

                                <asp:BoundField DataField="itemName" HeaderText="itemName"  

                                 SortExpression="itemName" ItemStyle-CssClass="itemName"/> 

 

                                <asp:BoundField DataField="itemQty" HeaderText="itemQty"  

                                 SortExpression="itemQty" ItemStyle-CssClass="itemId"/> 

 

                                <asp:BoundField DataField="commEach" HeaderText="commEach"  

                                 SortExpression="commEach" ItemStyle-CssClass="commEach"/> 

 

                                <asp:BoundField DataField="total" HeaderText="total"  

                                 SortExpression="total" ItemStyle-CssClass="commEach"/> 

             

                        </Columns> 

        

               </asp:GridView> 

         </div> 

            </div> 

    </form> 

    

</body> 

</html> 

<script> 

    jQuery(document).ready(function () {

        jQuery('.js-wpv-archive-pagination-link, .js-wpv-pagination-link').removeAttr('title');

    });

</script> 