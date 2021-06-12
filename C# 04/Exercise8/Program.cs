using System;
using System.Linq;
using System.Collections.Generic;

namespace Exercise8
{
    class Program
    {
        static void Main(string[] args)
        {
            Query();
        }
        static List<Store> CreateStores()
        {
            return new List<Store>
            {
                new Store { Name = "Jim’s Hardware",    City = "Berlin" },
                new Store { Name = "John’s Books",  City = "London" },
                new Store { Name = "Lisa’s Flowers",    City = "Torino" },
                new Store { Name = "Dana’s Hardware",   City = "London" },
                new Store { Name = "Tim’s Pets",    City = "Portland" },
                new Store { Name = "Scott’s Books",     City = "London" },
                new Store { Name = "Paula’s Cafe",  City = "Marseille" },
             };
        }
        static List<Customer> CreateCustomers()
        {
            return new List<Customer>()
            {
                new Customer { Name = "Taeho Kim", City = "Busan" , CustomerID = 1},
                new Customer { Name = "Brandon Aman", City = "London" , CustomerID = 2}
            };
        }


        static void Query()
        {
            var results = from c in CreateCustomers()
                          join s in CreateStores() on c.City equals s.City
                          group s by c.Name into g
                          let count = g.Count()
                          orderby count ascending
                          select new { CustomerName = g.Key, Count = count };

            foreach (var r in results)
                Console.WriteLine("{0}\t{1}", r.CustomerName, r.Count);


        }
    }
}
