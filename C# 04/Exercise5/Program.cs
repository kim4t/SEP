using System;
using System.Collections.Generic;

namespace Exercise5
{
    class Program
    {
        
        static void Main(string[] args)
        {
            //var customers = CreateCustomers();

            //foreach (var c in FindCustomersByCity(customers, "London"))
            //    Console.WriteLine(c);

            var customers = CreateCustomers();
            var customerDictionary = new Dictionary<Customer, string>();

            foreach (var c in customers)
                customerDictionary.Add(c, c.Name.Split(' ')[1]);

            var matches = customerDictionary.FilterBy((customer, lastName) => lastName.StartsWith("A"));
            //The above line runs the query  
            Console.WriteLine("Number of Matches: {0}", matches.Count);


        }
        public static List<Customer> FindCustomersByCity( List<Customer> customers, string city)
        {
            return customers.FindAll(c => c.City == city);
        }

        static List<Customer> CreateCustomers()
        {
            return new List<Customer>()
            {
                new Customer { Name = "Taeho Kim", City = "Busan" },
                new Customer { Name = "Brandon Aman", City = "London" }
            };
        }
    }

    class Customer
    {
        public String Name { get; set; }
        public String City { get; set; }
    }
}
