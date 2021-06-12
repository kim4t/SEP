using System;
using System.Collections.Generic;
using System.Text;

namespace Exercise4
{
    public static class Extensions
    {
        public static bool Compare(this Customer customer1, Customer customer2)
        {
            if (customer1.CustomerID == customer2.CustomerID &&
                customer1.Name == customer2.Name &&
                customer1.City == customer2.City)
            {
                return true;
            }

            return false;
        }
        public static List<T> Append<T>(this List<T> a, List<T> b)
        {
            var newList = new List<T>(a);
            newList.AddRange(b);
            return newList;
        }


    }
    public class Customer
    {
        public int CustomerID { get; set; }
        public string Name { get; set; }
        public string City { get; set; }

        public Customer(int i)
        {
            CustomerID = i;
        }
        public Customer() { }
    }
}
