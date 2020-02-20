using System;

using System.Configuration;

using System.Data;

using System.Data.SqlClient;

using System.Drawing;

using System.Linq;

using System.Web;

using System.Web.Security;

using System.Web.UI;

using System.Web.UI.HtmlControls;

using System.Web.UI.WebControls;

using System.Web.UI.WebControls.WebParts;

using System.Xml.Linq;







namespace SQPProject

{

    public partial class Default : System.Web.UI.Page

    {

        protected void Page_Load(object sender, EventArgs e)

        {





            if (!IsPostBack)

            {

                OverviewHeading.Visible = true;

                overviewGridView.Visible = true;

                companyName.Visible = true;

                btnSearch.Visible = true;

                detailsGridView.Visible = false;

                backButton.Visible = false;

                DetailsHeading.Visible = false;

                string search = companyName.Text;

                SqlDataSource1.SelectCommand = "SELECT TOP(100) proposalId, companyName, customerPostcode, newconns, migrations, ports, upgrades,cashback, equipSubsidy, subsidyDesc, cashback + equipSubsidy AS TotalSubsidy, Cast('http://intranet.vivio.co.uk/ppcdev/view_proposal2.php?proposalId=' + CAST(proposalId AS varchar(10)) AS xml) AS URL FROM dbo.proposals Where companyName LIKE '%" + search + "%' ORDER BY proposalId DESC";

                overviewGridView.DataBind();

            }

        }



        protected void searchTextBox_TextChanged(object sender, EventArgs e)

        {

            string search = companyName.Text;

            SqlDataSource1.SelectCommand = "SELECT TOP(100) proposalId, companyName, customerPostcode, newconns, migrations, ports, upgrades,cashback, equipSubsidy, subsidyDesc, cashback + equipSubsidy AS TotalSubsidy, Cast('http://intranet.vivio.co.uk/ppcdev/view_proposal2.php?proposalId=' + CAST(proposalId AS varchar(10)) AS xml) AS URL FROM dbo.proposals Where companyName LIKE '%" + search + "%' ORDER BY proposalId DESC";

            overviewGridView.DataBind();

        }



        protected void overviewGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)

        {

            string search = companyName.Text;

            overviewGridView.PageIndex = e.NewPageIndex;

            SqlDataSource1.SelectCommand = "SELECT TOP(100) proposalId, companyName, customerPostcode, newconns, migrations, ports, upgrades,cashback, equipSubsidy, subsidyDesc, cashback + equipSubsidy AS TotalSubsidy, Cast('http://intranet.vivio.co.uk/ppcdev/view_proposal2.php?proposalId=' + CAST(proposalId AS varchar(10)) AS xml) AS URL FROM dbo.proposals Where companyName LIKE '%" + search + "%' ORDER BY proposalId DESC";

            overviewGridView.DataBind();



        }



        protected void backButton_Click(object sender, EventArgs e)

        {

            OverviewHeading.Visible = true;

            overviewGridView.Visible = true;

            companyName.Visible = true;

            btnSearch.Visible = true;

            detailsGridView.Visible = false;

            backButton.Visible = false;

            DetailsHeading.Visible = false;

        }



        protected void GridView1_RowCreated(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)

        {

            if (e.Row.RowType == DataControlRowType.DataRow)

            {

                for (int i = 0; i <= 10; i++)

                {

                    e.Row.Cells[i].Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(overviewGridView, "Select$" + e.Row.RowIndex);

                    e.Row.Cells[i].ToolTip = "Click on the row for more details";

                }

                //e.Row.Attributes.Add("onMouseOver", "this.style.backgroundColor='#f1f3f5';this.style.cursor='pointer';"); 

                //e.Row.Attributes.Add("OnMouseOut", "this.style.backgroundColor='#9eb4ce'"); 



            }

        }



        protected void overviewGridView_SelectedIndexChanged(object sender, EventArgs e)

        {

            string f = overviewGridView.SelectedRow.Cells[0].Text.ToString();

            OverviewHeading.Visible = false;

            overviewGridView.Visible = false;

            companyName.Visible = false;

            btnSearch.Visible = false;

            detailsGridView.Visible = true;

            backButton.Visible = true;

            DetailsHeading.Visible = true;

            SqlDataSource2.SelectCommand = "SELECT Top(100) proposalId, itemId, itemName, itemQty, commEach, itemQty * commEach as total FROM dbo.proposal_items where proposalId =" + f;

        }

    }

}