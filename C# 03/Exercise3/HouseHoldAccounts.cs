using System;
using System.Collections.Generic;
using System.Text;

namespace Exercise3
{
    class HouseHoldAccounts
    {
        List<Expense> ExpenseList = new List<Expense>();

        public void ShowExpenses(string category, string from, string end) 
        {
            foreach  (Expense e in ExpenseList)
            {
                if(e.Category == category)               
                    if(Convert.ToInt32(e.Date)>=Convert.ToInt32(from))
                        if (Convert.ToInt32(e.Date) <= Convert.ToInt32(end))
                            Console.WriteLine(e.Amount);
            }
        }

        public void ShowExpenseByText(string text)
        {
            foreach (Expense e in ExpenseList)
            {
                if (e.Description.ToUpper().Contains(text.ToUpper()) || e.Category.ToUpper().Contains(text.ToUpper()))
                {
                    Console.WriteLine($"Date: {e.Date}");
                    Console.WriteLine($"Expense: {e.Amount}");
                    Console.WriteLine($"Description: {e.Description}");
                }             
            }
        }
        public void SortData()
        {
            ExpenseList.Sort((x, y) => x.Date.CompareTo(y.Date));
        }
        public void NormalizeDescriptions(Expense e)//7
        {
            e.Description.Trim().ToLower();
            char.ToUpper(e.Description[0]);
        }
    }
}
