using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Threading.Tasks;

namespace StockPriceGenerator
{
    public partial class Form1 : Form
    {

        private const int DELAY = 25000;
        private const int DELAY_BETWEEN_RECORDS = 200;

     double[,] trends = new double[,]
	{
	    { 1.123, 2.234, -2.223, -1.123, -1.545},   //Velotility lv 1  Down Trend small
	    {2.315, 3.525, -3.545, -2.332, 1.889},     //Velotility lv 2   Medium Up Trend
	    {3.110, 4.123, -3.178, -4.189, -2.585 },   //Velotility lv 3   High up
	    {3.911, 5.525, -5.535, -3.945, -3.289 }    //Velotility lv 4   Down Trend
	};



        double [] companyVelotility = { 1.235, 2.658, 2.697, 3.5489,3.1579 };

        Random rnd = new Random();
        Random varation = new Random();
        


        public Form1()
        {
            InitializeComponent();
        }
        static System.Windows.Forms.Timer myTimer = new System.Windows.Forms.Timer();
        private List<Company> companyList = new List<Company>();
        private bool isGenerating = true;

        private void Form1_Load(object sender, EventArgs e)
        {
           
        }

        private void refreshCompanyList() 
        {
            if (companyList.Count > 0) {
                for (int i = 0; i < companyList.Count; i++) 
                {
                    companyList.RemoveAt(i);
                }
            }

            try
            {
                companyList = CompanyDB.GetInvoicesDue();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, ex.GetType().ToString());
                this.Close();
            }

        }

        private void displayCompanyList()
        {
            try
            {

                lvOfCompanies.Items.Clear();
                companyList = CompanyDB.GetInvoicesDue();

                if (companyList.Count > 0)
                {
                    Company company;
                    for (int i = 0; i < companyList.Count; i++)
                    {
                        company = companyList[i];
                        lvOfCompanies.Items.Add(company.CompanyId);
                        lvOfCompanies.Items[i].SubItems.Add(company.CompanyName);
                        lvOfCompanies.Items[i].SubItems.Add(company.CompanyVolatility);
                        lvOfCompanies.Items[i].SubItems.Add(company.CategoryVolatility);
                        lvOfCompanies.Items[i].SubItems.Add(company.Curprice);
                    }
                }
                lvOfCompanies.Refresh();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, ex.GetType().ToString());
                this.Close();
            }
        }

        private void btnSwitch_Click(object sender, EventArgs e)
        {
                generatePrice();
            
        }


        private void generatePrice()
        {
            

            while (isGenerating)
             {                
                    displayCompanyList();
                    makeUpdate();
                    System.Threading.Thread.Sleep(DELAY);
             }
            
        }


        private void makeUpdate()
        {
            Company company;
            

            double priceUpdate = 0;
            double categoryIndex = 0;
            double varationPercentage;

            for (int i = 0; i < companyList.Count; i++)
            {

                company = companyList[i];

                
          

                ////////////////////////////////////////////////////////////////////////Category Velotility
                if (company.CategoryVolatility == "1")
                {
                    categoryIndex = trends[rnd.Next(4),rnd.Next(5)];
                }
                else if (company.CategoryVolatility == "2")
                {
                    categoryIndex = trends[rnd.Next(4), rnd.Next(5)];
                }
                else if (company.CategoryVolatility == "3")
                {
                    categoryIndex = trends[rnd.Next(4), rnd.Next(5)];
                }
                else if (company.CategoryVolatility == "4")
                {
                    categoryIndex = trends[rnd.Next(4), rnd.Next(5)];
                }
                else
                {
                    categoryIndex = trends[rnd.Next(4), rnd.Next(5)];
                }

                varationPercentage = varation.Next(-20,150);


                priceUpdate = ( ( Int32.Parse( company.CategoryVolatility )* categoryIndex ) + ( Int32.Parse(company.CategoryVolatility ) * ( varationPercentage)/100 ) );

            
                company.Curprice = ( (float.Parse(company.Curprice) + priceUpdate)).ToString();

              

                if (float.Parse(company.Curprice) < 0)
                {
                    //company.Curprice = "0.99";
                    company.Curprice = companyVelotility[rnd.Next(5)].ToString();

                }

               

                CompanyDB.UpdateCompanyPrice(company);
                System.Threading.Thread.Sleep(DELAY_BETWEEN_RECORDS);
                CompanyDB.InsertIntoHistory(company);
                System.Threading.Thread.Sleep(DELAY_BETWEEN_RECORDS);
            }
        }

        private void lvOfCompanies_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
