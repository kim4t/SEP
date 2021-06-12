using System;

namespace Exercise3
{
    class Program
    {
        static void Main(string[] args)
        {
            string s= "12345678";
            int n = Convert.ToInt32(s);
            Console.WriteLine(n%100);
        }
    }
}
