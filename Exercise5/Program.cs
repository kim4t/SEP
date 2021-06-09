using System;

namespace Exersize5
{
    class Program
    {
        static void Main(string[] args)
        {
            PrintBinaryTriangle();
        }
        static void PrintBinaryTriangle()
        {
            int row, lastNum = 0; 
            Console.WriteLine("Enter the number of Rows: ");
            row = Convert.ToInt32(Console.ReadLine());
            for(int i=0; i<row; i++)
            {
               for(int j = 0; j<=i ;j++ )
                {
                    if(lastNum == 0)
                    {
                        Console.Write(1);
                        lastNum = 1;
                    }
                    else
                    {
                        Console.Write(0);
                        lastNum = 0;
                    }
                }
                Console.WriteLine();
            }
        }
    }
}
