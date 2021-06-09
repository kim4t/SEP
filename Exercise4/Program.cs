using System;

namespace Exersize4
{
    class Program
    {
        static void Main(string[] args)
        {
            PrintArmstrongNum();
        }
        static void PrintArmstrongNum()
        {
            int num1, num2;
            Console.WriteLine("Input first number: ");
            num1 = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Input second number: ");
            num2 = Convert.ToInt32(Console.ReadLine());
            for(int i=num1;i<=num2;i++)
            {
                int num = i;
                int armstrongNum = 0;
                while(num>0)
                {
                    armstrongNum += Convert.ToInt32(Math.Pow((num % 10),3));
                    num /= 10;
                }
                if(armstrongNum == i)
                    Console.WriteLine(i);
            }
        }
    }
}
