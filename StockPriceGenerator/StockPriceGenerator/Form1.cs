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
    {   //5 th digit of array specifies the strenght of upwards trend                                              
        //Company Category Velotility // parameters 1,2,3,4
        double[] lowValiotility =      { 1.123, 2.234, -2.223, -1.123, 1.545 };             //Velotility lv 1
        double[] mediumValiotility =   { 2.315, 3.525, -3.545, -2.332, 1.889 };             //Velotility lv 2
        double[] highValiotility =     { 3.110, 4.123, -3.178, -4.189, 2.585 };             //Velotility lv 3
        double[] veryHighValiotility = { 3.911, 5.525, -5.535, -3.945, 3.289 };             //Velotility lv 4

        double [] companyVelotility = { 1, 2, 3, 4 };

        Random rnd = new Random();
        Random varation = new Random();
        

       
        //Company Velotility 4 lv of Velotility  // parameters 1,2,3,4 // Generates down or up Trend
        //Small Up Trend     ++
        //Medium Up Trend    ++
        //Small Down Trend   --
        //Medium Down Trend  --




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
                    System.Threading.Thread.Sleep(2000);
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

                //range = new Random().Next(-(Int32.Parse(company.CompanyVolatility)), Int32.Parse(company.CategoryVolatility));
                //range = range / 100;
                

                ////////////////////////////////////////////////////////////////////////Category Velotility
                if (company.CategoryVolatility == "1")
                {
                    categoryIndex = lowValiotility[rnd.Next(5)];
                }
                else if (company.CategoryVolatility == "2")
                {
                    categoryIndex = mediumValiotility[rnd.Next(5)];
                }
                else if (company.CategoryVolatility == "3")
                {
                    categoryIndex = highValiotility[rnd.Next(5)];
                }
                else if (company.CategoryVolatility == "4")
                {
                    categoryIndex = veryHighValiotility[rnd.Next(5)];
                }
                else
                {
                    categoryIndex = veryHighValiotility[rnd.Next(5)];
                }
                ////////////////////////////////////////////////////////////////////////////Category Velotility

                ////////////////////////////////////////////////////////////////////////////Company Velotility
                //if (company.CompanyVolatility == "1")
                //{
                //    companyIndex = 1;
                //}
                //else if (company.CompanyVolatility == "2")
                //{
                //    companyIndex = 2;
                //}
                //else if (company.CompanyVolatility == "3")
                //{
                //    companyIndex = 3;
                //}
                //else if (company.CompanyVolatility == "4")
                //{
                //    companyIndex = 4;
                //}
                //else
                //{

                //}
                ////////////////////////////////////////////////////////////////////////////Company Velotility
                //range = new Random().Next(-(Int32.Parse(company.CompanyVolatility)), Int32.Parse(company.CategoryVolatility));
                //range = new Random();
                varationPercentage = varation.Next(-100,100);


                priceUpdate = ( ( Int32.Parse( company.CategoryVolatility )* categoryIndex ) + ( Int32.Parse(company.CategoryVolatility ) * ( varationPercentage)/100 ) );

                //rndVaration.rnd.Next(5)
                //priceUpdate = priceUpdate + float.Parse(company.Curprice) * (varation.Next(-15, 15)/10);

                company.Curprice = ( (float.Parse(company.Curprice) + priceUpdate)).ToString();

                //float.Parse(company.Curprice)).ToString();

                CompanyDB.UpdateCompanyPrice(company);
                System.Threading.Thread.Sleep(200);
                CompanyDB.InsertIntoHistory(company);
                System.Threading.Thread.Sleep(200);
            }
        }

        private void lvOfCompanies_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
