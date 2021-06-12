using System;
using System.Collections.Generic;
using System.Text;

namespace Exercise5
{
    class ComplexNumber
    {
        int real;
        int imaginary;
        public ComplexNumber(int num1, int num2)
        {
            real = num1;
            imaginary = num2;
        }
        public void SetImaginary(int n)
        {
            imaginary = n;
        }

        public double GetMagnitude()
        {
            return Math.Sqrt(Math.Pow(real, 2) + Math.Pow(imaginary, 2));
        }
        public void Add(ComplexNumber n)
        {
            real += n.real;
            imaginary += n.imaginary;
        }
        public string ToString()
        {
            string res = "<"+Convert.ToString(real)+","+Convert.ToString(imaginary)+">";
            return res;
        }
    }
}
