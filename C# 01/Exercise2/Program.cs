using System;

namespace Exersize2
{

    class Arithmatic
    {
        double a,b;
        
        public double Addition()
        {
            return a + b;
        }
        public double Subtraction()
        {
            return a - b;
        }
        public double Multiplication()
        {
            return a * b;
        }
        public double Division()
        {
            return a / b;
        }
        public void Calculate()
        {
            Console.Write("Input num1: ");
            a = Convert.ToInt32(Console.ReadLine());
            Console.Write("Input num2: ");
            b = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Select calculation: 1. Addition  2.Substraction  3.Mulitiplication   4.Division");
            int op = Convert.ToInt32(Console.ReadLine());
            switch (op)
            {
                case 1: 
                    Console.WriteLine($"{a} + {b} = {Addition()}");
                    break;
                case 2:
                    Console.WriteLine($"{a} - {b} = {Subtraction()}");
                    break;
                case 3:
                    Console.WriteLine($"{a} * {b} = {Multiplication()}");
                    break;
                case 4:
                    Console.WriteLine($"{a} / {b} = {Division()}");
                    break;
                default:
                    Console.WriteLine("Wrong operator");
                    break;
            }
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            Arithmatic arithmatic = new Arithmatic();
            arithmatic.Calculate();
        }
    }
}
