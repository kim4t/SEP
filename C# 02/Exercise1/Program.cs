using System;

namespace Exercise1
{
    class Rectangle
    {
        public double Length { get; set; }
        public double Width { get; set; }
        public void GetData()
        {
            Console.WriteLine("enter length:");
            Length = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("enter width:");
            Width = Convert.ToDouble(Console.ReadLine());

        }
        public double GetArea()
        {
            return Length * Width;
        }
        public double GetPerimeter()
        {
            return 2 * (Length + Width);
        }
    }

        class Program
    {
        static void Main(string[] args)
        {
            Rectangle r = new Rectangle();
            r.GetData();
            Console.WriteLine($"Length: {r.Length}");
            Console.WriteLine($"Width: {r.Width}");
            Console.WriteLine($"Area: {r.GetArea()}");
            Console.WriteLine($"Perimeter: {r.GetPerimeter()}");

        }
    }
}
