using System;
using System.Collections.Generic;
using System.Text;

namespace Exercise1
{
    class Rectangle : Shape1
    {

        public Rectangle()
        {
            GetData();
        }
        public void GetData()
        {
            
            Console.WriteLine("Enter length:");
            L = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter breadh:");
            B = Convert.ToInt32(Console.ReadLine());

        }
        public override double Area()
        {
            return L * B;
        }
        public override double Circumference()
        {
            return 2 * (L + B);
        }
    }
}
