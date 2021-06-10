using System;

namespace Exersize3
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Input string: ");
            string input = Console.ReadLine();
            printReverseString(input);
        }
        static void printReverseString(string s)
        {
            char[] charArr = s.ToCharArray();
            Array.Reverse(charArr);
            Console.WriteLine(new string(charArr));
        }
    }
}
