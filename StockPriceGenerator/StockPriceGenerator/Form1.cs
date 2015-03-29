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
            float range;
            for (int i = 0; i < companyList.Count; i++)
            {

                company = companyList[i];

                range = new Random().Next(-(Int32.Parse(company.CompanyVolatility)), Int32.Parse(company.CategoryVolatility));
                range = range / 100;
                company.Curprice = (float.Parse(company.Curprice) * range + float.Parse(company.Curprice)).ToString();
                CompanyDB.UpdateCompanyPrice(company);
                System.Threading.Thread.Sleep(200);
                CompanyDB.InsertIntoHistory(company);
                System.Threading.Thread.Sleep(200);
            }
        }
    }
}
