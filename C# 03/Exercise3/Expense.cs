using System;
using System.Collections.Generic;
using System.Text;

namespace Exercise3
{
    class Expense
    {
        public string Date { get; set; }
        public string Category { get; set; }
        public string Description { get; set; }
        public decimal Amount { get; set; }
        public Expense(string date, decimal amount, string description, string category)
        {
            AddExpense(date, amount, description, category);
        }

        public void AddExpense(string date, decimal amount, string description, string category) 
        {
            int d = Convert.ToInt32(date);
            int year = (d - (d % 10000))/10000;
            int month = (d % 10000) / 100;
            int day = d % 100;
            if (DateCheck(year, month, day))
            {
                Date = date;
                Amount = amount;
                Description = description;
                Category = category;
            }
            else
            {
                Console.WriteLine("Wrong input");
            }
        }
        public bool DateCheck(int y, int m, int d)
        {
            if (y < 1000 || y > 3000)
                return false;
            if (m < 1 || m > 12)
                return false;
            if (d < 1 || d > 31)
                return false;
            return true;
        }
    }
}
