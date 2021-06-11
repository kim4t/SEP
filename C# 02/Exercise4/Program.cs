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
            for(int i=0;i<arr.GetLength(0);i++)
                for(int j=0;j< arr.GetLength(1); j++)
                    Console.Write($"{ arr[i,j]} ");
        }
    }
}
