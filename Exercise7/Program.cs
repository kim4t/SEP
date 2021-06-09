using System;

namespace Exersize7
{
    class Program
    {
        
        static void Main(string[] args)
        {
            int pinNumber;
            Console.WriteLine("Enter Your Pin Number");
            pinNumber = Convert.ToInt32(Console.ReadLine());
            User u1 = new User(pinNumber);
            Bank bank = new Bank(u1);
        }
    }
}
