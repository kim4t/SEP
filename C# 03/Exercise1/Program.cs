using System;

namespace Exercise1
{
    class Program
    {
        static void Main(string[] args)
        {
            Shape1 rec = new Rectangle();
            Calculate(rec);
            Console.WriteLine();
            Shape1 cir = new Circle();
            Calculate(cir);
        }
        public static void Calculate(Shape1 S)
        {

            Console.WriteLine("Area : {0:0.0}", S.Area());
            Console.WriteLine("Circumference : {0:0.0}", S.Circumference());
        }
        
    }
}
