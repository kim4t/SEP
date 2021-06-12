using System;
using System.Collections.Generic;
namespace Exercise_3
{
    class Program
    {
        static void Main(string[] args)
        {
            var customers = CreateCustomers();

            Console.WriteLine("Customers:\n");
            foreach (Customer c in customers)
                Console.WriteLine(c);

        }
        static void VarTest()
        {
            var i = 43;
            var s = "...This is only a test...";
            var numbers = new[] { 4, 9, 16 };
            var complex = new SortedDictionary<string, List<DateTime>>();
        }
        static List<Customer> CreateCustomers()
        {
            return new List<Customer>() 
            { 
                new Customer { Name = "Taeho" },
                new Customer { Name = "Kim" } 
            };
        }
    }
    class Customer
    {
        public string Name { get; set; }
    }
}
