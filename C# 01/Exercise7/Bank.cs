using System;
using System.Collections.Generic;
using System.Text;

namespace Exersize7
{
    class Bank
    {
        User u;
        public Bank(User u)
        {
            this.u = u;
            int opt = 0;
            Console.WriteLine("******** Welcome To ATM Service *********\n");
            while (opt != 4)
            {
                Console.WriteLine("1. Check Balance\n");
                Console.WriteLine("2. Withdraw Cash\n");
                Console.WriteLine("3. Deposit Cash\n");
                Console.WriteLine("4. Quit");
                Console.WriteLine("*****************************************");
                Console.WriteLine("Enter Your Choice:");
                opt = Convert.ToInt32(Console.ReadLine());


                switch (opt)
                {
                    case 1:
                        BalanceChecking();
                        break;
                    case 2:
                        Withdraw();
                        break;
                    case 3:
                        Deposit();
                        break;
                    case 4:
                        Console.WriteLine("Good bye!");
                        break;
                    default:
                        Console.WriteLine("Wrong input");
                        break;
                }
            }
        }
         void BalanceChecking()
        {
            Console.WriteLine($"Your Current Balance: {u.GetBalance()}");
        }
         void Withdraw()
        {
            Console.WriteLine("How much do you want to withdraw?");
            decimal amount = Convert.ToDecimal(Console.ReadLine());
            u.WithDraw(amount);
        }
         void Deposit()
        {
            Console.WriteLine("How much do you want to deposit?");
            decimal amount = Convert.ToDecimal(Console.ReadLine());
            u.Deposit(amount);
        }
    }
}
