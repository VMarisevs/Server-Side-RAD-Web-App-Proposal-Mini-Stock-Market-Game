using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace StockPriceGenerator
{
    class Company
    {
        private string companyId;
        private string companyName;
        private string curprice;
      
        private string companyCategoryId;
        private string companyVolatility;

        private string categoryId;
        private string categoryName;
        private string categoryVolatility;

        public string CompanyId
        {
            get
            {
                return companyId;
            }
            set
            {
                companyId = value;
            }
        }

        public string CompanyName
        {
            get
            {
                return companyName;
            }
            set
            {
                companyName = value;
            }
        }

        public string Curprice
        {
            get
            {
                return curprice;
            }
            set
            {
                curprice = value;
            }
        }

        public string CompanyCategoryId
        {
            get
            {
                return companyCategoryId;
            }
            set
            {
                companyCategoryId = value;
            }
        }

        public string CompanyVolatility
        {
            get
            {
                return companyVolatility;
            }
            set
            {
                companyVolatility = value;
            }
        }

        public string CategoryId
        {
            get
            {
                return categoryId;
            }
            set
            {
                categoryId = value;
            }
        }

        public string CategoryName
        {
            get
            {
                return categoryName;
            }
            set
            {
                categoryName = value;
            }
        }

        public string CategoryVolatility
        {
            get
            {
                return categoryVolatility;
            }
            set
            {
                categoryVolatility = value;
            }
        }

        //-- end
     
    }
}
