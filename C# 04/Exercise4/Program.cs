using System;
using System.Collections.Generic;

namespace Exercise4
{
    class Program
    {
        static void Main(string[] args)
        {
            var customers = CreateCustomers();
            var addedCustomers = new List<Customer>
            {
                 new Customer(9)  { Name = "Paolo Accorti", City = "Torino" },
                 new Customer(10) { Name = "Diego Roel", City = "Madrid" }
            };
            var newCustomer = new Customer(10)
            {
                Name = "Diego Roel",
                City = "Madrid"
            };


            var updatedCustomers = customers.Append(addedCustomers);

            foreach (var c in updatedCustomers)
            {
                if (newCustomer.Compare(c))
                {
                    Console.WriteLine("The new customer was already in the list");
                    return;
                }

            }

            Console.WriteLine("The new customer was not in the list");

        }
        static List<Customer> CreateCustomers()
        {
            return new List<Customer>()
            {
                new Customer { Name = "Diego Roel" },
                new Customer {  City = "Diego Roel" }
            };
        }
    }
}
