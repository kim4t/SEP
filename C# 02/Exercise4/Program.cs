using System;

namespace Exercise4
{
    class Program
    {
        static void Main(string[] args)
        {
            int[,] arr = new int[,] { { 1, 2, 3 }, { 3, 4, 5 }, { 6, 7, 8 } };
            Print(arr);
        }

        static void Print(int[,] arr)
        {

            int i, a = 0, b = 0;
            int row = arr.GetLength(0);
            int col = arr.GetLength(1);

            while (a < row && b < col)
            {
                for (i = b; i < col; ++i)
                    Console.Write(arr[a, i] + " ");
                a++;
                for (i = a; i < row; ++i)                
                    Console.Write(arr[i, col - 1] + " ");               
                col--;

                if (a < row)
                {
                    for (i = col - 1; i >= b; --i)                    
                        Console.Write(arr[row - 1, i] + " ");                    
                    row--;
                }
                if (b < col)
                {
                    for (i = row - 1; i >= a; --i)                    
                        Console.Write(arr[i, b] + " ");                    
                    b++;
                }
            }
        }
    
    }
}
