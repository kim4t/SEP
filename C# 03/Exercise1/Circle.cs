using System;
using System.Collections.Generic;
using System.Text;

namespace Exercise1
{
    class Circle : Shape1
    {
        public Circle()
        {
            GetData();
        }
        public void GetData()
        {
            Console.WriteLine("Enter The Radious");
            R = Convert.ToInt32(Console.ReadLine());
        }
        public override double Area()
        {
            return Math.PI * Math.Pow(R, 2);
        }
        public override double Circumference()
        {
            return 2 * Math.PI * R;
        }
    }
}
