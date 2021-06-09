using System;

namespace Exercise6
{
    class Program
    {
        static void Main(string[] args)
        {
            printDiamond();
        }
        static void printDiamond()
        {
            int row = Convert.ToInt32(Console.ReadLine());
            for (int i = 0; i < row; i++)
            {
                for (int j = row; j > i+1; j--)
                {
                    Console.Write(" ");
                }
                for (int j = 0; j < 2 * i + 1; j++)
                {
                    Console.Write("*");
                }
                Console.WriteLine();
            }

            for (int i = 1; i < row; i++)
            {
                for (int j = 0; j < i; j++)
                {
                    Console.Write(" ");
                }

                for (int j = 2 * row - 1; j > 2 * i; j--)
                {
                    Console.Write("*");
                }
                Console.WriteLine();
            }
        }
    }
}
