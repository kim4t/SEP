using System;
using System.Collections;
namespace Exercise2
{
    class Program
    {
        static void Main(string[] args)
        {
            Solution s = new Solution();
            Console.WriteLine("Enter Array Size");
            int size = Convert.ToInt32(Console.ReadLine());
            int[] arr = new int[size];
            Console.WriteLine("Enter Values\t ex)1 2 3 4 5 1 2 3");
            string input = Console.ReadLine();
            string[] sArr =  input.Split(" ");
            if (size != sArr.Length)
                Console.WriteLine("Number of values are not equal to size of array");
            for (int i = 0; i < sArr.Length; i++)
            {
                arr[i] = Convert.ToInt32(sArr[i]);
            }

            Console.WriteLine($"Max Occurrence Number: {s.solution(arr)}");


        }
    }
}
