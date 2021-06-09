using System;
using System.Collections.Generic;
using System.Text;

namespace Exersize7
{
    class User
    {
        private int pinNumber;
        private decimal balance;
       public User(int pinNumber, decimal balance = 1000m)
        {
            this.pinNumber = pinNumber;
            this.balance = balance;
        }
        public decimal GetBalance()
        {
            return balance;
        }
        public void Deposit(decimal amount)
        {
            balance += amount;
            Console.WriteLine($"Deposit Succeed. Current balance: {balance}");
        }
        public void WithDraw(decimal amount)
        {
            if (balance - amount >= 0)
            {
                balance -= amount;
                Console.WriteLine($"Withdrawing Succeed. Current balance: {balance}");
            }
            else
            {
                Console.WriteLine("Denied. Withdrawing amount over current balance");
                Console.WriteLine($"Current balance: {balance}");
            }
        }
    }
}
